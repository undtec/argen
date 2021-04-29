#tag Class
Private Class TableUI
	#tag Method, Flags = &h0
		Sub Constructor()
		  moXML = new XMLDocument
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateAddEditControls()
		  // Set up AddEdit controls
		  for each toProp as ARProject.ClassPropertyInfo in oTable.aroFields
		    SetupUIRowForProperty(toProp)
		    
		  next toProp
		  
		  // Look for where ControlBehavior ends
		  var txnFirstControl as XMLNode
		  var tiMax as Integer = mxnDetailCC.ChildCount - 1
		  for tiNode as Integer = 0 to tiMax
		    var txnThisNode as XMLNode = mxnDetailCC.Child(tiNode)
		    if txnThisNode.Name = "Control" then
		      // This is the first control, where ControlBehavior ends
		      txnFirstControl = txnThisNode
		      exit for tiNode
		      
		    end
		    
		  next tiNode
		  
		  if txnFirstControl = nil then
		    raise new TPProjectReadException("Couldn't find the first control in the template")
		  end
		  
		  // Get the last control index
		  var tiControlCount as Integer = GetControlIndex(mxnDetailCC.Child(tiMax))
		  tiControlCount = tiControlCount + 1
		  
		  // Calculate positioning by control row
		  var tiColumnMaxWidth as Integer
		  var tiLabelIndex as Integer = -1
		  var tiLabelLeft as Integer
		  var tiTop as Integer
		  var tiRowsMax as Integer = arxnControls.Ubound
		  for tiRow as Integer = 0 to tiRowsMax
		    // Handle label
		    var tiLabelHeight, tiLabelWidth as Integer
		    var txnLabel as XMLNode = arxnLabels(tiRow)
		    if txnLabel <> nil then
		      // Web 2.0 no control sets
		      if oProject.eProjectType = ProjectType.Web and oProject.iProjectAPI = 2 then
		        SetControlPropertyVal(arxnLabels(tiRow), "Name", oUI.sLabelColumnName + Format(tiRow, "######"))
		        
		      else
		        SetControlPropertyVal(txnLabel, "Index", Format(tiRow, "#####"))
		        
		      end
		      
		      SetControlPropertyVal(txnLabel, "Left", Format(tiLabelLeft, "#####"))
		      SetControlPropertyVal(txnLabel, "Top", Format(tiTop, "#####"))
		      
		      // Get an index for the labelset
		      if tiLabelIndex < 0 then
		        tiLabelIndex = tiControlCount
		        tiControlCount = tiControlCount + 1
		        
		      end
		      
		      // Set label index
		      SetControlIndex(arxnLabels(tiRow), tiLabelIndex)
		      
		      tiLabelHeight = cdbl(GetControlPropertyVal(txnLabel, "Height"))
		      tiLabelWidth = cdbl(GetControlPropertyVal(txnLabel, "Width"))
		      
		    end
		    
		    // Handle control
		    var tiControlLeft as Integer = tiLabelLeft + tiLabelWidth + 20
		    var txnControl as XMLNode = arxnControls(tiRow)
		    SetControlPropertyVal(txnControl, "Left", Format(tiControlLeft, "#####"))
		    SetControlPropertyVal(txnControl, "Top", Format(tiTop, "#####"))
		    
		    var tiControlHeight as Integer = cdbl(GetControlPropertyVal(txnControl, "Height"))
		    var tiControlWidth as Integer = cdbl(GetControlPropertyVal(txnControl, "Width"))
		    tiColumnMaxWidth = Max(tiColumnMaxWidth, tiControlWidth)
		    
		    // Set control index
		    SetControlIndex(txnControl, tiControlCount)
		    tiControlCount = tiControlCount + 1
		    
		    // Calculate next row
		    tiTop = tiTop + Max(tiLabelHeight, tiControlHeight) + 12
		    
		    // Reset row
		    if tiTop > 400 then
		      tiTop = 0
		      tiLabelLeft = tiControlLeft + 20 + tiColumnMaxWidth + 20
		      
		      tiColumnMaxWidth = 0
		      
		    end
		    
		  next tiRow
		  
		  // Append labelset behavior
		  mxnDetailCC.Insert(moXML.ImportNode(xnLabelsBehavior, true), txnFirstControl)
		  
		  // Append behaviors
		  for ti as Integer = 0 to arxnBehaviors.Ubound
		    mxnDetailCC.Insert(moXML.ImportNode(arxnBehaviors(ti), true), txnFirstControl)
		    
		  next ti
		  
		  // Append labelset
		  for ti as Integer = 0 to arxnLabels.Ubound
		    if arxnLabels(ti) <> nil then
		      mxnDetailCC.AppendChild(moXML.ImportNode(arxnLabels(ti), true))
		      
		    end
		    
		  next ti
		  
		  // Append controls
		  for ti as Integer = 0 to arxnControls.Ubound
		    mxnDetailCC.AppendChild(moXML.ImportNode(arxnControls(ti), true))
		    
		  next ti
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUINodes() As XMLNode()
		  if mxnDetailCC = nil then
		    SetupNodes
		    
		    // Set up AddEdit
		    if oTable.bView = false then
		      CreateAddEditControls
		      
		    end
		    
		  end
		  
		  var arxnReturn() as XMLNode
		  
		  arxnReturn.Append(mxnDetailCC)
		  arxnReturn.Append(mxnListCC)
		  arxnReturn.Append(mxnDetailWin)
		  arxnReturn.Append(mxnListWin)
		  
		  return arxnReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LocalizeControl(toProp as ARProject.ClassPropertyInfo, txnControl as XMLNode)
		  var tsConstantName as String = oTable.sTableName + toProp.sColumnName + "Label"
		  var tsConstantTemplate as String = kConstantNode.ReplaceAll("%constant_name%", tsConstantName)
		  tsConstantTemplate = tsConstantTemplate.ReplaceAll("%constant_value%", toProp.sLabelText)
		  
		  // Replace the label value
		  if toProp.eUIType = UIType.ControlCheckbox then
		    SetControlPropertyVal(txnControl, "Caption", "#Strings." + tsConstantName)
		    
		  else
		    SetControlPropertyVal(txnControl, "Text", "#Strings." + tsConstantName)
		    
		  end
		  
		  // Add the constant to the Localization module
		  xnLocalization.AppendChild(xnLocalization.OwnerDocument.NodeFromTemplate(tsConstantTemplate))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupNodes()
		  var toRoot as XMLNode = moXML.AppendChild(moXML.CreateElement("Root"))
		  #pragma unused toRoot
		  
		  // Get container templates
		  var tsDetailCC, tsDetailWin, tsListCC, tsListWin as String
		  
		  if oTable.bView = false then
		    tsDetailCC = oUI.sTemplateTableAddEditContainer
		    tsDetailWin = oUI.sTemplateTableAddEditWindow
		    tsListCC = oUI.sTemplateTableListContainer
		    tsListWin = oUI.sTemplateTableListWindow
		    
		  else
		    tsDetailCC = oUI.sTemplateViewViewContainer
		    tsDetailWin = oUI.sTemplateViewViewWindow
		    tsListCC = oUI.sTemplateViewListContainer
		    tsListWin = oUI.sTemplateViewListWindow
		    
		  end
		  
		  // Process placeholders
		  var arprReplacements() as Pair
		  arprReplacements.Append(new Pair(kPlaceholderTableName, oTable.sTableName))
		  
		  for each tprReplace as Pair in arprReplacements
		    tsDetailCC = tsDetailCC.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsDetailWin = tsDetailWin.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsListCC = tsListCC.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsListWin = tsListWin.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    
		  next tprReplace
		  
		  // Create the node objects
		  mxnDetailCC = moXML.NodeFromTemplate(tsDetailCC)
		  mxnDetailWin = moXML.NodeFromTemplate(tsDetailWin)
		  mxnListCC = moXML.NodeFromTemplate(tsListCC)
		  mxnListWin = moXML.NodeFromTemplate(tsListWin)
		  
		  // Setup the names
		  var tsDetailName as String
		  if oTable.bView = false then
		    tsDetailName = oTable.sTableName + "AddEdit"
		    
		  else
		    tsDetailName = oTable.sTableName + "View"
		    
		  end
		  
		  var tsListName as String = oTable.sTableName + "List"
		  
		  // Set generated names
		  SetObjectName(mxnDetailCC) = GenerateControlName(tsDetailName, ARProject.UIType.DisplayContainer)
		  SetObjectName(mxnListCC) = GenerateControlName(tsListName, ARProject.UIType.DisplayContainer)
		  
		  if oProject.eProjectType = ProjectType.Desktop then
		    SetObjectName(mxnDetailWin) = GenerateControlName(tsDetailName, ARProject.UIType.DisplayWindow)
		    SetObjectName(mxnListWin) = GenerateControlName(tsListName, ARProject.UIType.DisplayWindow)
		    
		  elseif oProject.eProjectType = ProjectType.Web then
		    SetObjectName(mxnDetailWin) = GenerateControlName(tsDetailName, ARProject.UIType.DisplayWebPage)
		    SetObjectName(mxnListWin) = GenerateControlName(tsListName, ARProject.UIType.DisplayWebPage)
		    
		  end
		  
		  // Prepare instances
		  redim arprReplacements(-1)
		  
		  var tsDetailInstanceName as String = GenerateControlName(tsDetailName, ARProject.UIType.ControlContainer)
		  var tsListInstanceName as String = GenerateControlName(tsListName, ARProject.UIType.ControlContainer)
		  
		  arprReplacements.Append(new Pair(kPlaceholderAddEditInstanceName, tsDetailInstanceName))
		  arprReplacements.Append(new Pair(kPlaceholderAddEditInstanceSuper, GetObjectName(mxnDetailCC)))
		  arprReplacements.Append(new Pair(kPlaceholderTableListInstanceName, tsListInstanceName))
		  arprReplacements.Append(new Pair(kPlaceholderTableListInstanceSuper, GetObjectName(mxnListCC)))
		  arprReplacements.Append(new Pair(kPlaceholderViewListInstanceName, tsListInstanceName))
		  arprReplacements.Append(new Pair(kPlaceholderViewListInstanceSuper, GetObjectName(mxnListCC)))
		  arprReplacements.Append(new Pair(kPlaceholderViewViewInstanceName, tsDetailInstanceName))
		  arprReplacements.Append(new Pair(kPlaceholderViewViewInstanceSuper, GetObjectName(mxnDetailCC)))
		  
		  // Setup Window replacements
		  var tsWindowInstanceName as String = GenerateControlName(tsDetailName, ARProject.UIType.DisplayWindow)
		  var tsPageInstanceName as String = GenerateControlName(tsDetailName, ARProject.UIType.DisplayWebPage)
		  arprReplacements.Append(new Pair("win" + tsDetailName, tsWindowInstanceName))
		  arprReplacements.Append(new Pair("pg" + tsDetailName, tsPageInstanceName))
		  
		  // Swap in generated names
		  tsDetailCC = mxnDetailCC.ToString
		  tsDetailWin = mxnDetailWin.ToString
		  tsListCC = mxnListCC.ToString
		  tsListWin = mxnListWin.ToString
		  
		  for each tprReplace as Pair in arprReplacements
		    tsDetailCC = tsDetailCC.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsDetailWin = tsDetailWin.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsListCC = tsListCC.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    tsListWin = tsListWin.ReplaceAll(tprReplace.Left, tprReplace.Right)
		    
		  next tprReplace
		  
		  // Back to nodes
		  mxnDetailCC = moXML.NodeFromTemplate(tsDetailCC)
		  mxnDetailWin = moXML.NodeFromTemplate(tsDetailWin)
		  mxnListCC = moXML.NodeFromTemplate(tsListCC)
		  mxnListWin = moXML.NodeFromTemplate(tsListWin)
		  
		  // Put em in the folder
		  ReplaceObjectContainerID(mxnDetailCC, sTableFolderID)
		  ReplaceObjectContainerID(mxnDetailWin, sTableFolderID)
		  ReplaceObjectContainerID(mxnListCC, sTableFolderID)
		  ReplaceObjectContainerID(mxnListWin, sTableFolderID)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupUIRowForProperty(toProp as ARProject.ClassPropertyInfo)
		  // Method gets Label and Control from container template
		  // tarxnThisPropertyControls will contain this single property controls
		  var tarxnThisPropertyControls(-1) as XMLNode
		  tarxnThisPropertyControls = oUI.GetControlsForProperty(toProp)
		  
		  // Display: None, continue
		  if tarxnThisPropertyControls.Ubound < 0 then return
		  
		  var artxnControlBehavior() as XMLNode
		  
		  for ti as Integer = 0 to tarxnThisPropertyControls.Ubound
		    var txnThisControl as XMLNode = tarxnThisPropertyControls(ti)
		    
		    select case txnThisControl.Name
		    case "Control"
		      var tsControlName as String = GetControlPropertyVal(txnThisControl, "Name")
		      if tsControlName = oUI.sLabelColumnName then
		        // Handle labels
		        if xnLabelsBehavior = nil then xnLabelsBehavior = artxnControlBehavior(0)
		        artxnControlBehavior.Remove(0)
		        
		        // Setup Localization constant here
		        if oProject.DataClass.bLocalizeLabels = true then
		          LocalizeControl(toProp, txnThisControl)
		          
		        end
		        
		        arxnLabels.Append(txnThisControl)
		        
		      else
		        // Store control
		        arxnControls.Append(txnThisControl)
		        arxnBehaviors.Append(artxnControlBehavior(0))
		        artxnControlBehavior.Remove(0)
		        
		        // No label for checkboxes
		        if toProp.eUIType = ARProject.UIType.ControlCheckbox then
		          if oProject.DataClass.bLocalizeLabels = true then
		            LocalizeControl(toProp, txnThisControl)
		            
		          end
		          
		          arxnLabels.Append(nil)
		          
		        end
		        
		        // No label for WebListBox
		        if oProject.eProjectType = ProjectType.Web and toProp.eUIType = ARProject.UIType.ControlListbox then
		          arxnLabels.Append(nil)
		          
		        end
		        
		      end
		      
		    case "ControlBehavior"
		      // Cache the behavior, it comes first.
		      artxnControlBehavior.Append(txnThisControl)
		      
		    end select
		    
		  next ti
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arxnBehaviors() As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h0
		arxnControls() As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h0
		arxnLabels() As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moXML As XMLDocument
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mxnDetailCC As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mxnDetailWin As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mxnListCC As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mxnListWin As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty

	#tag Property, Flags = &h0
		oTable As ARProject.TableData
	#tag EndProperty

	#tag Property, Flags = &h0
		oUI As ProjectGenerator.UITemplate
	#tag EndProperty

	#tag Property, Flags = &h0
		sTableFolderID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		xnLabelsBehavior As XMLNode
	#tag EndProperty

	#tag Property, Flags = &h0
		xnLocalization As XMLNode
	#tag EndProperty


	#tag Constant, Name = kLabelBehaviorTemplate, Type = String, Dynamic = False, Default = \"<ControlBehavior><Superclass>Label</Superclass></ControlBehavior>", Scope = Private
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
		#tag ViewProperty
			Name="sTableFolderID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
