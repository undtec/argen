#tag Module
Protected Module ProjectGenerator
	#tag Method, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Private Sub ExtrasCheckUpdates()
		  var trsVersion as RecordSet = mdbExtras.SQLSelect("SELECT VersionNumber FROM t_Version ORDER BY version_id DESC LIMIT 1")
		  if trsVersion.RecordCount < 1 then
		    var ex as new RuntimeException
		    ex.Message = "Failed to read Extras.lib version number"
		    raise ex
		    
		  end
		  
		  var tiVersion as Integer = trsVersion.Field("VersionNumber").IntegerValue
		  
		  // Check updates
		  if tiVersion <> 1 then
		    break
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Protected Sub ExtrasConnect()
		  var tfExtras as FolderItem = App.DataFolder.Child(kExtrasFilename)
		  
		  // Doesn't exist, copy new
		  if tfExtras.Exists = false then
		    SpecialFolder.Resources.Child(kExtrasFilename).CopyFileTo(App.DataFolder)
		    
		  end
		  
		  // Connect
		  var tdbExtras as new SQLiteDatabase
		  tdbExtras.DatabaseFile = tfExtras
		  
		  // Encoding for value: 4uRayB@d(ohD3
		  if true then
		    var ariCode() as Integer = Array(95818, 73017, 71236, 64518, 88539, 77896, 78986, 91508, 94577, 70807, 91032, 87056, 77050)
		    var ariOffset() as Integer = Array(95701, 72935, 71115, 64452, 88428, 77844, 78922, 91404, 94537, 70756, 90935, 86988, 76950)
		    var ariIndex() as Integer = Array(1, 2, 4, 5, 9, 0, 6, 10, 8, 12, 3, 11, 7)
		    ariIndex.SortWith(ariCode, ariOffset)
		    
		    var arsDecodedChars() as String
		    for i as Integer = 0 to ariCode.Ubound
		      arsDecodedChars.append(chr(ariCode(i) - ariOffset(i)))
		    next
		    
		    tdbExtras.EncryptionKey = Join(arsDecodedChars, "")
		  end
		  
		  if tdbExtras.Connect = false then
		    // Some critical error
		    var ex as new RuntimeException
		    ex.Message = "Failed to read Extras.lib"
		    raise ex
		    
		  else
		    // Connected!
		    mdbExtras = tdbExtras
		    
		  end
		  
		  // Check updates
		  ExtrasCheckUpdates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Protected Function ExtrasList() As ProjectGenerator.ExtraLibrary()
		  // Load cache
		  if maroExtras.Ubound < 0 then
		    var trs as RecordSet = mdbExtras.SQLSelectRaiseOnError("SELECT * FROM t_Library ORDER BY LibraryName")
		    
		    while not trs.EOF
		      var toLib as new ProjectGenerator.ExtraLibrary
		      toLib.eLibraryType = ProjectGenerator.ExtraLibrary.LibraryType(trs.Field("LibraryType").IntegerValue)
		      toLib.sLibraryDescription = trs.Field("LibraryDescription").StringValue
		      toLib.sLibraryName = trs.Field("LibraryName").StringValue
		      toLib.sLibrarySource = trs.Field("LibrarySource").StringValue
		      
		      maroExtras.Append(toLib)
		      
		      trs.MoveNext
		      
		    wend
		    
		  end
		  
		  // Return cache
		  return maroExtras
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetConstant(extends toXML as XMLDocument, tsConstantName as String, tsConstantValue as String) As XMLNode
		  var tsTemplate as String = kConstantNode.ReplaceAll("%constant_name%", tsConstantName)
		  tsTemplate = tsTemplate.ReplaceAll("%constant_value%", tsConstantValue)
		  
		  return toXML.NodeFromTemplate(tsTemplate)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetContainerID(txnNode as XMLNode) As String
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ObjContainerID" and txnNode.Child(ti).FirstChild <> nil then
		      return txnNode.Child(ti).FirstChild.Value
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetControlIndex(txnControl as XMLNode) As Integer
		  if txnControl.Name <> "Control" then return -1
		  
		  var tiMax as Integer = txnControl.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnControl.Child(ti).Name = "ControlIndex" then
		      if txnControl.Child(ti).FirstChild <> nil then
		        return cdbl(txnControl.Child(ti).FirstChild.Value)
		        
		      end
		      
		    end
		    
		  next ti
		  
		  // Not found
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetControlPropertyVal(txnControl as XMLNode, tsName as String) As String
		  if txnControl.Name <> "Control" then return ""
		  
		  var tiMax as Integer = txnControl.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnControl.Child(ti).Name = "PropertyVal" then
		      if txnControl.Child(ti).GetAttribute("Name") = tsName then
		        if txnControl.Child(ti).FirstChild <> nil then
		          return txnControl.Child(ti).FirstChild.Value
		          
		        end
		        
		      end
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetItemName(txnNode as XMLNode) As String
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ItemName" and txnNode.Child(ti).FirstChild <> nil then
		      return txnNode.Child(ti).FirstChild.Value
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetItemSource(txnMethod as XMLNode) As XMLNode
		  // Look for ItemSource node
		  var tiMax as Integer = txnMethod.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    var txnTopLevel as XMLNode = txnMethod.Child(ti)
		    if txnTopLevel.Name = "ItemSource" then
		      return txnTopLevel
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMethodNamed(extends xnThis as XMLNode, tsName as String) As XMLNode
		  // Look for Method node
		  var tiMax as Integer = xnThis.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    var txnMethod as XMLNode = xnThis.Child(ti)
		    if txnMethod.Name <> "Method" then continue for ti
		    if txnMethod.FirstChild = nil then continue for ti
		    if txnMethod.FirstChild.FirstChild = nil then continue for ti
		    
		    var tsMethodName as String = txnMethod.FirstChild.FirstChild.Value
		    if tsMethodName = tsName then
		      return txnMethod
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetObjectName(txnNode as XMLNode) As String
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ObjName" and txnNode.Child(ti).FirstChild <> nil then
		      return txnNode.Child(ti).FirstChild.Value
		      
		    end
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTextEncodingNode(extends toDoc as XMLDocument) As XMLNode
		  // Creates a TextEncoding node
		  var txnEncoding as XMLNode = toDoc.CreateElement("TextEncoding")
		  txnEncoding.AppendChild(toDoc.CreateTextNode("134217984"))
		  
		  return txnEncoding
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NodeFromTemplate(extends toDoc as XMLDocument, tsTemplate as String) As XMLNode
		  // Creates an XML node from a template string and imports it to the document passed
		  if tsTemplate.Trim = "" then return nil
		  
		  // Ensure it's an XMLDocument
		  if tsTemplate.Left(kXMLHead.Len) <> kXMLHead then
		    tsTemplate = kXMLHead + EndOfLine.UNIX + tsTemplate
		    
		  end
		  
		  var toLocalDoc as new XMLDocument(tsTemplate)
		  return toDoc.ImportNode(toLocalDoc.FirstChild, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReplaceObjectContainerID(txnBlock as XMLNode, tsID as String)
		  var tiMax as Integer = txnBlock.ChildCount
		  for ti as Integer = 0 to tiMax
		    var xnThis as XMLNode = txnBlock.Child(ti)
		    
		    if xnThis <> nil and xnThis.Name = "ObjContainerID" then
		      xnThis.FirstChild.Value = tsID
		      exit for ti
		      
		    end
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetContainerID(txnNode as XMLNode, assigns tsName as String)
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ObjContainerID" and txnNode.Child(ti).FirstChild <> nil then
		      txnNode.Child(ti).FirstChild.Value = tsName
		      
		    end
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetControlIndex(txnControl as XMLNode, tiIndex as Integer)
		  if txnControl.Name <> "Control" then return
		  
		  var tsIndex as String = Format(tiIndex, "#####")
		  
		  var tiMax as Integer = txnControl.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnControl.Child(ti).Name = "ControlIndex" then
		      if txnControl.Child(ti).FirstChild <> nil then
		        txnControl.Child(ti).FirstChild.Value = tsIndex
		        return
		        
		      end
		      
		    end
		    
		  next ti
		  
		  // Not found, create
		  var txnIndex as XMLNode = txnControl.OwnerDocument.CreateElement("ControlIndex")
		  txnIndex.AppendChild(txnControl.OwnerDocument.CreateTextNode(tsIndex))
		  break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetControlPropertyVal(txnControl as XMLNode, tsName as String, tsValue as String)
		  if txnControl.Name <> "Control" then return
		  
		  var txnLastProp as XMLNode
		  
		  for ti as Integer = (txnControl.ChildCount - 1) downto 0
		    if txnControl.Child(ti).Name = "PropertyVal" then
		      if txnControl.Child(ti).GetAttribute("Name") = tsName then
		        if txnControl.Child(ti).FirstChild <> nil then
		          txnControl.Child(ti).FirstChild.Value = tsValue
		          return
		          
		        end
		        
		      end
		      
		      // Empty value is on a new control, will need to replace it
		      if txnControl.Child(ti).GetAttribute("Name") = "" then
		        var tsFlatChild as String = txnControl.Child(ti).ToString
		        if tsFlatChild.InStr("<PropertyVal Name=""" + tsName +  """") > 0 then
		          txnControl.RemoveChild(txnControl.Child(ti))
		          
		        end
		        
		      end
		      
		    elseif txnControl.Child(ti).Name = "ControlIndex" then
		      txnLastProp = txnControl.Child(ti)
		      
		    end
		    
		  next ti
		  
		  if txnLastProp = nil then
		    break
		    return
		    
		  end
		  
		  var txnProp as XMLNode = txnControl.OwnerDocument.CreateElement("PropertyVal")
		  txnProp.SetAttribute("Name", tsName)
		  txnProp.AppendChild(txnControl.OwnerDocument.CreateTextNode(tsValue))
		  
		  txnControl.Insert(txnProp, txnLastProp)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetControlPropertyVal(txnControl as XMLNode, tsName as String, xnValue as XMLNode)
		  if txnControl.Name <> "Control" then return
		  
		  var txnLastProp as XMLNode
		  
		  for ti as Integer = (txnControl.ChildCount - 1) downto 0
		    if txnControl.Child(ti).Name = "PropertyVal" then
		      if txnControl.Child(ti).GetAttribute("Name") = tsName then
		        if txnControl.Child(ti).FirstChild <> nil then
		          if txnControl.Child(ti).ChildCount = 1 then
		            txnControl.RemoveChild(txnControl.Child(ti))
		            txnControl.AppendChild(xnValue)
		            
		          end
		          
		        end
		        
		      end
		      
		      // Empty value is on a new control, will need to replace it
		      if txnControl.Child(ti).GetAttribute("Name") = "" then
		        var tsFlatChild as String = txnControl.Child(ti).ToString
		        if tsFlatChild.InStr("<PropertyVal Name=""" + tsName +  """") > 0 then
		          txnControl.RemoveChild(txnControl.Child(ti))
		          
		        end
		        
		      end
		      
		    elseif txnControl.Child(ti).Name = "ControlIndex" then
		      txnLastProp = txnControl.Child(ti)
		      
		    end
		    
		  next ti
		  
		  if txnLastProp = nil then
		    break
		    return
		    
		  end
		  
		  var txnProp as XMLNode = txnControl.OwnerDocument.CreateElement("PropertyVal")
		  txnProp.SetAttribute("Name", tsName)
		  txnProp.AppendChild(xnValue)
		  
		  txnControl.Insert(txnProp, txnLastProp)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetItemName(txnNode as XMLNode, assigns tsName as String)
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ItemName" and txnNode.Child(ti).FirstChild <> nil then
		      txnNode.Child(ti).FirstChild.Value = tsName
		      return
		      
		    end
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetObjectName(txnNode as XMLNode, assigns tsName as String)
		  var tiMax as Integer = txnNode.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    if txnNode.Child(ti).Name = "ObjName" and txnNode.Child(ti).FirstChild <> nil then
		      txnNode.Child(ti).FirstChild.Value = tsName
		      return
		      
		    end
		    
		  next ti
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private maroExtras() As ProjectGenerator.ExtraLibrary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbLoaded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdbExtras As SQLiteDatabase
	#tag EndProperty


	#tag Constant, Name = kConstantNode, Type = String, Dynamic = False, Default = \" <Constant>\n  <ItemName>%constant_name%</ItemName>\n  <Compatibility></Compatibility>\n  <Visible>1</Visible>\n  <TextEncoding>134217984</TextEncoding>\n  <ItemType>0</ItemType>\n  <ItemDef>%constant_value%</ItemDef>\n  <ItemFlags>65</ItemFlags>\n </Constant>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kExtrasFilename, Type = String, Dynamic = False, Default = \"Extras.lib", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderAddEditInstanceName, Type = String, Dynamic = False, Default = \"%addedit_instance_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderAddEditInstanceSuper, Type = String, Dynamic = False, Default = \"%addedit_instance_super%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderccOKInstance, Type = String, Dynamic = False, Default = \"%ccOKCancel_Instance%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderControlName, Type = String, Dynamic = False, Default = \"%control_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderDBType, Type = String, Dynamic = False, Default = \"%db_type%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderGenerate_ID, Type = String, Dynamic = False, Default = \"%generate_id%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderLabelName, Type = String, Dynamic = False, Default = \"%label_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderLabelValue, Type = String, Dynamic = False, Default = \"%label_value%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderNamespace, Type = String, Dynamic = False, Default = \"%namespace%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderNamespace_ID, Type = String, Dynamic = False, Default = \"%namespace_id%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderPreparedStatement, Type = String, Dynamic = False, Default = \"%preparedstatementtype%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderTableListInstanceName, Type = String, Dynamic = False, Default = \"%tablelist_instance_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderTableListInstanceSuper, Type = String, Dynamic = False, Default = \"%tablelist_instance_super%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderTableName, Type = String, Dynamic = False, Default = \"%tablename%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderTableViewSuper, Type = String, Dynamic = False, Default = \"%tableview_super%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderViewListInstanceName, Type = String, Dynamic = False, Default = \"%viewlist_instance_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderViewListInstanceSuper, Type = String, Dynamic = False, Default = \"%viewlist_instance_super%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderViewViewInstanceName, Type = String, Dynamic = False, Default = \"%viewview_instance_name%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlaceholderViewViewInstanceSuper, Type = String, Dynamic = False, Default = \"%viewview_instance_super%", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kXMLHead, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Module
#tag EndModule
