#tag Class
Private Class CodeGenerator
	#tag Method, Flags = &h21
		Private Function CreateSourceLine(tsLine as String) As XMLNode
		  var xnLine as XMLNode = xnUI.OwnerDocument.CreateElement("SourceLine")'
		  xnLine.AppendChild(xnUI.OwnerDocument.CreateTextNode(tsLine))
		  
		  return xnLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindInsertionPointAfter(tsLine as String, txnSource as XMLNode) As XMLNode
		  for tiLine as Integer = 0 to (txnSource.ChildCount - 1)
		    var txnLine as XMLNode = txnSource.Child(tiLine)
		    var tsSourceLine as String
		    
		    // Handle blank lines
		    if txnLine.FirstChild <> nil then
		      tsSourceLine = txnLine.FirstChild.Value
		      
		    end
		    
		    if tsSourceLine = tsLine then
		      return txnLine.NextSibling
		      
		    end
		    
		  next tiLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetControlNamed(tsName as String) As XMLNode
		  // Look for Method node
		  var tiMax as Integer = xnUI.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    var txnControl as XMLNode = xnUI.Child(ti)
		    if txnControl.Name <> "Control" then continue for ti
		    
		    var tiControlMax as Integer = txnControl.ChildCount - 1
		    for tiControlChild as Integer = 0 to tiControlMax
		      var txnControlChild as XMLNode = txnControl.Child(tiControlChild)
		      
		      // Hack because XMLNode.GetAttribute doesn't work on new nodes...
		      var tsFlatChild as String = txnControlChild.ToString
		      if tsFlatChild.InStr("<PropertyVal Name=""Name"">" + tsName + "</PropertyVal>") > 0 then
		        return txnControl
		        
		      end
		      
		    next tiControlChild
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetHookNamed(tsName as String) As XMLNode
		  // Look for Hook node
		  // This returns the first one it finds.
		  // Need some way to name the control it's looking for,
		  // but the translation from binary makes this really difficult.
		  var tiMax as Integer = xnUI.ChildCount - 1
		  for ti as Integer = 0 to tiMax
		    var txnBehavior as XMLNode = xnUI.Child(ti)
		    if txnBehavior.Name <> "ControlBehavior" then continue for ti
		    for tiBehavior as Integer = 0 to (txnBehavior.ChildCount - 1)
		      var txnBehaviorChild as XMLNode = txnBehavior.Child(tiBehavior)
		      if txnBehaviorChild.Name <> "HookInstance" then continue for tiBehavior
		      if txnBehaviorChild.FirstChild = nil then continue for ti
		      if txnBehaviorChild.FirstChild.FirstChild = nil then continue for ti
		      
		      var tsHookName as String = txnBehaviorChild.FirstChild.FirstChild.Value
		      if tsHookName = tsName then
		        return txnBehaviorChild
		        
		      end
		      
		    next tiBehavior
		    
		  next ti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform()
		  select case eProcess
		  case ProcessType.AddEdit
		    PerformAddEdit
		    
		  case ProcessType.List
		    if oProject.eProjectType = ProjectType.Web and oProject.iProjectAPI = 2 then
		      PerformListWeb2
		      
		    else
		      PerformList
		      
		    end
		    
		  case ProcessType.View
		    PerformView
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformAddEdit()
		  // LoadRecord
		  PerformAddEditLoadRecord
		  
		  // SaveRecord
		  PerformAddEditSaveRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformAddEditLoadRecord()
		  // LoadRecord
		  var txnLoad as XMLNode = xnUI.GetMethodNamed("LoadRecord")
		  var txnLoadSource as XMLNode = GetItemSource(txnLoad)
		  var txnInsertLoadSource as XMLNode = FindInsertionPointAfter("mbLoading = true", txnLoadSource)
		  txnLoadSource.Insert(CreateSourceLine(""), txnInsertLoadSource)
		  
		  for each toProp as ARProject.ClassPropertyInfo in oTable.aroFields
		    // UI: None
		    if toProp.eUIType = ARProject.UIType.None then continue for toProp
		    
		    var tsAssigns as String = toProp.GetControlName + "." + toProp.eUIType.ValueProperty(oProject.iProjectAPI) + " = "
		    
		    // Comment unsupported automagic types
		    select case toProp.eUIType
		    case ARProject.UIType.ControlCheckbox, _
		      ARProject.UIType.ControlListbox, _
		      ARProject.UIType.ControlPopupMenu
		      tsAssigns = "// " + tsAssigns
		      
		    end select
		    
		    select case toProp.eFieldType
		    case ARProject.FieldType.FieldDate
		      var tsLine as String = tsAssigns + "moRecord." + toProp.GetPropertyName
		      if oProject.eProjectType = ProjectType.iOS then
		        tsLine = tsLine + ".ToString"
		        
		      else
		        tsLine = tsLine + ".SQLDateTime"
		        
		      end
		      
		      txnLoadSource.Insert(CreateSourceLine("if moRecord." + toProp.GetPropertyName + " <> nil then"), txnInsertLoadSource)
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      txnLoadSource.Insert(CreateSourceLine(""), txnInsertLoadSource)
		      txnLoadSource.Insert(CreateSourceLine("end"), txnInsertLoadSource)
		      
		    case ARProject.FieldType.FieldString
		      var tsLine as String = tsAssigns + "moRecord." + toProp.GetPropertyName
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      
		    case ARProject.FieldType.FieldDouble, ARProject.FieldType.FieldCurrency
		      var tsLine as String = tsAssigns + "Format(moRecord." + toProp.GetPropertyName + ", ""#########0.00##"")"
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      
		    case ARProject.FieldType.FieldBoolean
		      var tsLine as String
		      if toProp.eUIType = ARProject.UIType.ControlCheckbox then
		        tsLine = tsAssigns.Mid(4) + "moRecord." + toProp.GetPropertyName
		        
		      else
		        tsLine = "// " + tsAssigns + "str(moRecord." + toProp.GetPropertyName + ")"
		        
		      end
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      
		    case ARProject.FieldType.FieldInteger, _
		      ARProject.FieldType.FieldInt64
		      var tsLine as String = tsAssigns + "Format(moRecord." + toProp.GetPropertyName + ", ""##################"")"
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      
		    case ARProject.FieldType.Unknown
		      var tsLine as String = tsAssigns + "str(moRecord." + toProp.GetPropertyName + ")"
		      txnLoadSource.Insert(CreateSourceLine(tsLine), txnInsertLoadSource)
		      
		    case else
		      break
		    end select
		    
		  next toProp
		  
		  txnLoadSource.Insert(CreateSourceLine(""), txnInsertLoadSource)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformAddEditSaveRecord()
		  // SaveRecord
		  var txnSave as XMLNode = xnUI.GetMethodNamed("SaveRecord")
		  var txnSaveSource as XMLNode = GetItemSource(txnSave)
		  
		  txnSaveSource.Insert(CreateSourceLine(""), txnSaveSource.LastChild)
		  
		  for each toProp as ARProject.ClassPropertyInfo in oTable.aroFields
		    // Don't save Primary Key
		    if toProp.bIsPrimary then continue for toProp
		    
		    // UI: None
		    if toProp.eUIType = ARProject.UIType.None then continue for toProp
		    
		    // Base line, commented
		    var tsLine as String = "// moRecord." + toProp.GetPropertyName + _
		    " = " + toProp.GetControlName + "." + toProp.eUIType.ValueProperty(oProject.iProjectAPI)
		    
		    select case toProp.eFieldType
		    case ARProject.FieldType.FieldDate
		      // Date
		      if oProject.eProjectType <> ProjectType.iOS then
		        select case oProject.iProjectAPI
		        case 1
		          tsLine = "moRecord." + toProp.GetPropertyName + ".SQLDateTime = " + _
		          toProp.GetControlName + "." + toProp.eUIType.ValueProperty(oProject.iProjectAPI)
		          
		        case 2
		          tsLine = "moRecord." + toProp.GetPropertyName + " = DateTime.FromString(" + _
		          toProp.GetControlName + "." + toProp.eUIType.ValueProperty(oProject.iProjectAPI) + ")"
		          
		        end
		        
		      end
		      
		    case ARProject.FieldType.FieldString
		      // String
		      tsLine = tsLine.Mid(4) // Line is good
		      
		    case ARProject.FieldType.FieldDouble, ARProject.FieldType.FieldCurrency, _
		      ARProject.FieldType.FieldInteger, ARProject.FieldType.FieldInt64
		      // Double, Currency, Integer
		      select case toProp.eUIType
		      case ARProject.UIType.ControlPassword, ARProject.UIType.ControlTextArea, ARProject.UIType.ControlTextField
		        tsLine = "moRecord." + toProp.GetPropertyName + " = cdbl(" + _
		        toProp.GetControlName + "." + toProp.eUIType.ValueProperty(oProject.iProjectAPI) + ")"
		        
		      end select
		      
		    case ARProject.FieldType.FieldBoolean
		      // Boolean
		      if toProp.eUIType = ARProject.UIType.ControlCheckbox then
		        tsLine = tsLine.Mid(4) // Line is good
		        
		      end
		      
		    end select
		    
		    txnSaveSource.Insert(CreateSourceLine(tsLine), txnSaveSource.LastChild)
		    
		  next toProp
		  
		  txnSaveSource.Insert(CreateSourceLine(""), txnSaveSource.LastChild)
		  txnSaveSource.Insert(CreateSourceLine("// moRecord.Save"), txnSaveSource.LastChild)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformList()
		  var tsRowsName as String = GenerateControlName("Rows", ARProject.UIType.ControlListbox)
		  
		  var tiColumnIndex as Integer = -1
		  var tiInitialSortColumn as Integer = -1
		  var tarsInitialValue(), tarsLoadList(), tarsBuildRow(), tarsHeaderPressed() as String
		  for tiProp as Integer = 0 to oTable.aroFields.Ubound
		    var toProp as ARProject.ClassPropertyInfo = oTable.aroFields(tiProp)
		    if toProp.bIncludeInListbox = false then continue for tiProp
		    tiColumnIndex = tiColumnIndex + 1
		    
		    // Track this for initial sort
		    if toProp.bInitialSortField then
		      tiInitialSortColumn = tiProp
		      
		    end
		    
		    // Setup Listbox InitialValue
		    if oProject.DataClass.bLocalizeLabels = true then
		      tarsInitialValue.Append("#Strings." + oTable.sTableName + toProp.sColumnName + "Label")
		      
		    else
		      tarsInitialValue.Append(toProp.sLabelText)
		      
		    end
		    
		    // Setup LoadList
		    if oProject.iProjectAPI = 1 then
		      tarsLoadList.Append(tsRowsName + ".ColumnTag(" + Format((tiColumnIndex), "###") + _
		      ") = """ + toProp.sColumnName + """")
		      
		    elseif oProject.iProjectAPI = 2 then
		      tarsLoadList.Append(tsRowsName + ".ColumnTagAt(" + Format((tiColumnIndex), "###") + _
		      ") = """ + toProp.sColumnName + """")
		      
		    end
		    
		    // Setup LoadListBuildRow
		    if oProject.iProjectAPI = 1 then
		      select case toProp.eFieldType
		      case FieldType.FieldString
		        tarsBuildRow.Append("arsRow.Append(oRecord." + toProp.GetPropertyName + ")")
		        
		      case FieldType.FieldBoolean, FieldType.FieldCurrency, FieldType.FieldDouble, _
		        FieldType.FieldInt64, FieldType.FieldInteger
		        tarsBuildRow.Append("arsRow.Append(str(oRecord." + toProp.GetPropertyName + "))")
		        
		      case FieldType.FieldDate
		        tarsBuildRow.Append("if oRecord." + toProp.GetPropertyName + " <> nil then")
		        tarsBuildRow.Append("arsRow.Append(oRecord." + toProp.GetPropertyName + ".SQLDateTime)")
		        tarsBuildRow.Append("")
		        tarsBuildRow.Append("else")
		        tarsBuildRow.Append("arsRow.Append("""")")
		        tarsBuildRow.Append("")
		        tarsBuildRow.Append("end")
		        
		      end select
		      
		    elseif oProject.iProjectAPI = 2 then
		      select case toProp.eFieldType
		      case FieldType.FieldString
		        tarsBuildRow.Append("arsRow.Add(oRecord." + toProp.GetPropertyName + ")")
		        
		      case FieldType.FieldBoolean, FieldType.FieldCurrency, FieldType.FieldDouble, _
		        FieldType.FieldInt64, FieldType.FieldInteger
		        tarsBuildRow.Append("arsRow.Add(str(oRecord." + toProp.GetPropertyName + "))")
		        
		      case FieldType.FieldDate
		        tarsBuildRow.Append("if oRecord." + toProp.GetPropertyName + " <> nil then")
		        tarsBuildRow.Append("arsRow.Add(oRecord." + toProp.GetPropertyName + ".SQLDateTime)")
		        tarsBuildRow.Append("")
		        tarsBuildRow.Append("else")
		        tarsBuildRow.Append("arsRow.Add("""")")
		        tarsBuildRow.Append("")
		        tarsBuildRow.Append("end")
		        
		      end select
		      
		    end
		    
		    // Setup HeaderPressed
		    tarsHeaderPressed.Append("msSortedColumn = """ + toProp.sColumnName + """")
		    
		  next tiProp
		  
		  // Setup InitialValue
		  var tsListboxInitialValue as String = Join(tarsInitialValue, chr(9))
		  tsListboxInitialValue = EncodeHex(tsListboxInitialValue)
		  
		  var xnInitialValue as XMLNode = xnUI.OwnerDocument.CreateElement("Hex")
		  xnInitialValue.SetAttribute("bytes", Format(tsListboxInitialValue.LenB, "#########"))
		  xnInitialValue.AppendChild(xnUI.OwnerDocument.CreateTextNode(tsListboxInitialValue))
		  
		  // These are Desktop only
		  if oProject.eProjectType = ProjectType.Desktop then
		    // Set Listbox InitialValue
		    var txnRows as XMLNode = GetControlNamed(tsRowsName)
		    SetControlPropertyVal(txnRows, "ColumnCount", Format((tarsInitialValue.Ubound + 1), "####"))
		    SetControlPropertyVal(txnRows, "InitialValue", xnInitialValue)
		    
		    // Listbox InitialSort
		    var txnRowsOpen as XMLNode = GetHookNamed("Open")
		    var txnRowsOpenSource as XMLNode = GetItemSource(txnRowsOpen)
		    var txnOpenInsert as XMLNode = FindInsertionPointAfter("// Initial Sort", txnRowsOpenSource)
		    var tsOpenInitialSort, tsOpenSortDirection as String
		    
		    if oProject.iProjectAPI = 1 then
		      tsOpenInitialSort = tsRowsName + ".SortedColumn = " + Format(tiInitialSortColumn, "####")
		      tsOpenSortDirection = tsRowsName + ".ColumnSortDirection(" + _
		      Format(tiInitialSortColumn, "####") + ") = Listbox.SortAscending"
		      
		    elseif oProject.iProjectAPI = 2 then
		      tsOpenInitialSort = tsRowsName + ".SortingColumn = " + Format(tiInitialSortColumn, "####")
		      tsOpenSortDirection = tsRowsName + ".ColumnSortDirectionAt(" + _
		      Format(tiInitialSortColumn, "####") + ") = Listbox.SortDirections.Ascending"
		      
		    end
		    
		    txnRowsOpenSource.Insert(CreateSourceLine(tsOpenInitialSort), txnOpenInsert)
		    txnRowsOpenSource.Insert(CreateSourceLine(tsOpenSortDirection), txnOpenInsert)
		    
		    // LoadList
		    var txnLoadList as XMLNode = xnUI.GetMethodNamed("LoadList")
		    var txnLoadListSource as XMLNode = GetItemSource(txnLoadList)
		    var txnLoadInsertionPoint as XMLNode = FindInsertionPointAfter("// Configure columns", txnLoadListSource)
		    
		    for each tsLoadLine as String in tarsLoadList
		      txnLoadListSource.Insert(CreateSourceLine(tsLoadLine), txnLoadInsertionPoint)
		      
		    next tsLoadLine
		    
		  end
		  
		  // These are Web only
		  if oProject.eProjectType = ProjectType.Web then
		    // Set Listbox InitialValue
		    var txnRows as XMLNode = GetControlNamed(tsRowsName)
		    SetControlPropertyVal(txnRows, "ColumnCount", Format((tarsInitialValue.Ubound + 1), "####"))
		    
		    if txnRows.LastChild <> nil and txnRows.LastChild.Name = "WebControlInitialValue" then
		      var txnNewInit as XMLNode = txnRows.OwnerDocument.CreateElement("WebControlInitialValue")
		      txnNewInit.AppendChild(xnInitialValue)
		      
		      txnRows.RemoveChild(txnRows.LastChild)
		      txnRows.AppendChild(txnNewInit)
		      
		    end
		    
		    // HeaderPressed
		    var txnHeaderPressed as XMLNode = GetHookNamed("HeaderPressed")
		    var txnHPSource as XMLNode = GetItemSource(txnHeaderPressed)
		    var txnHPInsert as XMLNode = FindInsertionPointAfter("select case Column", txnHPSource)
		    
		    for tiCol as Integer = 0 to tarsHeaderPressed.Ubound
		      var tsCol as String = tarsHeaderPressed(tiCol)
		      txnHPSource.Insert(CreateSourceLine("case " + Format(tiCol, "#####")), txnHPInsert)
		      txnHPSource.Insert(CreateSourceLine(tsCol), txnHPInsert)
		      txnHPSource.Insert(CreateSourceLine(""), txnHPInsert)
		      
		    next tiCol
		    
		  end
		  
		  // LoadListBuildRow
		  var txnLoadListBuildRow as XMLNode = xnUI.GetMethodNamed("LoadListBuildRow")
		  var txnLoadListBuildRowSource as XMLNode = GetItemSource(txnLoadListBuildRow)
		  var txnBuildRowInsertionPoint as XMLNode = FindInsertionPointAfter("dim arsRow() as String", txnLoadListBuildRowSource)
		  if oProject.iProjectAPI = 2 then txnBuildRowInsertionPoint = FindInsertionPointAfter("var arsRow() as String", txnLoadListBuildRowSource)
		  
		  txnLoadListBuildRowSource.Insert(CreateSourceLine(""), txnBuildRowInsertionPoint)
		  
		  for each tsBuildLine as String in tarsBuildRow
		    txnLoadListBuildRowSource.Insert(CreateSourceLine(tsBuildLine), txnBuildRowInsertionPoint)
		    
		  next tsBuildLine
		  
		  txnLoadListBuildRowSource.Insert(CreateSourceLine(""), txnBuildRowInsertionPoint)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformListWeb2()
		  var tiColumnIndex as Integer = -1
		  var tiInitialSortColumn as Integer = -1
		  var tarsColumnData(), tarsRowData() as String
		  for tiProp as Integer = 0 to oTable.aroFields.Ubound
		    var toProp as ARProject.ClassPropertyInfo = oTable.aroFields(tiProp)
		    if toProp.bIncludeInListbox = false then continue for tiProp
		    tiColumnIndex = tiColumnIndex + 1
		    
		    // Track this for initial sort
		    if toProp.bInitialSortField then
		      tiInitialSortColumn = tiProp
		      
		    end
		    
		    // Setup ColumnData
		    tarsColumnData.Append("toCol = new WebListboxColumnData")
		    tarsColumnData.Append("toCol.DatabaseColumnName = """ + toProp.sColumnName + """")
		    
		    // Setup Listbox InitialValue
		    if oProject.DataClass.bLocalizeLabels = true then
		      tarsColumnData.Append("toCol.Heading = Strings." + oTable.sTableName + toProp.sColumnName + "Label")
		      
		    else
		      tarsColumnData.Append("toCol.Heading = """ + toProp.sLabelText + """")
		      
		      
		    end
		    
		    
		    // tarsColumnData.Append("toCol.Sortable = True")
		    // tarsColumnData.Append("toCol.SortDirection = Weblistbox.SortDirections.Ascending")
		    tarsColumnData.Append("taroColumns.Add(toCol)")
		    tarsColumnData.Append(EndOfLine)
		    
		    // Set up RowData
		    select case toProp.eFieldType
		    case FieldType.FieldString
		      tarsRowData.Append("toRow.Value(""" + toProp.sColumnName + """) = toRecord." + toProp.GetPropertyName)
		      
		    case FieldType.FieldBoolean, FieldType.FieldCurrency, FieldType.FieldDouble, _
		      FieldType.FieldInt64, FieldType.FieldInteger
		      tarsRowData.Append("toRow.Value(""" + toProp.sColumnName + """) = toRecord." + toProp.GetPropertyName + ".ToString")
		      
		    case FieldType.FieldDate
		      tarsRowData.Append("if toRecord." + toProp.GetPropertyName + " <> nil then")
		      tarsRowData.Append("toRow.Value(""" + toProp.sColumnName + """) = toRecord." + toProp.GetPropertyName + ".SQLDateTime")
		      tarsRowData.Append("")
		      tarsRowData.Append("end")
		      
		    end select
		    
		  next tiProp
		  
		  // // Setup InitialValue
		  // var tsListboxInitialValue as String = Join(tarsInitialValue, chr(9))
		  // tsListboxInitialValue = EncodeHex(tsListboxInitialValue)
		  // 
		  // var xnInitialValue as XMLNode = xnUI.OwnerDocument.CreateElement("Hex")
		  // xnInitialValue.SetAttribute("bytes", Format(tsListboxInitialValue.LenB, "#########"))
		  // xnInitialValue.AppendChild(xnUI.OwnerDocument.CreateTextNode(tsListboxInitialValue))
		  
		  // ColumnData
		  var txnColumnData as XMLNode = xnUI.GetMethodNamed("ColumnData")
		  var txnColumnDataSource as XMLNode = GetItemSource(txnColumnData)
		  var txnColumnDataInsertionPoint as XMLNode = FindInsertionPointAfter("// Configure columns", txnColumnDataSource)
		  
		  for each tsColumnLine as String in tarsColumnData
		    txnColumnDataSource.Insert(CreateSourceLine(tsColumnLine), txnColumnDataInsertionPoint)
		    
		  next tsColumnLine
		  
		  // RowData
		  var txnRowData as XMLNode = xnUI.GetMethodNamed("RowData")
		  var txnRowDataSource as XMLNode = GetItemSource(txnRowData)
		  var txnRowDataInsertionPoint as XMLNode = FindInsertionPointAfter("toRow.Tag = toRecord", txnRowDataSource)
		  
		  for each tsRowLine as String in tarsRowData
		    txnRowDataSource.Insert(CreateSourceLine(tsRowLine), txnRowDataInsertionPoint)
		    
		  next tsRowLine
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformView()
		  var tsDataName as String = GenerateControlName("Data", ARProject.UIType.ControlListbox)
		  
		  var tarsRowLabels() as String
		  for tiProp as Integer = 0 to oTable.aroFields.Ubound
		    var toProp as ARProject.ClassPropertyInfo = oTable.aroFields(tiProp)
		    
		    // Setup LoadRecord
		    // Both APIs the same for Listbox!
		    select case toProp.eFieldType
		    case FieldType.FieldString
		      tarsRowLabels.Append(tsDataName + ".AddRow(""" + toProp.sColumnName + """, " + _
		      "moRecord." + toProp.GetPropertyName + ")")
		      
		    case FieldType.FieldBoolean, FieldType.FieldCurrency, FieldType.FieldDouble, _
		      FieldType.FieldInt64, FieldType.FieldInteger
		      tarsRowLabels.Append(tsDataName + ".AddRow(""" + toProp.sColumnName + """, " + _
		      "str(moRecord." + toProp.GetPropertyName + "))")
		      
		    case FieldType.FieldDate
		      tarsRowLabels.Append("if moRecord." + toProp.GetPropertyName + " <> nil then")
		      tarsRowLabels.Append(tsDataName + ".AddRow(""" + toProp.sColumnName + """, " + _
		      "moRecord." + toProp.GetPropertyName + ".SQLDateTime)")
		      tarsRowLabels.Append("")
		      tarsRowLabels.Append("else")
		      tarsRowLabels.Append(tsDataName + ".AddRow(""" + toProp.sColumnName + """, """")")
		      tarsRowLabels.Append("")
		      tarsRowLabels.Append("end")
		      
		    end select
		    
		  next tiProp
		  
		  
		  // LoadRecord
		  var txnLoadRecord as XMLNode = xnUI.GetMethodNamed("LoadRecord")
		  var txnLoadRecordSource as XMLNode = GetItemSource(txnLoadRecord)
		  var txInsertionPoint as XMLNode = txnLoadRecordSource.LastChild
		  
		  txnLoadRecordSource.Insert(CreateSourceLine(""), txInsertionPoint)
		  
		  for each tsLoadLine as String in tarsRowLabels
		    txnLoadRecordSource.Insert(CreateSourceLine(tsLoadLine), txInsertionPoint)
		    
		  next tsLoadLine
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		eProcess As ProjectGenerator.CodeGenerator.ProcessType
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty

	#tag Property, Flags = &h0
		oTable As ARProject.TableData
	#tag EndProperty

	#tag Property, Flags = &h0
		xnUI As XMLNode
	#tag EndProperty


	#tag Enum, Name = ProcessType, Type = Integer, Flags = &h0
		Unknown
		  AddEdit
		  List
		View
	#tag EndEnum


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
			Name="eProcess"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ProjectGenerator.CodeGenerator.ProcessType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - AddEdit"
				"2 - List"
				"3 - View"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
