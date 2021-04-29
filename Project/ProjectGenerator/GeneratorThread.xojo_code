#tag Class
Protected Class GeneratorThread
Inherits BKS_Thread
	#tag Event
		Sub Run()
		  // Initialize ui message
		  me.UpdateLabel("Preparing ActiveRecord")
		  me.Sleep(2)
		  
		  // Load template into memory
		  ReadTemplate
		  ReadTemplateUI
		  
		  // Progress calculation
		  CalculateProgress(9)
		  me.IncrementProgress
		  
		  // Prepare the document
		  if oProject.eProjectType = ProjectType.iOS then
		    PrepareiOS
		    
		  else
		    PrepareDocument
		    
		  end
		  me.IncrementProgress
		  
		  // Prepare ActiveRecord
		  PrepareActiveRecord
		  me.IncrementProgress
		  
		  // Swap placeholders into templates
		  PrepareTemplates
		  me.IncrementProgress
		  
		  // Add engine specific GetDatabase function
		  PrepareNamespace
		  me.IncrementProgress
		  
		  // Process table classes
		  GenerateTableClasses
		  me.IncrementProgress
		  
		  // Process UI
		  GenerateUI
		  me.IncrementProgress
		  
		  // Append extras
		  AppendExtras
		  me.UpdateProgress(0, 0)
		  
		  // Processing complete, ready to assemble
		  CompleteTemplate
		  
		  // Write file
		  WriteProjectFile
		  
		  // Final beat
		  me.Sleep(425)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AppendExtras()
		  // Nothing to generate, skip the Extras folder
		  if oProject.DataClass.bAddAuditTrail = false and marxnExtras.Ubound < 0 then return
		  
		  // Add a folder for Extras
		  var tsFolderID as String = GetGeneratedID
		  var txnFolder as XMLNode = GetFolderNode("Extras", tsFolderID)
		  oXML.DocumentElement.AppendChild(txnFolder)
		  
		  // Add AuditTrail library
		  if oProject.DataClass.bAddAuditTrail = true and moAuditTrail <> nil then
		    var txnAuditTrail as XMLNode = oXML.ImportNode(moAuditTrail.xnHead, true)
		    ReplaceObjectContainerID(txnAuditTrail, tsFolderID)
		    oXML.DocumentElement.AppendChild(txnAuditTrail)
		    
		    // Append the nodes
		    for each toChild as XMLNode in moAuditTrail.arxnChildren
		      var tsNode as String = toChild.ToString
		      tsNode = tsNode.ReplaceAll("DataFile", kPlaceholderNamespace)
		      
		      oXML.DocumentElement.AppendChild(oXML.NodeFromTemplate(tsNode))
		      
		    next toChild
		    
		  end
		  
		  // Add single node libraries
		  for each txnLibSource as XMLNode in marxnExtras
		    var tsNode as String = txnLibSource.ToString
		    tsNode = tsNode.ReplaceAll("DataFile", kPlaceholderNamespace)
		    
		    var txnLib as XMLNode = oXML.NodeFromTemplate(tsNode)
		    ReplaceObjectContainerID(txnLib, tsFolderID)
		    oXML.DocumentElement.AppendChild(txnLib)
		    
		  next txnLibSource
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CalculateProgress(tiExtraSteps as Integer)
		  // Clear?
		  miProgressCurrent = 0
		  
		  var tbCanGenerateUI as Boolean
		  tbCanGenerateUI = (oProject.eProjectType = ProjectType.Web or oProject.eProjectType = ProjectType.Desktop)
		  
		  var tiProgressMax as Integer = 2
		  
		  // Count the ui stuff individually
		  for each oTable as ARProject.TableData in oProject.DataClass.aroTables
		    if tbCanGenerateUI and oTable.bHasUI = true then
		      tiProgressMax = tiProgressMax + 1
		      
		    end
		    
		  next
		  
		  // Consider any extra steps
		  tiProgressMax = tiProgressMax + tiExtraSteps
		  
		  // Setup progress display
		  me.UpdateProgress(miProgressCurrent, tiProgressMax)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompleteSwapPlaceholders()
		  // Append replacements
		  var tarprSwap() as Pair
		  
		  tarprSwap.Append(new Pair(kPlaceholderNamespace, oProject.DataClass.sNamespace))
		  tarprSwap.Append(new Pair(kPlaceholderNamespace_ID, msNamespaceID))
		  
		  if oProject.eProjectType = ProjectType.iOS then
		    tarprSwap.Append(new Pair(kPlaceholderDBType, "Boolean"))
		    
		  else
		    if oProject.DataClass.bUseMBSSQLAdapter then
		      tarprSwap.Append(new Pair(kPlaceholderDBType, "SQLDatabaseMBS"))
		      tarprSwap.Append(new Pair(kPlaceholderPreparedStatement, "SQLPreparedStatementMBS"))
		      
		    else
		      tarprSwap.Append(new Pair(kPlaceholderDBType, oProject.eDBEngine.EngineClassName))
		      tarprSwap.Append(new Pair(kPlaceholderPreparedStatement, oProject.eDBEngine.PreparedStatementClassName))
		      
		    end
		    
		  end
		  
		  if oProject.eProjectType = ProjectType.Web then
		    tarprSwap.Append(new Pair("as new dlgTPConfirmDelete","as new " + GenerateControlName("TPConfirmDelete", UIType.DisplayWebDialog)))
		    tarprSwap.Append(new Pair("As dlgTPConfirmDelete.","as " + GenerateControlName("TPConfirmDelete", UIType.DisplayWebDialog) + "."))
		    
		  end
		  
		  tarprSwap.Append(new Pair(kPrefixType, CreatePrefixType))
		  tarprSwap.Append(new Pair(kPrefixArray, CreatePrefixArray))
		  tarprSwap.Append(new Pair(kPrefixSuffixArray, CreateSuffixArray))
		  
		  if oProject.eDBEngine = DBEngine.SQLite then
		    // SQLite Path
		    tarprSwap.Append(new Pair("%db_path%", oProject.fDatabase.NativePath))
		    
		    // Uncomment the encryption key
		    if oProject.bDatabaseEncrypted = true then
		      tarprSwap.Append(new Pair("// oLocalDB.EncryptionKey", "oLocalDB.EncryptionKey"))
		      
		    end
		    
		  else
		    // Server connection
		    tarprSwap.Append(new Pair("%template_host%", oProject.sDatabaseHost))
		    tarprSwap.Append(new Pair("%template_port%", Format(oProject.iDatabasePort, "#######")))
		    tarprSwap.Append(new Pair("%template_databasename%", oProject.sDatabaseName))
		    tarprSwap.Append(new Pair("%template_username%", oProject.sDatabaseUsername))
		    
		    // Set these all nil for now
		    tarprSwap.Append(new Pair("%SSLAuthority%", "nil"))
		    tarprSwap.Append(new Pair("%SSLAuthorityDirectory%", "nil"))
		    tarprSwap.Append(new Pair("%SSLCertificate%", "nil"))
		    tarprSwap.Append(new Pair("%SSLKey%", "nil"))
		    
		    // Replace connection type
		    if oProject.eDBEngine = DBEngine.Postgres and oProject.oSSLConfig <> nil then
		      tarprSwap.Append(new Pair("oLocalDB.SSLMode = PostgreSQLDatabase.SSLPrefer", _
		      "oLocalDB.SSLMode = " + CompleteSwapPlaceholders_PostgresSSLSetting))
		      
		    end
		    
		  end
		  
		  // Remove GMT set
		  if oProject.DataClass.bGMTOffsetZero = false then
		    tarprSwap.Append(new Pair("dt2.GMTOffset = 0", ""))
		    
		  end
		  
		  // Check for literals that should not be there
		  if  msOutput.InStr("DataFile") > 0 or _
		    msOutput.InStr("t_Table") > 0 or _
		    msOutput.InStr("PartId") > 0 then
		    break
		    
		  end
		  
		  // Perform replace
		  for each tprSwap as Pair in tarprSwap
		    msOutput = msOutput.ReplaceAll(tprSwap.Left, tprSwap.Right)
		    me.Sleep(2)
		    
		  next tprSwap
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CompleteSwapPlaceholders_PostgresSSLSetting() As String
		  // No SSL config
		  if oProject.oSSLConfig = nil then return ""
		  
		  // Get string of connection mode
		  var tarprModes() as Pair
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLDisable, "PostgreSQLDatabase.SSLDisable"))
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLAllow, "PostgreSQLDatabase.SSLAllow"))
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLPrefer, "PostgreSQLDatabase.SSLPrefer"))
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLRequire, "PostgreSQLDatabase.SSLRequire"))
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLVerifyCA, "PostgreSQLDatabase.SSLVerifyCA"))
		  tarprModes.Append(new Pair(PostgreSQLDatabase.SSLVerifyFull, "PostgreSQLDatabase.SSLVerifyFull"))
		  
		  for each tprThis as Pair in tarprModes
		    if tprThis.Left = oProject.oSSLConfig.iPostgresSSLMode then
		      return tprThis.Right
		      
		    end
		    
		  next tprThis
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompleteTemplate()
		  // Some of the hang up is the XML generation
		  me.UpdateLabel("Processing Project XML")
		  me.Sleep(2)
		  
		  // Default web page if necessary
		  if oProject.eProjectType = ProjectType.Web then
		    oXML.DocumentElement.AppendChild(oXML.NodeFromTemplate(kWebPageDefaultTemplate))
		    
		  end
		  
		  // Bring the meta over
		  for each xnMeta as XMLNode in arxnTemplateMeta
		    oXML.DocumentElement.AppendChild(oXML.ImportNode(xnMeta, true))
		    
		  next xnMeta
		  
		  // UIState
		  oXML.DocumentElement.AppendChild(oXML.NodeFromTemplate(kUIStateNode))
		  // oXML.DocumentElement.AppendChild(oXML.NodeFromTemplate(kUIStateNodeDebugUI))
		  
		  // Done, ToString
		  msOutput = oXML.ToString
		  
		  // Basic placeholders
		  CompleteSwapPlaceholders
		  
		  // Replace IDs needing to be generated
		  // This blows RegEX out of the water
		  var tarsIDSplit() as String = msOutput.Split("%generate_id%")
		  var tarsIDJoin() as String
		  var tiMaxIDs as Integer = tarsIDSplit.Ubound
		  
		  for ti as Integer = 0 to tiMaxIDs
		    tarsIDJoin.Append(tarsIDSplit(ti))
		    
		    if ti < tiMaxIDs then
		      tarsIDJoin.Append(GetGeneratedID)
		      
		    end
		    
		  next ti
		  
		  msOutput = Join(tarsIDJoin, "")
		  
		  // Done
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateClassProperty(toInfo as ARProject.ClassPropertyInfo, toTable as ARProject.TableData) As XMLNode
		  var txnProperty as XMLNode = oXML.CreateElement("Property")
		  
		  var txnPropertyName as XMLNode = oXML.CreateElement("ItemName")
		  txnPropertyName = txnPropertyName.AppendChild(oXML.CreateTextNode(toInfo.GetPropertyName))
		  txnProperty.AppendChild(txnPropertyName)
		  
		  txnProperty.AppendChild(oXML.CreateElement("Compatibility"))
		  
		  var arsAttributes() as String
		  arsAttributes.Append("DatabaseField = True")
		  
		  // Set foreign key flag
		  for each oFK as ARProject.ForeignKey in toTable.aroForeignKey
		    if oFK.sColumn = toInfo.sColumnName then
		      arsAttributes.Append("ForeignKey = True")
		      exit for oFK
		      
		    end
		    
		  next oFK
		  
		  // Attributes node
		  var txnAttributes as XMLNode = oXML.CreateElement("Attributes")
		  txnAttributes.AppendChild(oXML.CreateTextNode(Join(arsAttributes, ", ")))
		  txnProperty.AppendChild(txnAttributes)
		  
		  // Visible node
		  var txnVisible as XMLNode = oXML.CreateElement("Visible")
		  txnVisible.AppendChild(oXML.CreateTextNode("1"))
		  txnProperty.AppendChild(txnVisible)
		  
		  // TextEncoding
		  txnProperty.AppendChild(oXML.GetTextEncodingNode)
		  
		  // Item declaration
		  var tsDeclareType as String = toInfo.GetPropertyType(oProject.eProjectType, oProject.iProjectAPI)
		  var tsDeclare as String = toInfo.GetPropertyName + " as " + tsDeclareType
		  var txnDeclare as XMLNode = oXML.CreateElement("ItemDeclaration")
		  txnDeclare.AppendChild(oXML.CreateTextNode(tsDeclare))
		  txnProperty.AppendChild(txnDeclare)
		  
		  // Flags
		  var txnFlags as XMLNode = oXML.CreateElement("ItemFlags")
		  txnFlags.AppendChild(oXML.CreateTextNode("0"))
		  txnProperty.AppendChild(txnFlags)
		  
		  // Shared
		  var txnShared as XMLNode = oXML.CreateElement("Shared")
		  txnShared.AppendChild(oXML.CreateTextNode("0"))
		  txnProperty.AppendChild(txnShared)
		  
		  return txnProperty
		  
		  // arsOut.Append("<Property>")
		  // arsOut.Append("<ItemName>" + oInfo.sARColumnName + "</ItemName>")
		  // arsOut.Append("<Compatibility></Compatibility>")
		  // arsOut.Append("<Attributes>" + Join(arsAttributes, ", ") + "</Attributes>")
		  // arsOut.Append("<Visible>1</Visible>")
		  // arsOut.Append("<ItemSource>")
		  // arsOut.Append("<TextEncoding>134217984</TextEncoding>")
		  // arsOut.Append("<SourceLine>" + oInfo.sARColumnName + " As " + oInfo.sType + "</SourceLine>")
		  // arsOut.Append("<SourceLine></SourceLine>")
		  // arsOut.Append("</ItemSource>")
		  // arsOut.Append("<TextEncoding>134217984</TextEncoding>")
		  // arsOut.Append("<ItemDeclaration>" + oInfo.sARColumnName + " As " + oInfo.sType + "</ItemDeclaration>")
		  // arsOut.Append("<ItemFlags>0</ItemFlags>")
		  // arsOut.Append("<Shared>0</Shared>")
		  // arsOut.Append("</Property>")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreatePrefixArray() As String
		  if TPSettings.Get("kClassPrefixes", true) = false then
		    return kPrefixArrayUnused
		    
		  end
		  
		  var arsReplace() as String
		  
		  arsReplace.Append(TPSettings.Get("kDateTime", "dt"))
		  arsReplace.Append(TPSettings.Get("kString", "s"))
		  arsReplace.Append(TPSettings.Get("kDouble", "d"))
		  arsReplace.Append(TPSettings.Get("kBoolean", "b"))
		  arsReplace.Append(TPSettings.Get("kInteger", "i"))
		  arsReplace.Append(TPSettings.Get("kCurrency", "c"))
		  
		  // Private prefix support, if enabled duplicate each prefix with a private one too
		  if TPSettings.Get("EnablePrivatePrefixSupport", true) = true then
		    var sPrivatePrefix as String = TPSettings.Get("kPrivatePrefix", "m")
		    var iMax as Integer = arsReplace.Ubound
		    for i as Integer = 0 to iMax
		      arsReplace.Append(sPrivatePrefix + arsReplace(i))
		      
		    next i
		    
		  end
		  
		  // Apply quotes and filter empty values
		  for i as Integer = arsReplace.Ubound DownTo 0
		    var sValue as String = arsReplace(i)
		    
		    if sValue = "" then
		      arsReplace.Remove(i)
		      continue
		      
		    end
		    
		    arsReplace(i) = chr(34) + sValue + chr(34)
		    
		  next
		  
		  return kPrefixArrayReplace.ReplaceAll("%types%", Join(arsReplace, ", "))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreatePrefixType() As String
		  if TPSettings.Get("kClassPrefixes",true) and TPSettings.Get("kClassSuffixes",false) = false then
		    // Prefixes
		    return kPrefixTypeReplace.ReplaceAll("%type%", "1")
		    
		  elseif TPSettings.Get("kClassPrefixes",true) = false and TPSettings.Get("kClassSuffixes", false) then
		    // Suffixes
		    return kPrefixTypeReplace.ReplaceAll("%type%", "2")
		    
		  else
		    // None
		    return kPrefixTypeReplace.ReplaceAll("%type%", "0")
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSourceLine(tsLine as String) As XMLNode
		  var xnLine as XMLNode = oXML.CreateElement("SourceLine")'
		  xnLine.AppendChild(oXML.CreateTextNode(tsLine))
		  
		  return xnLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSuffixArray() As String
		  if TPSettings.Get("kClassSuffixes", true) = false then
		    return kPrefixSuffixArrayUnused
		    
		  end
		  
		  var arsReplace() as String
		  
		  arsReplace.Append(TPSettings.Get("kDateTimeSuffix", "_dt"))
		  arsReplace.Append(TPSettings.Get("kStringSuffix", "_s"))
		  arsReplace.Append(TPSettings.Get("kDoubleSuffix", "_d"))
		  arsReplace.Append(TPSettings.Get("kBooleanSuffix", "_b"))
		  arsReplace.Append(TPSettings.Get("kIntegerSuffix", "_i"))
		  arsReplace.Append(TPSettings.Get("kCurrencySuffix", "_c"))
		  
		  // Apply quotes and filter empty values
		  for i as Integer = arsReplace.Ubound DownTo 0
		    var sValue as String = arsReplace(i)
		    
		    if sValue = "" then
		      arsReplace.Remove(i)
		      continue
		      
		    end
		    
		    arsReplace(i) = chr(34) + sValue + chr(34)
		    
		  next
		  
		  return kPrefixSuffixArrayReplace.ReplaceAll("%types%", Join(arsReplace, ", "))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CustomizeClassTemplate(txnTemplate as XMLNode)
		  CustomizeClassTemplateConstants(txnTemplate)
		  CustomizeClassTemplateEvents(txnTemplate)
		  CustomizeClassTemplateMethods(txnTemplate)
		  CustomizeClassTemplateProperties(txnTemplate)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CustomizeClassTemplateConstants(txnTemplate as XMLNode)
		  for each toConstant as ARProject.CustomizationConstant in oProject.DataClass.CustomTemplate.aroConstants
		    var tsConstant as String = kTemplateConstant
		    tsConstant = tsConstant.ReplaceAll("%const_name%", toConstant.sName)
		    tsConstant = tsConstant.ReplaceAll("%const_value%", toConstant.sValue)
		    
		    // Type
		    select case toConstant.eDataType
		    case ARProject.CustomizationConstant.ConstantType.TypeBoolean
		      tsConstant = tsConstant.ReplaceAll("%const_type%", "3")
		      
		    case ARProject.CustomizationConstant.ConstantType.TypeColor
		      tsConstant = tsConstant.ReplaceAll("%const_type%", "4")
		      
		    case ARProject.CustomizationConstant.ConstantType.TypeNumber
		      tsConstant = tsConstant.ReplaceAll("%const_type%", "2")
		      
		    case ARProject.CustomizationConstant.ConstantType.TypeString
		      tsConstant = tsConstant.ReplaceAll("%const_type%", "0")
		      
		    end select
		    
		    // Scope and localized bits
		    select case toConstant.eScope
		    case ARProject.ItemScope.ScopePublic
		      if toConstant.bLocalized and toConstant.eDataType = ARProject.CustomizationConstant.ConstantType.TypeString then
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "64")
		        
		      else
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "65")
		        
		      end
		      
		    case ARProject.ItemScope.ScopeProtected
		      if toConstant.bLocalized and toConstant.eDataType = ARProject.CustomizationConstant.ConstantType.TypeString then
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "64")
		        
		      else
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "1")
		        
		      end
		      
		    case ARProject.ItemScope.ScopePrivate
		      if toConstant.bLocalized and toConstant.eDataType = ARProject.CustomizationConstant.ConstantType.TypeString then
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "97")
		        
		      else
		        tsConstant = tsConstant.ReplaceAll("%const_flags%", "33")
		        
		      end
		      
		    end select
		    
		    var txnConstant as XMLNode = txnTemplate.OwnerDocument.NodeFromTemplate(tsConstant)
		    txnTemplate.AppendChild(txnConstant)
		    
		  next toConstant
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CustomizeClassTemplateEvents(txnTemplate as XMLNode)
		  for each toEvent as ARProject.CustomizationEvent in oProject.DataClass.CustomTemplate.aroEvents
		    var tsEvent as String = kTemplateEvent
		    tsEvent = tsEvent.ReplaceAll("%event_name%", toEvent.sName)
		    tsEvent = tsEvent.ReplaceAll("%event_params%", toEvent.sParameters)
		    tsEvent = tsEvent.ReplaceAll("%event_result%", toEvent.sReturnType)
		    
		    var txnEvent as XMLNode = txnTemplate.OwnerDocument.NodeFromTemplate(tsEvent)
		    txnTemplate.AppendChild(txnEvent)
		    
		  next toEvent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CustomizeClassTemplateMethods(txnTemplate as XMLNode)
		  var txnDoc as XMLDocument = txnTemplate.OwnerDocument
		  
		  for each toMethod as ARProject.CustomizationMethod in oProject.DataClass.CustomTemplate.aroMethods
		    var txnMethod as XMLNode = txnDoc.CreateElement("Method")
		    
		    var txnName as XMLNode = txnDoc.CreateElement("ItemName")
		    txnName.AppendChild(txnDoc.CreateTextNode(toMethod.sName))
		    txnMethod.AppendChild(txnName)
		    
		    // Empty compatibility element
		    txnMethod.AppendChild(txnDoc.CreateElement("Compatibility"))
		    
		    // Visibile: 1
		    var txnVis as XMLNode = txnDoc.CreateElement("Visible")
		    txnVis.AppendChild(txnDoc.CreateTextNode("1"))
		    txnMethod.AppendChild(txnVis)
		    
		    // ItemSource
		    txnMethod.AppendChild(toMethod.GetItemSource(txnMethod))
		    
		    // TextEncoding
		    var txnEnc as XMLNode = txnDoc.CreateElement("TextEncoding")
		    txnEnc.AppendChild(txnDoc.CreateTextNode("134217984"))
		    txnMethod.AppendChild(txnEnc)
		    
		    // Empty
		    txnMethod.AppendChild(txnDoc.CreateElement("AliasName"))
		    
		    // Scope
		    var txnScope as XMLNode = txnDoc.CreateElement("ItemFlags")
		    
		    select case toMethod.eScope
		    case ARProject.ItemScope.ScopePublic
		      txnScope.AppendChild(txnDoc.CreateTextNode("0"))
		      
		    case ARProject.ItemScope.ScopeProtected
		      txnScope.AppendChild(txnDoc.CreateTextNode("1"))
		      
		    case ARProject.ItemScope.ScopePrivate
		      txnScope.AppendChild(txnDoc.CreateTextNode("33"))
		      
		    end select
		    
		    txnMethod.AppendChild(txnScope)
		    
		    // Shared
		    var txnShared as XMLNode = txnDoc.CreateElement("IsShared")
		    txnShared.AppendChild(txnDoc.CreateTextNode(if(toMethod.bShared, "1", "0")))
		    txnMethod.AppendChild(txnShared)
		    
		    // Params
		    var txnParams as XMLNode = txnDoc.CreateElement("ItemParams")
		    txnParams.AppendChild(txnDoc.CreateTextNode(toMethod.sParameters))
		    txnMethod.AppendChild(txnParams)
		    
		    // Result
		    var txnResult as XMLNode = txnDoc.CreateElement("ItemResult")
		    txnResult.AppendChild(txnDoc.CreateTextNode(toMethod.sReturnType))
		    txnMethod.AppendChild(txnResult)
		    
		    // Built, append!
		    txnTemplate.AppendChild(txnMethod)
		    
		  next toMethod
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CustomizeClassTemplateProperties(txnTemplate as XMLNode)
		  for each toProp as ARProject.CustomizationProperty in oProject.DataClass.CustomTemplate.aroProperties
		    var tsProp as String = kTemplateProperty
		    tsProp = tsProp.ReplaceAll("%prop_name%", toProp.sName)
		    tsProp = tsProp.ReplaceAll("%prop_definition%", toProp.SourceDefinition)
		    tsProp = tsProp.ReplaceAll("%prop_declaration%", toProp.ItemDeclaration)
		    
		    select case toProp.eScope
		    case ARProject.ItemScope.ScopePublic
		      tsProp = tsProp.ReplaceAll("%const_flags%", "0")
		      
		    case ARProject.ItemScope.ScopeProtected
		      tsProp = tsProp.ReplaceAll("%const_flags%", "1")
		      
		    case ARProject.ItemScope.ScopePrivate
		      tsProp = tsProp.ReplaceAll("%const_flags%", "33")
		      
		    end select
		    
		    tsProp = tsProp.ReplaceAll("%prop_shared%", if(toProp.bShared, "1", "0"))
		    
		    var txnProp as XMLNode = txnTemplate.OwnerDocument.NodeFromTemplate(tsProp)
		    txnTemplate.AppendChild(txnProp)
		    
		  next toProp
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateAutoCreateObjects(toTable as ARProject.TableData, txnTable as XMLNode)
		  // moForeignColumn = %private_foreigncolumn%
		  // oForeignColumn = %computed_foreigncolumn%
		  // iForeignColumnID = %foreigncolumn_id%
		  var tarsMultipleTables(), tarsSingleTables() as String
		  for each oFK as ARProject.ForeignKey in toTable.aroForeignKey
		    if oFK.bSelected = false then continue for oFK
		    
		    // Check duplicates
		    if tarsSingleTables.IndexOf(oFK.sForeignTable) > -1 then
		      if tarsMultipleTables.IndexOf(oFK.sForeignTable) < 0 then
		        tarsMultipleTables.Append(oFK.sForeignTable)
		        
		      end
		      
		    else
		      tarsSingleTables.Append(oFK.sForeignTable)
		      
		    end
		    
		  next oFK
		  
		  // Add Foreign object property
		  var tarsCreatedForeignTables() as String
		  for each oFK as ARProject.ForeignKey in toTable.aroForeignKey
		    if oFK.bSelected = false then continue for oFK
		    
		    var tbAsArray as Boolean = not (oFK.iObjectType = ARProject.ForeignKey.kSingle)
		    var tsObjectID as String = oFK.sForeignTable
		    
		    // Check for multiple key associations
		    if tarsMultipleTables.IndexOf(tsObjectID) > -1 then
		      tsObjectID = tsObjectID + "_" + oFK.sForeignColumn
		      
		    end
		    
		    var tsPrivateForeignColumn as String = GenerateAutoCreateObjectsName(tsObjectID, true, tbAsArray, true)
		    
		    // Check duplicates
		    if tarsCreatedForeignTables.IndexOf(tsPrivateForeignColumn) > -1 then
		      continue for oFK
		      
		    else
		      tarsCreatedForeignTables.Append(tsPrivateForeignColumn)
		      
		    end
		    
		    var tsObjectTemplate as String
		    if tbAsArray = false then
		      tsObjectTemplate = kComputedPropertyTemplateSingle
		      
		      if oProject.iProjectAPI = 2 then
		        tsObjectTemplate = tsObjectTemplate.ReplaceAll(".Ubound", ".LastRowIndex")
		        tsObjectTemplate = tsObjectTemplate.ReplaceAll("dim tsSQL as String", "var tsSQL as String")
		        
		      end
		      
		    else
		      if oProject.eProjectType = ProjectType.iOS then
		        tsObjectTemplate = kComputedPropertyTemplateLoadMethod_iOS
		        
		      else
		        if oProject.iProjectAPI = 1 then
		          tsObjectTemplate = kComputedPropertyTemplateLoadMethod
		          
		        elseif oProject.iProjectAPI = 2 then
		          tsObjectTemplate = kComputedPropertyTemplateLoadMethod_API2
		          
		        end
		        
		      end
		      
		    end
		    
		    // Process replacements
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%computed_foreigncolumn%", _
		    GenerateAutoCreateObjectsName(tsObjectID, false, false, true))
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%private_foreigncolumn_array%", _
		    GenerateAutoCreateObjectsName(tsObjectID, true, true, true))
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%foreigncolumn_class%", oFK.sForeignTable)
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%db_foreigncolumn_id%", oFK.sForeignColumn)
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%private_foreigncolumn%", tsPrivateForeignColumn)
		    
		    // Private property name based on AsArray
		    var tsPrivTemplate as String = kComputedPropertyTemplatePrivate
		    tsPrivTemplate = tsPrivTemplate.ReplaceAll("%foreigncolumn_class%", oFK.sForeignTable)
		    if tbAsArray = false then
		      tsPrivTemplate = tsPrivTemplate.ReplaceAll("%private_foreigncolumn%", _
		      GenerateAutoCreateObjectsName(tsObjectID, true, false, true))
		      
		    else
		      tsPrivTemplate = tsPrivTemplate.ReplaceAll("%private_foreigncolumn%", _
		      GenerateAutoCreateObjectsName(tsObjectID, true, true, true) + "()")
		      
		    end
		    
		    // Get Foreign Key property
		    var toForeignTable as ARProject.TableData = oProject.DataClass.TableByName(oFK.sForeignTable)
		    if toForeignTable = nil then
		      var ex as new GeneratorException
		      ex.Message = "No Foreign Table: " + toTable.sTableName + " references " + oFK.sForeignTable + " but that table does not exist."
		      raise ex
		      
		    end
		    
		    var toForeignProperty as ARProject.ClassPropertyInfo = toForeignTable.PropertyByName(oFK.sForeignColumn)
		    if toForeignProperty = nil then
		      var ex as new GeneratorException
		      ex.Message = "No Foreign Property: " + toTable.sTableName + " references " + oFK.sForeignTable + _
		      "." + oFK.sForeignColumn + " but that column does not exist."
		      raise ex
		      
		    end
		    
		    var toThisTableProperty as ARProject.ClassPropertyInfo = toTable.PropertyByName(oFK.sColumn)
		    if toThisTableProperty = nil then
		      var ex as new GeneratorException
		      ex.Message = "No Local Property: " + oFK.sTable + " references " + oFK.sColumn + " but that column does not exist."
		      raise ex
		      
		    end
		    
		    // Replace for String/GUID FK
		    if toThisTableProperty.eFieldType = ARProject.FieldType.FieldString then
		      tsObjectTemplate = tsObjectTemplate.ReplaceAll("str(self.%foreigncolumn_id_name%)", "self.%foreigncolumn_id_name%")
		      tsObjectTemplate = tsObjectTemplate.ReplaceAll("self.%foreigncolumn_id_name%.ToText", "self.%foreigncolumn_id_name%")
		      tsObjectTemplate = tsObjectTemplate.ReplaceAll("%foreigncolumn_id_name% = 0", "%foreigncolumn_id_name% = """"")
		      tsObjectTemplate = tsObjectTemplate.ReplaceAll("%foreigncolumn_id_name% = value.ID", "%foreigncolumn_id_name% = value.GUID")
		      
		    end
		    
		    // Replace foreign key property actual value
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%foreigncolumn_id_name%", toThisTableProperty.GetPropertyName)
		    tsObjectTemplate = tsObjectTemplate.ReplaceAll("%foreignproperty_name%", toForeignProperty.GetPropertyName)
		    tsPrivTemplate = tsPrivTemplate.ReplaceAll("%foreigncolumn_id_name%", toThisTableProperty.GetPropertyName)
		    tsPrivTemplate = tsPrivTemplate.ReplaceAll("%foreignproperty_name%", toForeignProperty.GetPropertyName)
		    
		    // Add to XML
		    var toNode as XMLNode = oXML.NodeFromTemplate(tsObjectTemplate)
		    txnTable.AppendChild(toNode)
		    
		    var toPrivNode as XMLNode = oXML.NodeFromTemplate(tsPrivTemplate)
		    txnTable.AppendChild(toPrivNode)
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateAutoCreateObjectsName(tsBase as String, tbPrivate as Boolean, tbArray as Boolean, tbObject as Boolean) As String
		  var tarsPrefixes(), tarsSuffixes() as String
		  
		  // Must always add to the private property to avoid collisions
		  if tbPrivate = true then
		    tarsPrefixes.Append(TPSettings.Get("kPrivatePrefix", "m"))
		    tarsSuffixes.Append(TPSettings.Get("kPrivatePrefix", "_priv"))
		    
		  end
		  
		  if tbArray = true then
		    tarsPrefixes.Append(TPSettings.Get("kArray", "ar"))
		    tarsSuffixes.Insert(0, TPSettings.Get("kArraySuffix", "_ar"))
		    
		  end
		  
		  if tbObject = true then
		    tarsPrefixes.Append(TPSettings.Get("kObject", "o"))
		    tarsSuffixes.Insert(0, TPSettings.Get("kObjectSuffix", "_o"))
		    
		  end
		  
		  // Build
		  if TPSettings.Get("kClassPrefixes", true) then
		    return Join(tarsPrefixes, "") + tsBase
		    
		  elseif TPSettings.Get("kClassSuffixes", false) then
		    return tsBase + Join(tarsSuffixes, "")
		    
		  else
		    if tbPrivate = true then
		      return "ThePrivate" + tsBase
		      
		    else
		      return "The" + tsBase
		      
		    end
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateTableClasses()
		  me.UpdateLabel("Generating Classes")
		  
		  for each toTable as ARProject.TableData in oProject.DataClass.aroTables
		    if toTable.bSelected = false then continue
		    
		    // Generate the start of this class XML
		    var tsTableXML as String = msClassTemplate
		    tsTableXML = tsTableXML.ReplaceAll(kPlaceholderTableName, toTable.sTableName)
		    
		    // Table or view?
		    if toTable.bView = false then
		      tsTableXML = tsTableXML.ReplaceAll(kPlaceholderTableViewSuper, "ActiveRecordBase")
		      
		    else
		      tsTableXML = tsTableXML.ReplaceAll(kPlaceholderTableViewSuper, "ActiveRecordView")
		      
		    end
		    
		    // Replace default sort by
		    for tiField as Integer = 0 to toTable.aroFields.Ubound
		      if toTable.aroFields(tiField).bInitialSortField then
		        tsTableXML = tsTableXML.ReplaceAll("{default_orderby_field}", toTable.aroFields(tiField).sColumnName)
		        exit for tiField
		        
		      end
		      
		    next tiField
		    
		    var toUniqueField as ARProject.ClassPropertyInfo
		    var txnTable as XMLNode = oXML.NodeFromTemplate(tsTableXML)
		    
		    // Add the properties
		    for each toPropInfo as ARProject.ClassPropertyInfo in toTable.aroFields
		      var xnProp as XMLNode = CreateClassProperty(toPropInfo, toTable)
		      txnTable.AppendChild(xnProp)
		      
		      // Track the unique field
		      if toPropInfo.bMustBeUnique then
		        toUniqueField = toPropInfo
		        
		      end
		      
		    next
		    
		    // Handle the Unique field / IsDuplicate
		    GenerateTableClassesProcessUniqueField(toTable, toUniqueField, txnTable)
		    
		    // Remove features not in views
		    if toTable.bView = true then
		      RemoveAuditEvents(txnTable)
		      RemoveFindByID(txnTable)
		      
		    end
		    
		    // Auto create objects
		    if toTable.bGenerateAutoObjects = true then
		      GenerateAutoCreateObjects(toTable, txnTable)
		      
		    end
		    
		    oXML.DocumentElement.AppendChild(txnTable)
		    
		  next toTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateTableClassesProcessUniqueField(toTable as ARProject.TableData, toUniqueField as ARProject.ClassPropertyInfo, txnTable as XMLNode)
		  var txnIsDupe as XMLNode = txnTable.GetMethodNamed("IsDuplicate")
		  
		  if toUniqueField = nil then
		    // No unique, remove IsDuplicate
		    txnTable.RemoveChild(txnIsDupe)
		    
		  else
		    // Find Primary Key
		    var tsPrimaryKey as String
		    for each toProp as ARProject.ClassPropertyInfo in toTable.aroFields
		      if toProp.bIsPrimary = true then
		        tsPrimaryKey = toProp.sColumnName
		        exit for toProp
		        
		      end
		      
		    next toProp
		    
		    // Swap placeholders
		    var tsTemplate as String = txnIsDupe.ToString
		    tsTemplate = tsTemplate.ReplaceAll("%unique_field%", toUniqueField.sColumnName)
		    tsTemplate = tsTemplate.ReplaceAll("%primary_key%", tsPrimaryKey)
		    
		    var txnFinal as XMLNode = txnIsDupe.OwnerDocument.NodeFromTemplate(tsTemplate)
		    
		    txnTable.ReplaceChild(txnFinal, txnIsDupe)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateUI()
		  // No iOS UI
		  if oProject.eProjectType = ProjectType.Console then return
		  
		  // No iOS UI
		  if oProject.eProjectType = ProjectType.iOS then return
		  
		  // Is any UI enabled?
		  if oProject.DataClass.aroTables.HasUI = false then return
		  
		  me.UpdateLabel("Generating User Interface")
		  
		  // Create and retain UI folder
		  var tsUIFolderID as String = GenerateUISetupFolder
		  
		  for each toTable as ARProject.TableData in oProject.DataClass.aroTables
		    if toTable.bHasUI = false then continue for toTable
		    
		    // Progress
		    me.IncrementProgress
		    
		    // Create folder
		    var tsTableFolderID as String = GetGeneratedID
		    var txnTableFolder as XMLNode = GetFolderNode(toTable.sTableName, tsTableFolderID, tsUIFolderID)
		    oXML.DocumentElement.AppendChild(txnTableFolder)
		    
		    // Process
		    var toTableUI as new ProjectGenerator.TableUI
		    toTableUI.oProject = oProject
		    toTableUI.oTable = toTable
		    toTableUI.oUI = moUI
		    toTableUI.sTableFolderID = tsTableFolderID
		    toTableUI.xnLocalization = xnLocalizationModule
		    
		    var tarxnUI() as XMLNode = toTableUI.GetUINodes
		    
		    for each txnUI as XMLNode in tarxnUI
		      var txnLocalUI as XMLNode = oXML.ImportNode(txnUI, true)
		      
		      // Can't generate code on the XML until it's local to the working document
		      GenerateUICode(toTable, txnLocalUI)
		      
		      oXML.DocumentElement.AppendChild(txnLocalUI)
		      
		    next txnUI
		    
		  next toTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateUICode(toTable as ARProject.TableData, txnUI as XMLNode)
		  // Can't generate code on the XML until it's local to the working document
		  var tsUIName as String = GetObjectName(txnUI)
		  
		  var tsAddEditName as String = GenerateControlName(toTable.sTableName + "AddEdit", UIType.DisplayContainer)
		  var tsListName as String = GenerateControlName(toTable.sTableName + "List", UIType.DisplayContainer)
		  var tsViewName as String = GenerateControlName(toTable.sTableName + "View", UIType.DisplayContainer)
		  
		  // Setup generator
		  var toGenerator as new ProjectGenerator.CodeGenerator
		  toGenerator.oProject = oProject
		  toGenerator.oTable = toTable
		  toGenerator.xnUI = txnUI
		  
		  if tsUIName.InStr(tsAddEditName) > 0 then
		    // AddEdit container
		    toGenerator.eProcess = ProjectGenerator.CodeGenerator.ProcessType.AddEdit
		    
		  elseif tsUIName.InStr(tsListName) > 0 then
		    // List container
		    toGenerator.eProcess = ProjectGenerator.CodeGenerator.ProcessType.List
		    
		  elseif tsUIName.InStr(tsViewName) > 0 then
		    // View container
		    toGenerator.eProcess = ProjectGenerator.CodeGenerator.ProcessType.View
		    
		  end
		  
		  // Thundercats, go!
		  toGenerator.Perform
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateUISetupFolder() As String
		  // Create UI folder
		  var tsUIFolderID as String = GetGeneratedID
		  var txnUIFolder as XMLNode = GetFolderNode("UI", tsUIFolderID)
		  oXML.DocumentElement.AppendChild(txnUIFolder)
		  
		  // Create Dependencies folder
		  var tsDepID as String = GetGeneratedID
		  var txnDepFolder as XMLNode = GetFolderNode("Dependencies", tsDepID, tsUIFolderID)
		  oXML.DocumentElement.AppendChild(txnDepFolder)
		  
		  // Bring over dependencies
		  for each txnBlock as XMLNode in moUI.arxnChildren
		    var txnDependency as XMLNode = oXML.ImportNode(txnBlock, true)
		    var tsName as String = GetObjectName(txnDependency)
		    
		    if tsName = "Strings" then
		      // Track localization module
		      ReplaceObjectContainerID(txnDependency, tsUIFolderID)
		      xnLocalizationModule = txnDependency
		      
		    else
		      // Put in Dependencies folder
		      ReplaceObjectContainerID(txnDependency, tsDepID)
		      
		    end
		    
		    // Add to doc
		    oXML.DocumentElement.AppendChild(txnDependency)
		    
		  next txnBlock
		  
		  return tsUIFolderID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFolderNode(tsName as String, tsFolderID as String, tsParent as String = "0") As XMLNode
		  var tsTemplate as String = kFolderTemplate.ReplaceAll("%generate_id%", tsFolderID)
		  tsTemplate = tsTemplate.ReplaceAll("%folder_name%", tsName)
		  tsTemplate = tsTemplate.ReplaceAll("%container_id%", tsParent)
		  
		  var txnFolder as XMLNode = oXML.NodeFromTemplate(tsTemplate)
		  return txnFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetGeneratedID() As String
		  // Start high per Norman
		  if miGeneratedIDLastIssued = -1 then
		    miGeneratedIDLastIssued = Microseconds
		    
		  end
		  
		  // Increment
		  miGeneratedIDLastIssued = miGeneratedIDLastIssued + 1
		  
		  // Stringify
		  return Format(miGeneratedIDLastIssued, "#########")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IncrementProgress()
		  miProgressCurrent = miProgressCurrent + 1
		  me.UpdateProgress(miProgressCurrent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareActiveRecord()
		  // Set up TP_ActiveRecord
		  var txnActiveRecord as XMLNode = oXML.ImportNode(moActiveRecordLibrary.xnHead, true)
		  
		  // Set constants except iOS
		  if oProject.eProjectType <> ProjectType.iOS then
		    var tiARMax as Integer = txnActiveRecord.ChildCount - 1
		    for tiAR as Integer = 0 to tiARMax
		      var xnThis as XMLNode = txnActiveRecord.Child(tiAR)
		      
		      if xnThis.Name = "Constant" then
		        var tsValue as String = "False"
		        
		        var tiConstMax as Integer = xnThis.ChildCount - 1
		        for tiConst as Integer = 0 to tiConstMax
		          var txnConst as XMLNode = xnThis.Child(tiConst)
		          select case txnConst.Name
		          case "ItemName"
		            // Determine which constant it is and set up the value
		            select case txnConst.FirstChild.Value
		            case "kConfigUseCubeDatabase"
		              if oProject.eDBEngine = DBEngine.CubeSQL then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseMSSQLServer"
		              if oProject.eDBEngine = DBEngine.MSSQL and not oProject.DataClass.bUseMBSSQLAdapter then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseMSSQLServerMBS"
		              // and sqlmbs
		              if oProject.eDBEngine = DBEngine.MSSQL and oProject.DataClass.bUseMBSSQLAdapter then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseMySQLCommunityServer"
		              if oProject.eDBEngine = DBEngine.MySQL then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseODBC"
		              if oProject.eDBEngine = DBEngine.ODBC then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUsePostgreSQLDatabase"
		              if oProject.eDBEngine = DBEngine.Postgres then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseSQLiteDatabase"
		              if oProject.eDBEngine = DBEngine.SQLite then
		                tsValue = "True"
		                
		              end
		              
		            case "kConfigUseVSQLiteDatabase"       // Not used
		              // if oProject.eDBEngine = DBEngine.CubeSQL then
		              // // tsValue = "True"
		              // 
		              // end
		              
		            case else
		              // Not anything we want to touch
		              continue for tiAR
		              
		            end select
		            
		          case "ItemDef"
		            // Set the definition
		            txnConst.FirstChild.Value = tsValue
		            
		          end select
		          
		        next tiConst
		        
		      elseif xnThis.Name = "Method" then
		        // Replace CubeSQL PreparedStatement methods
		        if oProject.eDBEngine = DBEngine.CubeSQL then
		          if xnThis.FirstChild = nil or xnThis.FirstChild.FirstChild = nil then continue for tiAR
		          select case xnThis.FirstChild.FirstChild.Value
		          case "SQLExecuteRaiseOnError"
		            if xnThis.ToString.InStr("extends stmt as PreparedSQLStatement, db as Database") > 0 then
		              // replace with cubesql
		              txnActiveRecord.Insert(oXML.NodeFromTemplate(kCubeSQLExecuteTemplate), xnThis)
		              txnActiveRecord.RemoveChild(xnThis)
		              
		            end
		            
		          case "SQLSelectRaiseOnError"
		            if xnThis.ToString.InStr("extends stmt as PreparedSQLStatement, db as Database") > 0 then
		              txnActiveRecord.Insert(oXML.NodeFromTemplate(kCubeSQLSelectTemplate), xnThis)
		              txnActiveRecord.RemoveChild(xnThis)
		              
		            end
		            
		          end select
		          
		        end
		        
		      end
		      
		    next tiAR
		    
		  end
		  
		  // Copy in TP_ActiveRecord
		  oXML.DocumentElement.AppendChild(txnActiveRecord)
		  
		  for each toChild as XMLNode in moActiveRecordLibrary.arxnChildren
		    var txnChild as XMLNode = oXML.ImportNode(toChild, true)
		    select case txnChild.FirstChild.FirstChild.Value
		    case "Base"
		      // Look for TP_ActiveRecord.Base to setup AuditTrail options
		      PrepareActiveRecordBaseAuditTrail(txnChild)
		      
		    end select
		    
		    // Append the node
		    oXML.DocumentElement.AppendChild(txnChild)
		    
		  next toChild
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareActiveRecordBaseAuditTrail(txnBase as XMLNode)
		  // Set up audit trail options
		  for tiChild as Integer = (txnBase.ChildCount - 1) downto 0
		    var txnMethodNode as XMLNode = txnBase.Child(tiChild)
		    
		    select case txnMethodNode.Name
		    case "Method"
		      select case txnMethodNode.FirstChild.FirstChild.Value
		      case "BuildChangeLog"
		        // Remove BuildChangeLog
		        if oProject.DataClass.bAddAuditTrail = false then
		          txnBase.RemoveChild(txnMethodNode)
		          
		        end
		        
		      case "Save"
		        // Remove comment and line
		        if oProject.DataClass.bAddAuditTrail = false then
		          for tiMethodNodeChild as Integer = (txnMethodNode.ChildCount - 1) downto 0
		            var txnMethodNodeChild as XMLNode = txnMethodNode.Child(tiMethodNodeChild)
		            if txnMethodNodeChild.Name = "ItemSource" then
		              for tiSourceLine as Integer = (txnMethodNodeChild.ChildCount - 1) downto 0
		                var txnLine as XMLNode = txnMethodNodeChild.Child(tiSourceLine)
		                var tsLine as String = if(txnLine.ChildCount > 0, txnLine.FirstChild.Value, "")
		                
		                select case tsLine
		                case "// ARGen Audit Trail", _
		                  "m_dictOrigValues = TP_AuditTrail.CloneDictionary(m_dictSavedPropertyValue)"
		                  txnMethodNodeChild.RemoveChild(txnLine)
		                  
		                end select
		                
		              next tiSourceLine
		              
		            end
		            
		          next tiMethodNodeChild
		          
		        end
		        
		      end select
		      
		    end select
		    
		  next tiChild
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareAppObjectNode()
		  // App object
		  var tsAppTemplate as String = kAppObjectTemplate
		  var tsAppObjectType as String
		  
		  var tsOpenEventName as String = "Open"
		  var tsOpenEventSignature as String = "Sub Open()"
		  var tsOpenEventEndSignature as String = "End Sub"
		  
		  select case oProject.eProjectType
		  case ProjectType.Console
		    tsAppObjectType = "ConsoleApplication"
		    
		    tsOpenEventName = "Run"
		    tsOpenEventSignature = "Function Run(args() as String) As Integer"
		    tsOpenEventEndSignature = "End Function"
		    
		  case ProjectType.Desktop
		    tsAppObjectType = "Application"
		    
		    // Desktop doesn't have args
		    tsAppTemplate = tsAppTemplate.ReplaceAll("#pragma unused args", "")
		    tsAppTemplate = tsAppTemplate.ReplaceAll("   <SourceLine></SourceLine>", "")
		    
		  case ProjectType.Web
		    tsAppObjectType = "WebApplication"
		    
		    if oProject.iProjectAPI = 1 then
		      tsOpenEventSignature = "Sub Open(args() as String)"
		      
		    elseif oProject.iProjectAPI = 2 then
		      tsOpenEventName = "Opening"
		      tsOpenEventSignature = "Sub Opening(args() as String)"
		      
		    else
		      raise new TPUnimplementedException(CurrentMethodName + "API" + str(oProject.iProjectAPI))
		      
		    end
		    
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		  tsAppTemplate = tsAppTemplate.ReplaceAll("%app_type%", tsAppObjectType)
		  tsAppTemplate = tsAppTemplate.ReplaceAll("%open_event_name%", tsOpenEventName)
		  tsAppTemplate = tsAppTemplate.ReplaceAll("%open_event_signature%", tsOpenEventSignature)
		  tsAppTemplate = tsAppTemplate.ReplaceAll("%open_eventend_signature%", tsOpenEventEndSignature)
		  
		  var txnApp as XMLNode = oXML.NodeFromTemplate(tsAppTemplate)
		  oXML.DocumentElement.AppendChild(txnApp)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareDocument()
		  oXML = new XMLDocument
		  oXML.PreserveWhitespace = true
		  
		  var txnProject as XMLNode = oXML.AppendChild(oXML.CreateElement("RBProject"))
		  if oProject.iProjectAPI = 1 then
		    txnProject.SetAttribute("version", "2019r1.1")
		    txnProject.SetAttribute("FormatVersion", "2")
		    txnProject.SetAttribute("MinIDEVersion", "20070100")
		    
		  elseif oProject.iProjectAPI = 1 and oProject.eProjectType = ProjectType.Web then
		    txnProject.SetAttribute("MinIDEVersion", "20110400")
		    
		  elseif oProject.iProjectAPI = 2 then
		    // API 2.1
		    txnProject.SetAttribute("version", "2020r1.1")
		    txnProject.SetAttribute("FormatVersion", "2")
		    txnProject.SetAttribute("MinIDEVersion", "20200200")
		    
		  end
		  
		  PrepareProjectNode
		  PrepareAppObjectNode
		  
		  // Web project should have a session object
		  if oProject.eProjectType = ProjectType.Web then
		    // Generate an ID
		    xnWebSession.SetAttribute("ID", kPlaceholderGenerate_ID)
		    
		    // Do replacements
		    var tsWebSession as String = xnWebSession.ToString
		    tsWebSession = tsWebSession.ReplaceAll("DataFile", kPlaceholderNamespace)
		    
		    // Put it into the document
		    var txnSession as XMLNode = oXML.NodeFromTemplate(tsWebSession)
		    oXML.DocumentElement.AppendChild(txnSession)
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareiOS()
		  oXML = new XMLDocument
		  oXML.PreserveWhitespace = true
		  oXML.LoadXML(SpecialFolder.Resources.Child("Empty iOS Project.xojo_xml_project"))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareNamespace()
		  // Swap Namespace nodes for the engine specific templates
		  for tiNode as Integer = me.xnNamespace.ChildCount - 1 downto 0
		    var xnThis as XMLNode = me.xnNamespace.Child(tiNode)
		    
		    select case xnThis.Name
		    case "Method"
		      var tiMethodMax as Integer = xnThis.ChildCount - 1
		      for tiMethodProp as Integer = 0 to tiMethodMax
		        var xnMethodProp as XMLNode = xnThis.Child(tiMethodProp)
		        
		        select case xnMethodProp.Name
		        case "ItemName"
		          select case xnMethodProp.FirstChild.Value
		          case "GetDatabase", "GetDatabase_MSSQLMBS", "GetDatabase_Server", "GetDatabase_ServerSSL"
		            PrepareNamespaceGetDatabase(xnThis)
		            continue for tiMethodProp
		            
		          case "OpenDB"
		            PrepareNamespaceOpenDBFunction(xnThis)
		            continue for tiMethodProp
		            
		          case "Register"
		            PrepareNamespaceRegisterFunction(xnThis)
		            continue for tiMethodProp
		            
		          end
		          
		        end select
		        
		      next tiMethodProp
		      
		    case else
		      
		    end select
		    
		  next tiNode
		  
		  // Add the namespace to the document
		  oXML.DocumentElement.AppendChild(me.xnNamespace)
		  
		  // Add Namespace base classes
		  var tsARBase as String = kEmptyClassNode.ReplaceAll("%class_name%", "ActiveRecordBase")
		  tsARBase = tsARBase.ReplaceAll("%class_super%", "TP_ActiveRecord.Base")
		  
		  var tnARBase as XMLNode = oXML.NodeFromTemplate(tsARBase)
		  oXML.DocumentElement.AppendChild(tnARBase)
		  
		  var tsARView as String = kEmptyClassNode.ReplaceAll("%class_name%", "ActiveRecordView")
		  tsARView = tsARView.ReplaceAll("%class_super%", "TP_ActiveRecord.View")
		  
		  var tnARView as XMLNode = oXML.NodeFromTemplate(tsARView)
		  oXML.DocumentElement.AppendChild(tnARView)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareNamespaceGetDatabase(xnMethod as XMLNode)
		  var arsRemoveMethods() as String
		  
		  select case oProject.eDBEngine
		  case DBEngine.CubeSQL, DBEngine.ODBC
		    // Use _Server template
		    arsRemoveMethods.Append("GetDatabase")
		    arsRemoveMethods.Append("GetDatabase_MSSQLMBS")
		    arsRemoveMethods.Append("GetDatabase_ServerSSL")
		    
		  case DBEngine.MSSQL
		    // User _Server or _MSSQLMBS template
		    arsRemoveMethods.Append("GetDatabase")
		    arsRemoveMethods.Append("GetDatabase_ServerSSL")
		    
		    if oProject.DataClass.bUseMBSSQLAdapter then
		      arsRemoveMethods.Append("GetDatabase_Server")
		      
		    else
		      arsRemoveMethods.Append("GetDatabase_MSSQLMBS")
		      
		    end
		    
		  case DBEngine.MySQL, DBEngine.Postgres
		    // Use _Server template or _ServerSSL template
		    arsRemoveMethods.Append("GetDatabase")
		    arsRemoveMethods.Append("GetDatabase_MSSQLMBS")
		    
		    if oProject.oSSLConfig <> nil then
		      arsRemoveMethods.Append("GetDatabase_Server")
		      
		    else
		      arsRemoveMethods.Append("GetDatabase_ServerSSL")
		      
		    end
		    
		  case DBEngine.SQLite
		    // Remove all _ methods
		    arsRemoveMethods.Append("GetDatabase_MSSQLMBS")
		    arsRemoveMethods.Append("GetDatabase_Server")
		    arsRemoveMethods.Append("GetDatabase_ServerSSL")
		    
		  end select
		  
		  // Remove the method if it's bad
		  if arsRemoveMethods.IndexOf(GetItemName(xnMethod)) > -1 then
		    me.xnNamespace.RemoveChild(xnMethod)
		    return
		    
		  end
		  
		  // Rename the node that makes it to the end GetDatabase as %db_type% / kPlaceholderDBType
		  SetItemName(xnMethod) = "GetDatabase"
		  
		  var txnSource as XMLNode = GetItemSource(xnMethod)
		  var txnDefinition as XMLNode = txnSource.FirstChild.NextSibling
		  var txnNewDefinition as XMLNode = CreateSourceLine("GetDatabase as " + kPlaceholderDBType)
		  txnSource.ReplaceChild(txnNewDefinition, txnDefinition)
		  
		  // Done setting up GetDatabase
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareNamespaceOpenDBFunction(xnMethod as XMLNode)
		  var tiMethodMax as Integer = xnMethod.ChildCount - 1
		  for tiMethod as Integer = 0 to tiMethodMax
		    var toThis as XMLNode = xnMethod.Child(tiMethod)
		    
		    select case toThis.Name
		    case "ItemResult"
		      // Fix the return type
		      toThis.FirstChild.Value = kPlaceholderDBType
		      
		    case "ItemSource"
		      // Find and handle the extra library lines
		      for tiSourceLine as Integer = (toThis.ChildCount - 1) downto 0
		        var txnLine as XMLNode = toThis.Child(tiSourceLine)
		        if txnLine <> nil and txnLine.Name = "SourceLine" and txnLine.FirstChild <> nil then
		          var tsLine as String = txnLine.FirstChild.Value
		          select case tsLine
		          case "TP_AuditTrail.CreateAuditTables(oLocalDB)"
		            if oProject.DataClass.bAddAuditTrail = false then
		              toThis.RemoveChild(txnLine)
		              
		            end
		            
		          case "TP_DBUpdates.UpdateDB(oLocalDB)", "TP_DBUpdates.UpdateDB(DB)"
		            if oProject.DataClass.bAddDBUpdateModule = false then
		              toThis.RemoveChild(txnLine)
		              
		            end
		            
		          case "dim fDB as xojo.IO.FolderItem = Xojo.IO.SpecialFolder.Documents.Child(""ActiveRecordiOS.db"")"
		            txnLine.FirstChild.Value = "dim fDB as xojo.IO.FolderItem = Xojo.IO.SpecialFolder.Documents.Child(""" + _
		            oProject.fDatabase.Name + """)"
		            
		          end select
		          
		        end
		        
		      next tiSourceLine
		      
		    end
		    
		  next tiMethod
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareNamespaceRegisterFunction(xnMethod as XMLNode)
		  var tsDBName as String = "oLocalDB"
		  if oProject.eProjectType = ProjectType.iOS then
		    tsDBName = "DB"
		    
		  end
		  
		  var tiMethodMax as Integer = xnMethod.ChildCount - 1
		  for tiMethod as Integer = 0 to tiMethodMax
		    var toThis as XMLNode = xnMethod.Child(tiMethod)
		    
		    if toThis.Name = "ItemSource" then
		      var txnRegister as XMLNode = oXML.CreateElement("ItemSource")
		      txnRegister.AppendChild(oXML.GetTextEncodingNode)
		      
		      // Generate register function
		      var tbHasViews as Boolean
		      var tarsRegister() as String
		      tarsRegister.Append("Sub Register(oLocalDB as " + kPlaceholderDBType + ")")
		      
		      tarsRegister.Append("// Tables")
		      for each oTable as ARProject.TableData in oProject.DataClass.aroTables
		        // Check for views and skip them
		        if oTable.bView = true then
		          tbHasViews = true
		          continue for oTable
		          
		        end
		        
		        // Append selected tables
		        // TP_ActiveRecord.Table(oDB, "t_Table", GetTypeInfo(DataFile.t_Table))
		        if oTable.bSelected = true then
		          tarsRegister.Append("TP_ActiveRecord.Table(" + tsDBName + ", """ + _
		          oTable.sTableName + """, GetTypeInfo(" + kPlaceholderNamespace + "." + oTable.sTableName + "))")
		          
		        end
		        
		      next oTable
		      
		      // Add views
		      if tbHasViews = true then
		        tarsRegister.Append("")
		        tarsRegister.Append("// Views")
		        
		        for each oView as ARProject.TableData in oProject.DataClass.aroTables
		          if oView.bView = false then continue for oView
		          if oView.bSelected = false then continue for oView
		          
		          // Append selected views
		          // TP_ActiveRecord.View(oDB, "vw_View", GetTypeInfo(DataFile.vw_View))
		          if oView.bSelected = true then
		            tarsRegister.Append("TP_ActiveRecord.View(" + tsDBName + ", """ + _
		            oView.sTableName + """, GetTypeInfo(" + kPlaceholderNamespace + "." + oView.sTableName + "))")
		            
		          end
		          
		        next oView
		        
		      end
		      
		      // Add Verify
		      if oProject.DataClass.bVerifyClassEnabled then
		        tarsRegister.Append("")
		        tarsRegister.Append("// Classes")
		        
		        for each oTable as ARProject.TableData in oProject.DataClass.aroTables
		          // Append selected tables
		          // TP_ActiveRecord.VerifyClass(GetTypeInfo(DataFile.t_Table))
		          if oTable.bSelected = true then
		            tarsRegister.Append("TP_ActiveRecord.VerifyClass(GetTypeInfo(" + _
		            kPlaceholderNamespace + "." + oTable.sTableName + "))")
		            
		          end
		          
		        next oTable
		        
		      end
		      
		      tarsRegister.Append("End Sub)")
		      
		      // Turn tarsRegister into an XMLNode
		      for tiLine as Integer = 0 to tarsRegister.Ubound
		        var txnLine as XMLNode = oXML.CreateElement("SourceLine")
		        txnLine.AppendChild(oXML.CreateTextNode(tarsRegister(tiLine)))
		        
		        txnRegister.AppendChild(txnLine)
		        
		      next tiLine
		      
		      // Done, replace the function
		      xnMethod.ReplaceChild(txnRegister, toThis)
		      return
		      
		    end
		    
		  next tiMethod
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareProjectNode()
		  var xnProject as XMLNode = oXML.ImportNode(xnTemplateProject, true)
		  oXML.DocumentElement.AppendChild(xnProject)
		  
		  var tbWeb2NodeSet as Boolean
		  
		  // Make updates
		  var tiMax as Integer = xnProject.ChildCount - 1
		  for tiProjectChild as Integer = 0 to tiMax
		    var xnThis as XMLNode = xnProject.Child(tiProjectChild)
		    
		    // Update the nodes
		    select case xnThis.Name
		    case "BuildFlags"
		      // Set up the build flags for the platform
		      select case oProject.eProjectType
		      case ProjectType.Desktop
		        xnThis.FirstChild.Value = "18688"
		        
		      case ProjectType.Web
		        xnThis.FirstChild.Value = "2432"
		        
		      end select
		      
		    case "BuildCarbonMachOName", "BuildLinuxX86Name", "BuildWinName" // App name
		      var tsAppName as String = oProject.DataClass.sAppName
		      
		      // Add .exe
		      if xnThis.Name = "BuildWinName" then
		        tsAppName = tsAppName + ".exe"
		        
		      end
		      
		      xnThis.FirstChild.Value = tsAppName
		      
		    case "BuildWinCompanyName" // Company name
		      xnThis.FirstChild.Value = oProject.DataClass.sAppCompany
		      
		    case "BundleIdentifier" // Duh
		      xnThis.FirstChild.Value = oProject.DataClass.sAppBundleID
		      
		    case "DefaultViewID"
		      if oProject.eProjectType = ProjectType.Web then
		        // Set default web page
		        xnThis.FirstChild.Value = "420691229"
		        
		      end
		      
		    case "LongVersion"
		      var tdtNow as new Date
		      var tsCopyright as String = "© " + Format(tdtNow.Year, "####") + _
		      " " + oProject.DataClass.sAppCompany
		      
		      var txnValue as XMLNode = oXML.CreateTextNode(tsCopyright)
		      
		      // Set the copyright
		      xnThis.AppendChild(txnValue)
		      
		    case "IDEVersion"
		      if oProject.iProjectAPI = 2 then
		        // API 2.1
		        xnThis.FirstChild.Value = "20200200"
		        
		      end
		      
		    case "ProjectSavedInVers"
		      if oProject.iProjectAPI = 1 then
		        xnThis.FirstChild.Value = "2019.011"
		        
		      elseif oProject.iProjectAPI = 2 then
		        // API 2.1
		        xnThis.FirstChild.Value = "2020.02"
		        
		      end
		      
		    case "ProjectType"
		      // Set project type
		      select case oProject.eProjectType
		      case ProjectType.Console
		        xnThis.FirstChild.Value = "1"
		        
		      case ProjectType.Desktop
		        xnThis.FirstChild.Value = "0"
		        
		      case ProjectType.Web
		        xnThis.FirstChild.Value = "3"
		        
		      end select
		      
		    case "WebApp"
		      // Set webapp specific flag
		      if oProject.eProjectType = ProjectType.Web then
		        xnThis.FirstChild.Value = "1"
		        
		      else
		        xnThis.FirstChild.Value = "0"
		        
		      end
		      
		    case "WebVersion"
		      if oProject.iProjectAPI = 1 then
		        xnProject.RemoveChild(xnThis)
		        
		      elseif oProject.iProjectAPI = 2 then
		        xnThis.FirstChild.Value = "1"
		        tbWeb2NodeSet = true
		        
		      end
		      
		    end select
		    
		  next tiProjectChild
		  
		  // Add Web 2.0 node
		  if oProject.eProjectType = ProjectType.Web and tbWeb2NodeSet = false then
		    var oWV as XMLNode = oXML.CreateElement("WebVersion")
		    oWV.AppendChild(oXML.CreateTextNode("1"))
		    
		    xnProject.AppendChild(oWV)
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareTemplates()
		  // Build namespace class template
		  msClassTemplate = xnTemplateClass.ToString
		  msClassTemplate = msClassTemplate.ReplaceAll("t_Table", kPlaceholderTableName)
		  msClassTemplate = msClassTemplate.ReplaceAll("ActiveRecordBase", kPlaceholderTableViewSuper)
		  msClassTemplate = msClassTemplate.ReplaceAll("ActiveRecordClass", kPlaceholderTableName)
		  msClassTemplate = msClassTemplate.ReplaceAll("DataFile", kPlaceholderNamespace)
		  msClassTemplate = msClassTemplate.ReplaceAll("PreparedSQLStatement", kPlaceholderPreparedStatement)
		  
		  // Set the object owner placeholder
		  var txnTemplate as XMLNode = oXML.NodeFromTemplate(msClassTemplate)
		  var tiTemplateMax as Integer = txnTemplate.ChildCount - 1
		  for tiTemplateNode as Integer = tiTemplateMax downto 0
		    var xnThis as XMLNode = txnTemplate.Child(tiTemplateNode)
		    
		    select case xnThis.Name
		    case "ObjContainerID"
		      // Replace container id with placeholder
		      xnThis.FirstChild.Value = kPlaceholderNamespace_ID
		      
		    case "HookInstance"
		      // Remove event handlers if no audit trail
		      if oProject.DataClass.bAddAuditTrail = false and _
		        xnThis.FirstChild.FirstChild.Value.Left(5) = "After" then
		        txnTemplate.RemoveChild(xnThis)
		        
		      end
		      
		    end select
		    
		  next tiTemplateNode
		  
		  // Customize
		  CustomizeClassTemplate(txnTemplate)
		  
		  // Finalize
		  msClassTemplate = txnTemplate.ToString
		  
		  // Build new Namespace node
		  var tsNamespaceTemplate as String = moDataFile.xnHead.ToString
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll("DataFile", kPlaceholderNamespace)
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll("As Database", "as " + kPlaceholderDBType)
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll(" Database(", " " + kPlaceholderDBType + "(")
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll("<ItemResult>Database</ItemResult>", _
		  "<ItemResult>" + kPlaceholderDBType + "</ItemResult>")
		  
		  // Server template fixes
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll("as new PostgreSQLDatabase", "as new " + kPlaceholderDBType)
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll(".Port = 5432", ".Port = %template_port%")
		  
		  
		  // Fix an overzealous replacement
		  // (API 2 only I think)
		  tsNamespaceTemplate = tsNamespaceTemplate.ReplaceAll( _
		  "catch ex as %db_type%Exception", "catch ex as DatabaseException")
		  
		  msNamespaceID = GetGeneratedID
		  me.xnNamespace = oXML.NodeFromTemplate(tsNamespaceTemplate)
		  me.xnNamespace.SetAttribute("ID", msNamespaceID)
		  
		  // Build
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadAndPrepare(tfSource as FolderItem) As String
		  var tis as TextInputStream = TextInputStream.Open(tfSource)
		  var tsTemplate as String = tis.ReadAll
		  tis.Close
		  
		  // Remove PartIDs
		  var trxPartID as new RegEx
		  trxPartID.SearchPattern = "(\<PartId\>[0-9]+\<\/PartId\>)"
		  trxPartID.Options.ReplaceAllMatches = true
		  
		  tsTemplate = trxPartID.Replace(tsTemplate)
		  
		  return tsTemplate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadTemplate()
		  var tfAPI as FolderItem
		  select case oProject.iProjectAPI
		  case 0
		    var ex as new TPUnimplementedException
		    ex.Message = "No API selected"
		    raise ex
		    
		  case 1
		    if oProject.eProjectType = ProjectType.iOS then
		      tfAPI = SpecialFolder.Resources.Child("ActiveRecord_iOS.xojo_xml_project")
		      
		    else
		      tfAPI = SpecialFolder.Resources.Child("ActiveRecord_1.xojo_xml_project")
		      
		    end
		    
		  case 2
		    tfAPI = SpecialFolder.Resources.Child("ActiveRecord_2.xojo_xml_project")
		    
		  end select
		  
		  
		  var xmlAPI as new XMLDocument(ReadAndPrepare(tfAPI))
		  var xnDocument as XMLNode = xmlAPI.FirstChild
		  
		  // Look for Project, TP_ActiveRecord, and DataFile nodes
		  var tiNodeMax as Integer = xnDocument.ChildCount - 1
		  for ti as Integer = 0 to tiNodeMax
		    var xnThis as XMLNode = xnDocument.Child(ti)
		    
		    // Can only read blocks
		    if xnThis.Name <> "block" then continue for ti
		    
		    select case xnThis.GetAttribute("type")
		    case "Project"
		      // Stash the project node
		      xnTemplateProject = xnThis
		      
		    case "Module", "Folder", "Window"
		      // Read module
		      ReadTemplateModule(xnThis)
		      
		    case "BuildAutomation", "BuildProjectStep", "BuildStepsList", _
		      "SignProjectScriptStep"
		      // Add to meta
		      arxnTemplateMeta.Append(xnThis)
		      
		    case "Menu"
		      // Can safely ignore these for now
		      
		    case "ApplicationIcon", "iOSScreen", "iOSView"
		      // Toss iOS base template things
		      
		    case "UIState"
		      // UIState is written from the template
		      
		    case else
		      // Stopped here?
		      // A new unhandled node!
		      break
		      
		    end select
		    
		  next ti
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadTemplateModule(xnModule as XMLNode)
		  // Look for TP_ActiveRecord, DataFile, and anything that belong to them.
		  var tiMax as Integer = xnModule.ChildCount - 1
		  for tiModuleChild as Integer = 0 to tiMax
		    var xnThis as XMLNode = xnModule.Child(tiModuleChild)
		    
		    // Read the children
		    select case xnThis.Name
		    case "ObjName"
		      // Look for top level nodes
		      select case xnThis.FirstChild.Value
		      case "TP_ActiveRecord"
		        moActiveRecordLibrary = new ProjectGenerator.ProjectModule
		        moActiveRecordLibrary.xnHead = xnModule
		        moActiveRecordLibrary.sID = xnModule.GetAttributeNode("ID").Value
		        
		      case "P"
		        msActiveRecordPNode = xnModule.GetAttributeNode("ID").Value
		        
		      case "DataFile"
		        moDataFile = new ProjectGenerator.ProjectModule
		        moDataFile.xnHead = xnModule
		        moDataFile.sID = xnModule.GetAttributeNode("ID").Value
		        
		      case "ActiveRecordClass"
		        xnTemplateClass = xnModule
		        xnTemplateClass.GetAttributeNode("ID").Value = kPlaceholderGenerate_ID
		        
		      case "TP_AuditTrail"
		        moAuditTrail = new ProjectGenerator.ProjectModule
		        moAuditTrail.xnHead = xnModule
		        moAuditTrail.sID = xnModule.GetAttributeNode("ID").Value
		        
		      case "TP_DBUpdates"
		        if oProject.DataClass.bAddDBUpdateModule = true then
		          marxnExtras.Append(xnModule)
		          
		        end
		        
		      case "Auto_Extends", "SQLiteDatabaseExtends"
		        // iOS parts
		        marxnExtras.Append(xnModule)
		        
		      end select
		      
		    case "ObjContainerID"
		      // Look for container parents
		      var tsContainerID as String = xnThis.FirstChild.Value
		      if tsContainerID = "0" then continue for tiModuleChild
		      
		      // Check for ActiveRecord children
		      if moActiveRecordLibrary <> nil and _
		        (moActiveRecordLibrary.sID = tsContainerID) or (tsContainerID = msActiveRecordPNode) then
		        moActiveRecordLibrary.arxnChildren.Append(xnModule)
		        continue for tiModuleChild
		        
		      end
		      
		      // Check for DataFile children
		      if moDataFile <> nil and moDataFile.sID = tsContainerID then
		        moDataFile.arxnChildren.Append(xnModule)
		        continue for tiModuleChild
		        
		      end
		      
		      // Check for AuditTrail children
		      if moAuditTrail <> nil and moAuditTrail.sID = tsContainerID then
		        moAuditTrail.arxnChildren.Append(xnModule)
		        continue for tiModuleChild
		        
		      end
		      
		      // Uncomment to stop on unknown parents
		      // break
		      
		    end
		    
		  next tiModuleChild
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadTemplateUI()
		  var tfUI as FolderItem
		  select case oProject.eProjectType
		  case ProjectType.Console, ProjectType.iOS
		    // No UI
		    return
		    
		  case ProjectType.Desktop
		    if oProject.iProjectAPI = 1 then
		      tfUI = SpecialFolder.Resources.Child("UIDesktop_1.xojo_xml_project")
		      
		    elseif oProject.iProjectAPI = 2 then
		      tfUI = SpecialFolder.Resources.Child("UIDesktop_2.xojo_xml_project")
		      
		    end
		    
		  case ProjectType.Web
		    if oProject.iProjectAPI = 1 then
		      tfUI = SpecialFolder.Resources.Child("UIWeb_1.xojo_xml_project")
		      
		    elseif oProject.iProjectAPI = 2 then
		      tfUI = SpecialFolder.Resources.Child("UIWeb_2.xojo_xml_project")
		      
		    end
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		  var xmlUI as new XMLDocument(ReadAndPrepare(tfUI))
		  var xnDocument as XMLNode = xmlUI.FirstChild
		  moUI = new ProjectGenerator.UITemplate
		  moUI.bPrefix = TPSettings.Get("kUIPrefixes", true)
		  moUI.oProject = oProject
		  
		  // Look for Project, TP_ActiveRecord, and DataFile nodes
		  var tiNodeMax as Integer = xnDocument.ChildCount - 1
		  for ti as Integer = 0 to tiNodeMax
		    var txnThis as XMLNode = xnDocument.Child(ti)
		    
		    // Can only read blocks
		    if txnThis.Name <> "block" then continue for ti
		    
		    // Check for UI children
		    if moUI.IsIncludedDependency(txnThis) then
		      moUI.AppendNode(txnThis)
		      continue for ti
		      
		    end
		    
		    // Check for templates
		    select case txnThis.GetAttribute("type")
		    case "Folder"
		      var tsName as String = GetObjectName(txnThis)
		      select case tsName
		      case "Dependencies"
		        moUI.sDependenciesID = txnThis.GetAttributeNode("ID").Value
		        
		      case "t_Table", "vw_View"
		        moUI.AppendNode(txnThis)
		        
		      case "Ignored"
		        // This is the ignored parent
		        moUI.arsIgnoredIDs.Append(txnThis.GetAttributeNode("ID").Value)
		        
		      end select
		      
		    case "Module", "Window", "WebContainer", "WebPage", "WebView"
		      // Read module, not a dependency
		      if not moUI.IsIgnored(txnThis) then
		        moUI.LoadComponent(txnThis)
		        
		      end
		      
		    case "WebSession"
		      // Stash Session template
		      xnWebSession = txnThis
		      
		    case "Project", "Menu", "UIState", "BuildAutomation", _
		      "BuildProjectStep", "BuildStepsList"
		      // Can safely ignore these
		      
		    case else
		      // Stopped here?
		      // A new unhandled node!
		      break
		      
		    end select
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveAuditEvents(txnTable as XMLNode)
		  // Remove the HookInstances
		  for tiNode as Integer = (txnTable.ChildCount - 1) downto 0
		    var tsName as String = txnTable.Child(tiNode).Name
		    if tsName = "HookInstance" then
		      txnTable.RemoveChild(txnTable.Child(tiNode))
		      
		    end
		    
		  next tiNode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveFindByID(txnTable as XMLNode)
		  // Remove FindByID
		  for tiNode as Integer = (txnTable.ChildCount - 1) downto 0
		    var txnThis as XMLNode = txnTable.Child(tiNode)
		    var tsName as String = txnThis.Name
		    if tsName = "Method" then
		      var tsMethodName as String = txnThis.FirstChild.FirstChild.Value
		      if tsMethodName = "FindByID" then
		        txnTable.RemoveChild(txnThis)
		        
		      end
		      
		    end
		    
		  next tiNode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateLabel(tsMsg as String)
		  var tdict as new Dictionary
		  tdict.Value("LabelValue") = tsMsg
		  
		  me.UpdateUI(tdict)
		  
		  #if TargetWindows then
		    me.Sleep(1)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateProgress(tiCurrent as Integer, tiMax as Integer = -1)
		  var tdict as new Dictionary
		  tdict.Value("ProgressValue") = tiCurrent
		  
		  if tiMax > -1 then
		    tdict.Value("ProgressMax") = tiMax
		    
		  end
		  
		  me.UpdateUI(tdict)
		  
		  #if TargetWindows then
		    me.Sleep(1)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function VarOrDim() As String
		  if msDimension = "" then
		    select case oProject.iProjectAPI
		    case 0
		      var ex as new TPUnimplementedException
		      ex.Message = "No API selected"
		      raise ex
		      
		    case 1
		      msDimension = "dim"
		      
		    case 2
		      msDimension = "var"
		      
		    end select
		    
		  end
		  
		  return msDimension
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteProjectFile()
		  me.UpdateLabel("Saving")
		  
		  try
		    var tos as TextOutputStream = TextOutputStream.Create(fDestination)
		    tos.Write(msOutput)
		    tos.Close
		    
		  catch e as IOException
		    // Something bad?
		    
		  end try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected arxnTemplateMeta() As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h0
		fDestination As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private marxnExtras() As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private miGeneratedIDLastIssued As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private miProgressCurrent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moActiveRecordLibrary As ProjectGenerator.ProjectModule
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moAuditTrail As ProjectGenerator.ProjectModule
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moDataFile As ProjectGenerator.ProjectModule
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moOutputNamespace As ProjectGenerator.ProjectModule
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moRand As Random
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moUI As ProjectGenerator.UITemplate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msActiveRecordPNode As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msClassTemplate As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msDimension As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msNamespaceID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msOutput As String
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty

	#tag Property, Flags = &h0
		oXML As XMLDocument
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xnLocalizationModule As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xnNamespace As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xnTemplateClass As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xnTemplateProject As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected xnWebSession As XMLNode
	#tag EndProperty


	#tag Constant, Name = kAppObjectTemplate, Type = String, Dynamic = False, Default = \"<block type\x3D\"Module\" ID\x3D\"%generate_id%\">\n <ObjName>App</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>%app_type%</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <IsApplicationObject>1</IsApplicationObject>\n <Compatibility></Compatibility>\n <HookInstance>\n  <ItemName>%open_event_name%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>%open_event_signature%</SourceLine>\n   <SourceLine>#pragma unused args</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>// Connect the DB</SourceLine>\n   <SourceLine>call %namespace%.DB</SourceLine>\n   <SourceLine>%open_eventend_signature%</SourceLine>\n  </ItemSource>\n </HookInstance>\n <PropertyVal Name\x3D\"MenuBar\">0</PropertyVal>\n <ViewBehavior>\n </ViewBehavior>\n</block>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kComputedPropertyTemplateLoadMethod, Type = String, Dynamic = False, Default = \" <Method>\n  <ItemName>Load%foreigncolumn_class%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Function Load%foreigncolumn_class%(bReload as Boolean \x3D False) As %namespace%.%foreigncolumn_class%()</SourceLine>\n   <SourceLine>if %private_foreigncolumn_array%.Ubound \x3D -1 or bReload \x3D true then</SourceLine>\n   <SourceLine>dim tsSQL as String \x3D \"%db_foreigncolumn_id% \x3D \" + str(self.%foreigncolumn_id_name%)</SourceLine>\n   <SourceLine>%private_foreigncolumn_array% \x3D %namespace%.%foreigncolumn_class%.List(tsSQL)</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>return %private_foreigncolumn_array%</SourceLine>\n   <SourceLine>End Function</SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <AliasName></AliasName>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <ItemParams>bReload as Boolean \x3D False</ItemParams>\n  <ItemResult>%namespace%.%foreigncolumn_class%()</ItemResult>\n </Method>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kComputedPropertyTemplateLoadMethod_API2, Type = String, Dynamic = False, Default = \" <Method>\n  <ItemName>Load%foreigncolumn_class%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Function Load%foreigncolumn_class%(bReload as Boolean \x3D False) As %namespace%.%foreigncolumn_class%()</SourceLine>\n   <SourceLine>if %private_foreigncolumn_array%.LastIndex \x3D -1 or bReload \x3D true then</SourceLine>\n   <SourceLine>var tsSQL as String \x3D \"%db_foreigncolumn_id% \x3D \" + str(self.%foreigncolumn_id_name%)</SourceLine>\n   <SourceLine>%private_foreigncolumn_array% \x3D %namespace%.%foreigncolumn_class%.List(tsSQL)</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>return %private_foreigncolumn_array%</SourceLine>\n   <SourceLine>End Function</SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <AliasName></AliasName>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <ItemParams>bReload as Boolean \x3D False</ItemParams>\n  <ItemResult>%namespace%.%foreigncolumn_class%()</ItemResult>\n </Method>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kComputedPropertyTemplateLoadMethod_iOS, Type = String, Dynamic = False, Default = \" <Method>\n  <ItemName>Load%foreigncolumn_class%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Function Load%foreigncolumn_class%(bReload as Boolean \x3D False) As %namespace%.%foreigncolumn_class%()</SourceLine>\n   <SourceLine>if %private_foreigncolumn_array%.Ubound \x3D -1 or bReload \x3D true then</SourceLine>\n   <SourceLine>dim tsSQL as Text \x3D \"%db_foreigncolumn_id% \x3D \" + self.%foreigncolumn_id_name%.ToText</SourceLine>\n   <SourceLine>%private_foreigncolumn_array% \x3D %namespace%.%foreigncolumn_class%.List(tsSQL)</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>return %private_foreigncolumn_array%</SourceLine>\n   <SourceLine>End Function</SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <AliasName></AliasName>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <ItemParams>bReload as Boolean \x3D False</ItemParams>\n  <ItemResult>%namespace%.%foreigncolumn_class%()</ItemResult>\n </Method>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kComputedPropertyTemplatePrivate, Type = String, Dynamic = False, Default = \" <Property>\n  <ItemName>%private_foreigncolumn%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>%private_foreigncolumn% As %namespace%.%foreigncolumn_class%</SourceLine>\n   <SourceLine></SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemDeclaration>%private_foreigncolumn% As %namespace%.%foreigncolumn_class%</ItemDeclaration>\n  <ItemFlags>33</ItemFlags>\n  <IsShared>0</IsShared>\n </Property>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kComputedPropertyTemplateSingle, Type = String, Dynamic = False, Default = \" <Property>\n  <ItemName>%computed_foreigncolumn%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Property %computed_foreigncolumn% As %namespace%.%foreigncolumn_class%</SourceLine>\n   <SourceLine></SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemDeclaration>%computed_foreigncolumn% As %namespace%.%foreigncolumn_class%</ItemDeclaration>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <SetAccessor>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Set</SourceLine>\n   <SourceLine>if value \x3D nil then</SourceLine>\n   <SourceLine>%foreigncolumn_id_name% \x3D 0</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>else</SourceLine>\n   <SourceLine>%foreigncolumn_id_name% \x3D value.%foreignproperty_name%</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>%private_foreigncolumn% \x3D value</SourceLine>\n   <SourceLine>End Set</SourceLine>\n  </SetAccessor>\n  <GetAccessor>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Get</SourceLine>\n   <SourceLine>if %private_foreigncolumn% \x3D nil then</SourceLine>\n   <SourceLine>dim tsSQL as String \x3D \"%db_foreigncolumn_id% \x3D \" + str(self.%foreigncolumn_id_name%)</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>dim taroRecords() as %namespace%.%foreigncolumn_class% \x3D %namespace%.%foreigncolumn_class%.List(tsSQL)</SourceLine>\n   <SourceLine>if taroRecords.Ubound &gt; -1 then</SourceLine>\n   <SourceLine>%private_foreigncolumn% \x3D taroRecords(0)</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>end</SourceLine>\n   <SourceLine></SourceLine>\n   <SourceLine>return %private_foreigncolumn%</SourceLine>\n   <SourceLine>End Get</SourceLine>\n  </GetAccessor>\n </Property>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCubeSQLExecuteTemplate, Type = String, Dynamic = False, Default = \" <Method>\n  <ItemName>SQLExecuteRaiseOnError</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Sub SQLExecuteRaiseOnError(extends stmt as CubeSQLVM\x2C db as CubeSQLServer)</SourceLine>\n   <SourceLine>stmt.VMExecute</SourceLine>\n   <SourceLine>if db.Error then</SourceLine>\n   <SourceLine>raise new BKS_Database.DatabaseException( db.ErrorMessage\x2C \"\" )</SourceLine>\n   <SourceLine>end if</SourceLine>\n   <SourceLine>End Sub</SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <AliasName></AliasName>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <ItemParams>extends stmt as CubeSQLVM\x2C db as CubeSQLServer</ItemParams>\n  <ItemResult></ItemResult>\n </Method>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCubeSQLSelectTemplate, Type = String, Dynamic = False, Default = \" <Method>\n  <ItemName>SQLSelectRaiseOnError</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>Function SQLSelectRaiseOnError(extends stmt as CubeSQLVM\x2C db as CubeSQLServer) As RecordSet</SourceLine>\n   <SourceLine>dim rs as RecordSet \x3D stmt.VMSelect</SourceLine>\n   <SourceLine>if db.Error then</SourceLine>\n   <SourceLine>raise new BKS_Database.DatabaseException( db.ErrorMessage\x2C \"\" )</SourceLine>\n   <SourceLine>end if</SourceLine>\n   <SourceLine>return rs</SourceLine>\n   <SourceLine>End Function</SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <AliasName></AliasName>\n  <ItemFlags>0</ItemFlags>\n  <IsShared>0</IsShared>\n  <ItemParams>extends stmt as CubeSQLVM\x2C db as CubeSQLServer</ItemParams>\n  <ItemResult>RecordSet</ItemResult>\n </Method>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEmptyClassNode, Type = String, Dynamic = False, Default = \"<block type\x3D\"Module\" ID\x3D\"%generate_id%\">\n <ObjName>%class_name%</ObjName>\n <ObjContainerID>%namespace_id%</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>%class_super%</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n</block>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFolderTemplate, Type = String, Dynamic = False, Default = \"<block type\x3D\"Folder\" ID\x3D\"%generate_id%\">\n <ObjName>%folder_name%</ObjName>\n <ObjContainerID>%container_id%</ObjContainerID>\n</block>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kiOSBasicsTemplate, Type = String, Dynamic = False, Default = \"<block type\x3D\"Module\" ID\x3D\"1845192703\">\n <ObjName>App</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>IOSApplication</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <IsApplicationObject>1</IsApplicationObject>\n <Compatibility>TargetIOS</Compatibility>\n <PropertyVal Name\x3D\"MenuBar\">0</PropertyVal>\n <ViewBehavior>\n </ViewBehavior>\n</block>\n<block type\x3D\"IOSScreen\" ID\x3D\"1239099391\">\n <ObjName>iPhoneScreen</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>iosScreen</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n <PropertyVal Name\x3D\"OrientationPortraitUpsideDown\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationLandscapeRight\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationLandscapeLeft\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationPortrait\">True</PropertyVal>\n <PropertyVal Name\x3D\"Content\">241881087</PropertyVal>\n <ViewBehavior>\n  <ViewProperty>\n   <ObjName>Index</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <PropertyValue>-2147483648</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Left</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Name</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Super</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Top</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n </ViewBehavior>\n <ScreenContentItem>\n  <ItemName></ItemName>\n  <Target>241881087</Target>\n  <Icon>0</Icon>\n </ScreenContentItem>\n</block>\n<block type\x3D\"IOSScreen\" ID\x3D\"23214079\">\n <ObjName>iPadScreen</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>iosScreen</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n <PropertyVal Name\x3D\"OrientationPortraitUpsideDown\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationLandscapeRight\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationLandscapeLeft\">True</PropertyVal>\n <PropertyVal Name\x3D\"OrientationPortrait\">True</PropertyVal>\n <PropertyVal Name\x3D\"Content\">241881087</PropertyVal>\n <ViewBehavior>\n  <ViewProperty>\n   <ObjName>Index</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <PropertyValue>-2147483648</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Left</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Name</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Super</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Top</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n </ViewBehavior>\n <ScreenContentItem>\n  <ItemName></ItemName>\n  <Target>241881087</Target>\n  <Icon>0</Icon>\n </ScreenContentItem>\n</block>\n<block type\x3D\"ApplicationIcon\" ID\x3D\"1309689855\">\n <ObjName>App Icon</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <ItemName>App Icon</ItemName>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>16</Height>\n   <Orientation>0</Orientation>\n   <Platform>6</Platform>\n   <Resolution>72</Resolution>\n   <Width>16</Width>\n   <HeightDouble>16</HeightDouble>\n   <WidthDouble>16</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>16</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>144</Resolution>\n   <Width>16</Width>\n   <HeightDouble>16</HeightDouble>\n   <WidthDouble>16</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>32</Height>\n   <Orientation>0</Orientation>\n   <Platform>6</Platform>\n   <Resolution>72</Resolution>\n   <Width>32</Width>\n   <HeightDouble>32</HeightDouble>\n   <WidthDouble>32</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>32</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>144</Resolution>\n   <Width>32</Width>\n   <HeightDouble>32</HeightDouble>\n   <WidthDouble>32</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment>Tiles / Thumbnails</Comment>\n   <Device>16</Device>\n   <Height>48</Height>\n   <Orientation>0</Orientation>\n   <Platform>4</Platform>\n   <Resolution>96</Resolution>\n   <Width>48</Width>\n   <HeightDouble>48</HeightDouble>\n   <WidthDouble>48</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>128</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>72</Resolution>\n   <Width>128</Width>\n   <HeightDouble>128</HeightDouble>\n   <WidthDouble>128</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>128</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>144</Resolution>\n   <Width>128</Width>\n   <HeightDouble>128</HeightDouble>\n   <WidthDouble>128</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>256</Height>\n   <Orientation>0</Orientation>\n   <Platform>6</Platform>\n   <Resolution>72</Resolution>\n   <Width>256</Width>\n   <HeightDouble>256</HeightDouble>\n   <WidthDouble>256</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>256</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>144</Resolution>\n   <Width>256</Width>\n   <HeightDouble>256</HeightDouble>\n   <WidthDouble>256</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>512</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>72</Resolution>\n   <Width>512</Width>\n   <HeightDouble>512</HeightDouble>\n   <WidthDouble>512</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment></Comment>\n   <Device>16</Device>\n   <Height>512</Height>\n   <Orientation>0</Orientation>\n   <Platform>2</Platform>\n   <Resolution>144</Resolution>\n   <Width>512</Width>\n   <HeightDouble>512</HeightDouble>\n   <WidthDouble>512</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"21\">4E6F74696669636174696F6E0A694F5320372D3130</Hex></Comment>\n   <Device>3</Device>\n   <Height>20</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>72</Resolution>\n   <Width>20</Width>\n   <HeightDouble>20</HeightDouble>\n   <WidthDouble>20</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"21\">4E6F74696669636174696F6E0A694F5320372D3130</Hex></Comment>\n   <Device>3</Device>\n   <Height>20</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>20</Width>\n   <HeightDouble>20</HeightDouble>\n   <WidthDouble>20</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"21\">4E6F74696669636174696F6E0A694F5320372D3130</Hex></Comment>\n   <Device>3</Device>\n   <Height>20</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>216</Resolution>\n   <Width>20</Width>\n   <HeightDouble>20</HeightDouble>\n   <WidthDouble>20</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"17\">53657474696E67730A694F5320352D3130</Hex></Comment>\n   <Device>2</Device>\n   <Height>29</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>72</Resolution>\n   <Width>29</Width>\n   <HeightDouble>29</HeightDouble>\n   <WidthDouble>29</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"17\">53657474696E67730A694F5320352D3130</Hex></Comment>\n   <Device>7</Device>\n   <Height>29</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>29</Width>\n   <HeightDouble>29</HeightDouble>\n   <WidthDouble>29</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"17\">53657474696E67730A694F5320352D3130</Hex></Comment>\n   <Device>1</Device>\n   <Height>29</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>216</Resolution>\n   <Width>29</Width>\n   <HeightDouble>29</HeightDouble>\n   <WidthDouble>29</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"18\">53706F746C696768740A694F5320372D3130</Hex></Comment>\n   <Device>2</Device>\n   <Height>40</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>72</Resolution>\n   <Width>40</Width>\n   <HeightDouble>40</HeightDouble>\n   <WidthDouble>40</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"18\">53706F746C696768740A694F5320372D3130</Hex></Comment>\n   <Device>7</Device>\n   <Height>40</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>40</Width>\n   <HeightDouble>40</HeightDouble>\n   <WidthDouble>40</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"18\">53706F746C696768740A694F5320372D3130</Hex></Comment>\n   <Device>1</Device>\n   <Height>40</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>216</Resolution>\n   <Width>40</Width>\n   <HeightDouble>40</HeightDouble>\n   <WidthDouble>40</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"12\">4170700A694F5320372D3130</Hex></Comment>\n   <Device>1</Device>\n   <Height>60</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>60</Width>\n   <HeightDouble>60</HeightDouble>\n   <WidthDouble>60</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"12\">4170700A694F5320372D3130</Hex></Comment>\n   <Device>1</Device>\n   <Height>60</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>216</Resolution>\n   <Width>60</Width>\n   <HeightDouble>60</HeightDouble>\n   <WidthDouble>60</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"12\">4170700A694F5320372D3130</Hex></Comment>\n   <Device>2</Device>\n   <Height>76</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>72</Resolution>\n   <Width>76</Width>\n   <HeightDouble>76</HeightDouble>\n   <WidthDouble>76</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"12\">4170700A694F5320372D3130</Hex></Comment>\n   <Device>2</Device>\n   <Height>76</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>76</Width>\n   <HeightDouble>76</HeightDouble>\n   <WidthDouble>76</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"12\">4170700A694F5320392D3130</Hex></Comment>\n   <Device>2</Device>\n   <Height>83</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>144</Resolution>\n   <Width>83</Width>\n   <HeightDouble>84</HeightDouble>\n   <WidthDouble>84</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n <ImageRepresentation>\n  <ImageSpecification>\n   <Comment><Hex bytes\x3D\"13\">4170700A694F532031302D3131</Hex></Comment>\n   <Device>8192</Device>\n   <Height>1024</Height>\n   <Orientation>0</Orientation>\n   <Platform>1</Platform>\n   <Resolution>72</Resolution>\n   <Width>1024</Width>\n   <HeightDouble>1024</HeightDouble>\n   <WidthDouble>1024</WidthDouble>\n  </ImageSpecification>\n </ImageRepresentation>\n</block>\n<block type\x3D\"IOSView\" ID\x3D\"241881087\">\n <ObjName>View1</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>iosView</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n <PropertyVal Name\x3D\"LargeTitleMode\">2</PropertyVal>\n <PropertyVal Name\x3D\"Title\"></PropertyVal>\n <PropertyVal Name\x3D\"TabTitle\"></PropertyVal>\n <PropertyVal Name\x3D\"TabIcon\"></PropertyVal>\n <PropertyVal Name\x3D\"NavigationBarVisible\">False</PropertyVal>\n <PropertyVal Name\x3D\"BackButtonTitle\"></PropertyVal>\n <PropertyVal Name\x3D\"Top\">0</PropertyVal>\n <PropertyVal Name\x3D\"Left\">0</PropertyVal>\n <ViewBehavior>\n  <ViewProperty>\n   <ObjName>Index</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <PropertyValue>-2147483648</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Name</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Super</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Left</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Top</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>BackButtonTitle</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>NavigationBarVisible</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>TabIcon</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>iOSImage</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>TabTitle</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Title</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LargeTitleMode</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>2</PropertyValue>\n   <ItemType>LargeTitleDisplayModes</ItemType>\n   <EditorType>Enum</EditorType>\n   <Enumeration>\n    <ItemDef>0 - Automatic</ItemDef>\n    <ItemDef>1 - Always</ItemDef>\n    <ItemDef>2 - Never</ItemDef>\n   </Enumeration>\n  </ViewProperty>\n </ViewBehavior>\n <DeviceType>0</DeviceType>\n <Orientation>0</Orientation>\n</block>\n<block type\x3D\"IOSLaunchScreen\" ID\x3D\"1399537663\">\n <ObjName>LaunchScreen</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>iosView</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n <PropertyVal Name\x3D\"BackgroundColor\">16777215</PropertyVal>\n <PropertyVal Name\x3D\"BackgroundColor\">16777215</PropertyVal>\n <PropertyVal Name\x3D\"LargeTitleMode\">2</PropertyVal>\n <PropertyVal Name\x3D\"Title\"></PropertyVal>\n <PropertyVal Name\x3D\"TabTitle\"></PropertyVal>\n <PropertyVal Name\x3D\"TabIcon\"></PropertyVal>\n <PropertyVal Name\x3D\"NavigationBarVisible\">False</PropertyVal>\n <PropertyVal Name\x3D\"BackButtonTitle\"></PropertyVal>\n <PropertyVal Name\x3D\"Top\">0</PropertyVal>\n <PropertyVal Name\x3D\"Left\">0</PropertyVal>\n <ViewBehavior>\n  <ViewProperty>\n   <ObjName>Index</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <PropertyValue>-2147483648</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Name</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Super</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Left</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Top</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>BackButtonTitle</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>NavigationBarVisible</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>TabIcon</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>iOSImage</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>TabTitle</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Title</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Text</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LargeTitleMode</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>2</PropertyValue>\n   <ItemType>LargeTitleDisplayModes</ItemType>\n   <EditorType>Enum</EditorType>\n   <Enumeration>\n    <ItemDef>0 - Automatic</ItemDef>\n    <ItemDef>1 - Always</ItemDef>\n    <ItemDef>2 - Never</ItemDef>\n   </Enumeration>\n  </ViewProperty>\n </ViewBehavior>\n <DeviceType>0</DeviceType>\n <Orientation>0</Orientation>\n</block>\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixArray, Type = String, Dynamic = False, Default = \"arsAllowPrefix() as string //\x3D Array(^2) //Override for your own prefixes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixArrayReplace, Type = String, Dynamic = False, Default = \"arsAllowPrefix() as String \x3D Array(%types%) // Created By ARGen", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixArrayUnused, Type = String, Dynamic = False, Default = \"arsAllowPrefix() as String // Not using prefixes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixSuffixArray, Type = String, Dynamic = False, Default = \"arsAllowSuffix() as string //\x3D Array(^3) //Override for your own suffixes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixSuffixArrayReplace, Type = String, Dynamic = False, Default = \"arsAllowSuffix() as String \x3D Array(%types%) // Created By ARGen", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixSuffixArrayUnused, Type = String, Dynamic = False, Default = \"arsAllowSuffix() as String // Not using suffixes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixType, Type = String, Dynamic = False, Default = \"iPrefixType as integer \x3D 0 //Override to do prefixes and suffixes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPrefixTypeReplace, Type = String, Dynamic = False, Default = \"iPrefixType as Integer \x3D %type% // Created By ARGen", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTemplateConstant, Type = String, Dynamic = False, Default = \" <Constant>\n  <ItemName>%const_name%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>%const_type%</ItemType>\n  <ItemDef>%const_value%</ItemDef>\n  <ItemFlags>%const_flags%</ItemFlags>\n </Constant>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTemplateEvent, Type = String, Dynamic = False, Default = \" <Hook>\n  <ItemName>%event_name%</ItemName>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemFlags>33</ItemFlags>\n  <SystemFlags>0</SystemFlags>\n  <ItemParams>%event_params%</ItemParams>\n  <ItemResult>%event_result%</ItemResult>\n </Hook>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTemplateProperty, Type = String, Dynamic = False, Default = \" <Property>\n  <ItemName>%prop_name%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <ItemSource>\n   <TextEncoding>134217984</TextEncoding>\n   <SourceLine>%prop_definition%</SourceLine>\n   <SourceLine></SourceLine>\n  </ItemSource>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemDeclaration>%prop_declaration%</ItemDeclaration>\n  <ItemFlags>%prop_flags%</ItemFlags>\n  <IsShared>%prop_shared%</IsShared>\n </Property>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUIStateNode, Type = String, Dynamic = False, Default = \"<block type\x3D\"UIState\" ID\x3D\"0\">\n <StudioWindowState>\n  <WindowMaximized>0</WindowMaximized>\n  <Editors>\n   <EditorCount>1</EditorCount>\n   <Editor>\n    <EditorIndex>0</EditorIndex>\n    <EditorLocation>%namespace%.GetDatabase</EditorLocation>\n    <EditorPath></EditorPath>\n   </Editor>\n   <SelectedTab>0</SelectedTab>\n  </Editors>\n </StudioWindowState>\n</block>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUIStateNodeDebugUI, Type = String, Dynamic = False, Default = \"<block type\x3D\"UIState\" ID\x3D\"0\">\n <StudioWindowState>\n  <EditBounds><Rect left\x3D\"525\" top\x3D\"175\" width\x3D\"1495\" height\x3D\"990\"/></EditBounds>\n  <WindowMaximized>0</WindowMaximized>\n  <Editors>\n   <EditorCount>1</EditorCount>\n   <Editor>\n    <EditorIndex>0</EditorIndex>\n    <EditorLocation>Strings</EditorLocation>\n    <EditorPath></EditorPath>\n    <EditorPath></EditorPath>\n   </Editor>\n   <SelectedTab>0</SelectedTab>\n  </Editors>\n </StudioWindowState>\n</block>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWebPageDefaultTemplate, Type = String, Dynamic = False, Default = \"<block type\x3D\"WebPage\" ID\x3D\"420691229\">\n <ObjName>WebPage1</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>WebPage</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n <PropertyVal Name\x3D\"Style\">None</PropertyVal>\n <PropertyVal Name\x3D\"_VerticalPercent\">0.00</PropertyVal>\n <PropertyVal Name\x3D\"_ShownEventFired\">False</PropertyVal>\n <PropertyVal Name\x3D\"_OpenEventFired\">False</PropertyVal>\n <PropertyVal Name\x3D\"_OfficialControl\">False</PropertyVal>\n <PropertyVal Name\x3D\"_NeedsRendering\">True</PropertyVal>\n <PropertyVal Name\x3D\"_Locked\">False</PropertyVal>\n <PropertyVal Name\x3D\"_IsEmbedded\">False</PropertyVal>\n <PropertyVal Name\x3D\"_ImplicitInstance\">False</PropertyVal>\n <PropertyVal Name\x3D\"_HorizontalPercent\">0.00</PropertyVal>\n <PropertyVal Name\x3D\"_DeclareLineRendered\">False</PropertyVal>\n <PropertyVal Name\x3D\"ZIndex\">1</PropertyVal>\n <PropertyVal Name\x3D\"Visible\">True</PropertyVal>\n <PropertyVal Name\x3D\"VerticalCenter\">0</PropertyVal>\n <PropertyVal Name\x3D\"Top\">0</PropertyVal>\n <PropertyVal Name\x3D\"TabOrder\">0</PropertyVal>\n <PropertyVal Name\x3D\"LockVertical\">False</PropertyVal>\n <PropertyVal Name\x3D\"LockTop\">False</PropertyVal>\n <PropertyVal Name\x3D\"LockRight\">False</PropertyVal>\n <PropertyVal Name\x3D\"LockLeft\">False</PropertyVal>\n <PropertyVal Name\x3D\"LockHorizontal\">False</PropertyVal>\n <PropertyVal Name\x3D\"LockBottom\">False</PropertyVal>\n <PropertyVal Name\x3D\"Left\">0</PropertyVal>\n <PropertyVal Name\x3D\"IsImplicitInstance\">False</PropertyVal>\n <PropertyVal Name\x3D\"Index\">-2147483648</PropertyVal>\n <PropertyVal Name\x3D\"HorizontalCenter\">0</PropertyVal>\n <PropertyVal Name\x3D\"HelpTag\"></PropertyVal>\n <PropertyVal Name\x3D\"Enabled\">True</PropertyVal>\n <PropertyVal Name\x3D\"ImplicitInstance\">True</PropertyVal>\n <PropertyVal Name\x3D\"Cursor\">0</PropertyVal>\n <PropertyVal Name\x3D\"Title\">Untitled</PropertyVal>\n <PropertyVal Name\x3D\"MinHeight\">400</PropertyVal>\n <PropertyVal Name\x3D\"MinWidth\">600</PropertyVal>\n <PropertyVal Name\x3D\"Height\">400</PropertyVal>\n <PropertyVal Name\x3D\"Width\">600</PropertyVal>\n <ViewBehavior>\n  <ViewProperty>\n   <ObjName>Cursor</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n   <EditorType>Enum</EditorType>\n   <Enumeration>\n    <ItemDef>0 - Automatic</ItemDef>\n    <ItemDef>1 - Standard Pointer</ItemDef>\n    <ItemDef>2 - Finger Pointer</ItemDef>\n    <ItemDef>3 - IBeam</ItemDef>\n    <ItemDef>4 - Wait</ItemDef>\n    <ItemDef>5 - Help</ItemDef>\n    <ItemDef>6 - Arrow All Directions</ItemDef>\n    <ItemDef>7 - Arrow North</ItemDef>\n    <ItemDef>8 - Arrow South</ItemDef>\n    <ItemDef>9 - Arrow East</ItemDef>\n    <ItemDef>10 - Arrow West</ItemDef>\n    <ItemDef>11 - Arrow Northeast</ItemDef>\n    <ItemDef>12 - Arrow Northwest</ItemDef>\n    <ItemDef>13 - Arrow Southeast</ItemDef>\n    <ItemDef>14 - Arrow Southwest</ItemDef>\n    <ItemDef>15 - Splitter East West</ItemDef>\n    <ItemDef>16 - Splitter North South</ItemDef>\n    <ItemDef>17 - Progress</ItemDef>\n    <ItemDef>18 - No Drop</ItemDef>\n    <ItemDef>19 - Not Allowed</ItemDef>\n    <ItemDef>20 - Vertical IBeam</ItemDef>\n    <ItemDef>21 - Crosshair</ItemDef>\n   </Enumeration>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Enabled</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>True</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Height</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>400</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>HelpTag</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>String</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>HorizontalCenter</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Index</ObjName>\n   <PropertyGroup>ID</PropertyGroup>\n   <PropertyValue>-2147483648 </PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>IsImplicitInstance</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Left</ObjName>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockBottom</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockHorizontal</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockLeft</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockRight</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockTop</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>LockVertical</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>MinHeight</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>400</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>MinWidth</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>600</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Name</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Super</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>ID</PropertyGroup>\n   <ItemType>String</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>TabOrder</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Title</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>Untitled</PropertyValue>\n   <ItemType>String</ItemType>\n   <EditorType>MultiLineEditor</EditorType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Top</ObjName>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>0</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>VerticalCenter</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Visible</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>True</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>Width</ObjName>\n   <Visible>1</Visible>\n   <PropertyGroup>Position</PropertyGroup>\n   <PropertyValue>600</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>ZIndex</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>1</PropertyValue>\n   <ItemType>Integer</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_DeclareLineRendered</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_HorizontalPercent</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Double</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_ImplicitInstance</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_IsEmbedded</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_Locked</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_NeedsRendering</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>True</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_OfficialControl</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <PropertyValue>False</PropertyValue>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_OpenEventFired</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_ShownEventFired</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Boolean</ItemType>\n  </ViewProperty>\n  <ViewProperty>\n   <ObjName>_VerticalPercent</ObjName>\n   <PropertyGroup>Behavior</PropertyGroup>\n   <ItemType>Double</ItemType>\n  </ViewProperty>\n </ViewBehavior>\n</block>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWebSessionTemplate, Type = String, Dynamic = False, Default = \"<block type\x3D\"WebSession\" ID\x3D\"%generate_id%\">\n <ObjName>Session</ObjName>\n <ObjContainerID>0</ObjContainerID>\n <IsClass>1</IsClass>\n <Superclass>WebSession</Superclass>\n <ItemFlags>1</ItemFlags>\n <IsInterface>0</IsInterface>\n <Compatibility></Compatibility>\n  <Constant>\n  <ItemName>ErrorDialogQuestion</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Please describe what you were doing right before the error occurred:</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>ErrorDialogMessage</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>This application has encountered an error and cannot continue.</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>ErrorDialogSubmit</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Send</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>ErrorDialogCancel</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Do Not Send</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>NoJavascriptMessage</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Javascript must be enabled to access this page.</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>NoJavascriptInstructions</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>To turn Javascript on\x2C please refer to your browser settings window.</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>ErrorThankYou</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Thank You</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n <Constant>\n  <ItemName>ErrorThankYouMessage</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>Your feedback helps us make improvements.</ItemDef>\n  <ItemFlags>64</ItemFlags>\n </Constant>\n</block>", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
