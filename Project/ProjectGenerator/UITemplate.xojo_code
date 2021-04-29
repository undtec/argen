#tag Class
Private Class UITemplate
	#tag Method, Flags = &h0
		Sub AppendNode(txnNode as XMLNode)
		  if txnNode.GetAttribute("type") = "Folder" then
		    // If folder, keep ID
		    marsUIIDs.Append(txnNode.GetAttribute("ID"))
		    
		  else
		    // Look for template objects
		    select case ProjectGenerator.GetObjectName(txnNode)
		    case "cct_TableList", "cct_TableAddEdit", "wint_TableList", "wint_TableAddEdit", _
		      "ccvw_ViewList", "ccvw_ViewView", "winvw_ViewList", "winvw_ViewView"
		      // Specific tasks with UI template classes
		      ReadTemplateNode(txnNode)
		      
		      
		    case else
		      var tsParent as String = GetContainerID(txnNode)
		      if tsParent = sDependenciesID then
		        // Read and rename the dependencies
		        ReadDependency(txnNode)
		        
		      else
		        // Append other children for insertion into project
		        arxnChildren.Append(txnNode)
		        
		      end
		      
		    end select
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DocumentForControl(tsControl as String) As XMLDocument
		  if tsControl.Left(kXMLHead.Len) <> kXMLHead then
		    tsControl = kXMLHead + EndOfLine.UNIX + tsControl
		    
		  end
		  
		  var toLocalDoc as new XMLDocument(tsControl)
		  
		  // Remove nodes we don't want
		  for ti as Integer = (toLocalDoc.DocumentElement.ChildCount - 1) downto 0
		    var txnThis as XMLNode = toLocalDoc.DocumentElement.Child(ti)
		    
		    if txnThis.Name <> "Control" and txnThis.Name <> "ControlBehavior" then
		      toLocalDoc.DocumentElement.RemoveChild(txnThis)
		      
		    end
		    
		  next ti
		  
		  return toLocalDoc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetControlsForProperty(toProp as ARProject.ClassPropertyInfo) As XMLNode()
		  var tarxnReturn() as XMLNode
		  
		  var tsControl as String
		  
		  select case toProp.eUIType
		  case ARProject.UIType.None
		    return tarxnReturn
		    
		  case ARProject.UIType.ControlCheckbox
		    tsControl = sTemplateControlCheckbox
		    
		  case ARProject.UIType.ControlLabel
		    tsControl = sTemplateControlLabel
		    
		  case ARProject.UIType.ControlListbox
		    tsControl = sTemplateControlListbox
		    
		  case ARProject.UIType.ControlPopupMenu
		    tsControl = sTemplateControlPopupMenu
		    
		  case ARProject.UIType.ControlTextArea
		    tsControl = sTemplateControlTextArea
		    
		  case ARProject.UIType.ControlTextField, _
		    ARProject.UIType.ControlPassword
		    tsControl = sTemplateControlTextField
		    
		    // Set Password flag
		    if toProp.eUIType = ARProject.UIType.ControlPassword then
		      if oProject.eProjectType = ProjectType.Desktop then
		        tsControl = tsControl.ReplaceAll("<PropertyVal Name=""Password"">False</PropertyVal>", _
		        "<PropertyVal Name=""Password"">True</PropertyVal>")
		        
		      elseif oProject.eProjectType = ProjectType.Web then
		        tsControl = tsControl.ReplaceAll("<PropertyVal Name=""Type"">0</PropertyVal>", _
		        "<PropertyVal Name=""Type"">1</PropertyVal>")
		        
		      end
		      
		    end
		    
		  case ARProject.UIType.Unknown
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		  // Get placeholder values
		  var tsControlName as String = GenerateControlName(toProp.sColumnName, toProp.eUIType)
		  
		  // Replace placeholders
		  tsControl = tsControl.ReplaceAll(kPlaceholderLabelName, sLabelColumnName)
		  tsControl = tsControl.ReplaceAll(kPlaceholderLabelValue, toProp.sLabelText)
		  tsControl = tsControl.ReplaceAll(kPlaceholderControlName, tsControlName)
		  
		  // Make it an XMLNode
		  var txdControl as XMLDocument = DocumentForControl(tsControl)
		  for ti as Integer = 0 to (txdControl.DocumentElement.ChildCount - 1)
		    tarxnReturn.Append(txdControl.DocumentElement.Child(ti))
		    
		  next ti
		  
		  return tarxnReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsIgnored(txnNode as XMLNode) As Boolean
		  var tsID as String = txnNode.GetAttribute("ID")
		  var tsParentID as String = GetContainerID(txnNode)
		  
		  // If ignoring parent, ignore this child too
		  if arsIgnoredIDs.IndexOf(tsParentID) > -1 then
		    arsIgnoredIDs.Append(tsID)
		    return true
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsIncludedDependency(txnModule as XMLNode) As Boolean
		  var tsContainerID as String = GetContainerID(txnModule)
		  
		  // No parent, not a ui element
		  if tsContainerID = "0" then return false
		  
		  // Direct child of UI
		  if sDependenciesID <> "" and tsContainerID = sDependenciesID then return true
		  
		  // Child of child of UI
		  if marsUIIDs.IndexOf(tsContainerID) > -1 then return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadComponent(txnModule as XMLNode)
		  var tsName as String = GetObjectName(txnModule)
		  
		  // Don't need the app object
		  if tsName = "App" then return
		  
		  // Look for our known components to load
		  select case tsName
		  case "CheckboxControl"
		    sTemplateControlCheckbox = ReadComponentNode(txnModule)
		    return
		    
		  case "LabelControl"
		    sTemplateControlLabel = ReadComponentNode(txnModule)
		    return
		    
		  case "ListboxControl"
		    sTemplateControlListbox = ReadComponentNode(txnModule)
		    return
		    
		  case "PopupMenuControl"
		    sTemplateControlPopupMenu = ReadComponentNode(txnModule)
		    return
		    
		  case "TextAreaControl"
		    sTemplateControlTextArea = ReadComponentNode(txnModule)
		    return
		    
		  case "TextFieldControl"
		    sTemplateControlTextField = ReadComponentNode(txnModule)
		    return
		    
		  end select
		  
		  break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadComponentNode(txnBlock as XMLNode) As String
		  // Fix that ID
		  txnBlock.SetAttribute("ID", kPlaceholderGenerate_ID)
		  
		  // Placeholder-ify
		  var tsTemplate as String = txnBlock.ToString
		  tsTemplate = tsTemplate.ReplaceAll("t_Table", kPlaceholderTableName)
		  tsTemplate = tsTemplate.ReplaceAll("vw_View", kPlaceholderTableName)
		  tsTemplate = tsTemplate.ReplaceAll("DataFile", kPlaceholderNamespace)
		  tsTemplate = tsTemplate.ReplaceAll("PreparedSQLStatement", kPlaceholderPreparedStatement)
		  
		  tsTemplate = tsTemplate.ReplaceAll("ActiveRecordControl", kPlaceholderControlName)
		  tsTemplate = tsTemplate.ReplaceAll("ActiveRecordLabel", kPlaceholderLabelName)
		  
		  
		  return tsTemplate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadDependency(txnBlock as XMLNode)
		  // Fix that ID
		  txnBlock.SetAttribute("ID", kPlaceholderGenerate_ID)
		  
		  var tsName as String = GetObjectName(txnBlock)
		  
		  var rx as new RegEx
		  rx.SearchPattern = "([a-z]+)([A-Z][A-Za-z]+)"
		  rx.Options.CaseSensitive = true
		  
		  // Rename it if possible
		  var rxm as RegExMatch = rx.Search(tsName)
		  if rxm <> nil then
		    var tsType as String = rxm.SubExpressionString(1)
		    var tsBaseName as String = rxm.SubExpressionString(2)
		    var tsCompositeName as String
		    
		    select case tsType
		    case "cc"
		      tsCompositeName = GenerateControlName(tsBaseName, UIType.DisplayContainer)
		      
		    case "dlg"
		      tsCompositeName = GenerateControlName(tsBaseName, UIType.DisplayWebDialog)
		      
		    case "st"
		      tsCompositeName = tsName
		      
		    case else
		      raise new TPUnimplementedException(CurrentMethodName)
		      
		    end
		    
		    SetObjectName(txnBlock) = tsCompositeName
		    
		  end
		  
		  arxnChildren.Append(txnBlock)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadTemplateNode(txnBlock as XMLNode)
		  // Fix that ID
		  txnBlock.SetAttribute("ID", kPlaceholderGenerate_ID)
		  
		  // Placeholder-ify
		  var tsTemplate as String = txnBlock.ToString
		  tsTemplate = tsTemplate.ReplaceAll("ctlt_TableAddEdit", kPlaceholderAddEditInstanceName)
		  tsTemplate = tsTemplate.ReplaceAll("cct_TableAddEdit", kPlaceholderAddEditInstanceSuper)
		  tsTemplate = tsTemplate.ReplaceAll("ctlt_TableList", kPlaceholderTableListInstanceName)
		  tsTemplate = tsTemplate.ReplaceAll("cct_TableList", kPlaceholderTableListInstanceSuper)
		  tsTemplate = tsTemplate.ReplaceAll("ctlvw_ViewList", kPlaceholderViewListInstanceName)
		  tsTemplate = tsTemplate.ReplaceAll("ccvw_ViewList", kPlaceholderViewListInstanceSuper)
		  tsTemplate = tsTemplate.ReplaceAll("ctlvw_ViewView", kPlaceholderViewViewInstanceName)
		  tsTemplate = tsTemplate.ReplaceAll("ccvw_ViewView", kPlaceholderViewViewInstanceSuper)
		  tsTemplate = tsTemplate.ReplaceAll("ccvw_ViewView", kPlaceholderViewViewInstanceSuper)
		  
		  if oProject.eProjectType = ProjectType.Web then
		    tsTemplate = tsTemplate.ReplaceAll("wint_TableAddEdit", _
		    GenerateControlName(kPlaceholderTableName + "AddEdit", UIType.DisplayWebPage))
		    
		    tsTemplate = tsTemplate.ReplaceAll("wint_TableList", _
		    GenerateControlName(kPlaceholderTableName + "List", UIType.DisplayWebPage))
		    
		    tsTemplate = tsTemplate.ReplaceAll("winvw_ViewView", _
		    GenerateControlName(kPlaceholderTableName + "View", UIType.DisplayWebPage))
		    
		  end
		  
		  tsTemplate = tsTemplate.ReplaceAll("t_Table", kPlaceholderTableName)
		  tsTemplate = tsTemplate.ReplaceAll("vw_View", kPlaceholderTableName)
		  tsTemplate = tsTemplate.ReplaceAll("DataFile", kPlaceholderNamespace)
		  tsTemplate = tsTemplate.ReplaceAll("PreparedSQLStatement", kPlaceholderPreparedStatement)
		  
		  // Fix literal template control names
		  // tsTemplate = tsTemplate.ReplaceAll("btnAdd", GenerateControlName("Add", UIType.ControlButton))
		  // tsTemplate = tsTemplate.ReplaceAll("btnDelete", GenerateControlName("Delete", UIType.ControlButton))
		  // tsTemplate = tsTemplate.ReplaceAll("btnEdit", GenerateControlName("Edit", UIType.ControlButton))
		  tsTemplate = tsTemplate.ReplaceAll("ccAddEditDeleteButons", GenerateControlName("AddEditDeleteButons", ARProject.UIType.DisplayContainer))
		  tsTemplate = tsTemplate.ReplaceAll("ccOKCancel", GenerateControlName("OKCancel", ARProject.UIType.DisplayContainer))
		  tsTemplate = tsTemplate.ReplaceAll("ccPagination", GenerateControlName("Pagination", ARProject.UIType.DisplayContainer))
		  tsTemplate = tsTemplate.ReplaceAll("ccSearch", GenerateControlName("Search", ARProject.UIType.DisplayContainer))
		  tsTemplate = tsTemplate.ReplaceAll("ctlOK", GenerateControlName("OK", ARProject.UIType.ControlContainer))
		  tsTemplate = tsTemplate.ReplaceAll("lbData", GenerateControlName("Data", UIType.ControlListbox))
		  tsTemplate = tsTemplate.ReplaceAll("lbRows", GenerateControlName("Rows", UIType.ControlListbox))
		  tsTemplate = tsTemplate.ReplaceAll("txtSearch", GenerateControlName("Search", UIType.ControlTextField))
		  
		  var tsName as String = ProjectGenerator.GetObjectName(txnBlock)
		  select case tsName
		  case "cct_TableList"
		    sTemplateTableListContainer = tsTemplate
		    
		  case "cct_TableAddEdit"
		    sTemplateTableAddEditContainer = tsTemplate
		    
		  case "wint_TableList"
		    sTemplateTableListWindow = tsTemplate
		    
		  case "wint_TableAddEdit"
		    sTemplateTableAddEditWindow = tsTemplate
		    
		  case "ccvw_ViewList"
		    sTemplateViewListContainer = tsTemplate
		    
		  case "ccvw_ViewView"
		    sTemplateViewViewContainer = tsTemplate
		    
		  case "winvw_ViewList"
		    sTemplateViewListWindow = tsTemplate
		    
		  case "winvw_ViewView"
		    sTemplateViewViewWindow = tsTemplate
		    
		  end select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arsIgnoredIDs() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		arxnChildren() As XMLNode
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbPrefix
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbPrefix = value
			  
			  // Set ColumnName name
			  if mbPrefix then
			    sLabelColumnName = TPSettings.Get("kLabel", "lbl") + "ColumnName"
			    
			  else
			    sLabelColumnName = "ColumnName" + TPSettings.Get("kLabelSuffix", "Label")
			    
			  end
			End Set
		#tag EndSetter
		bPrefix As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private marsUIIDs() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbPrefix As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty

	#tag Property, Flags = &h0
		sDependenciesID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sLabelColumnName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlCheckbox As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlListbox As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlPopupMenu As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlTextArea As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateControlTextField As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateTableAddEditContainer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateTableAddEditWindow As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateTableListContainer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateTableListWindow As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateViewListContainer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateViewListWindow As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateViewViewContainer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTemplateViewViewWindow As String
	#tag EndProperty


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
			Name="sTemplateTableAddEditContainer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateTableAddEditWindow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateTableListContainer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateTableListWindow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateViewListContainer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateViewListWindow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateViewViewContainer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateViewViewWindow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlCheckbox"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlLabel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlListbox"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlPopupMenu"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlTextArea"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTemplateControlTextField"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDependenciesID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sLabelColumnName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bPrefix"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
