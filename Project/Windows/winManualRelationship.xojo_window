#tag Window
Begin Window winManualRelationship
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   360
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   225
   MinimumWidth    =   500
   Resizeable      =   True
   Title           =   "Add Manual Relationship"
   Type            =   8
   Visible         =   True
   Width           =   600
   Begin Label lblSource
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Source"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin AlternatingList lbSourceColumn
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "65%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   260
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ccOKCancel ctlOK
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   408
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   313
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   172
   End
   Begin Label lblReferences
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Related to..."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   113
   End
   Begin AlternatingList lbTargetColumn
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "70%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   260
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   232
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   348
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin WindowSplitter ctlSplitter
      AutoDeactivate  =   True
      CursorSmoothing =   True
      DockAfter       =   False
      DockAfterSize   =   40
      DockBefore      =   False
      DockBeforeSize  =   40
      DoubleClickAction=   0
      Enabled         =   True
      Height          =   260
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   220
      LinuxStyle      =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacStyle        =   3
      MinAfterArea    =   368
      MinBeforeArea   =   218
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   42
      Visible         =   True
      Width           =   12
      WinLiveMove     =   True
      WinStyle        =   1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CreateEnabled(assigns bEnabled as Boolean)
		  ctlOK.DefaultButton.Enabled = bEnabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Edit(oEdit as ARProject.ForeignKey, oAttach as Window) As ARProject.ForeignKey
		  CreateEnabled = false
		  ctlOK.DefaultButton.Caption = "Save"
		  lbTargetColumn.SetFocus
		  
		  moEditSource = new ARProject.ForeignKey
		  moEditSource.CloneFrom(oEdit)
		  
		  // Select Source
		  var iMax as Integer = lbSourceColumn.ListCount - 1
		  for i as Integer = 0 to iMax
		    if lbSourceColumn.RowIsFolder(i) = true then continue
		    
		    if lbSourceColumn.Cell(i, 0) = oEdit.sColumn then
		      lbSourceColumn.Enabled = false
		      lbSourceColumn.ListIndex = i
		      lbSourceColumn.Enabled = true
		      exit for i
		      
		    end
		    
		  next
		  
		  // Select Target Table
		  var iTargetTableRow as Integer
		  iMax = lbTargetColumn.ListCount - 1
		  for i as Integer = 0 to iMax
		    if lbTargetColumn.RowIsFolder(i) = true and _
		      lbTargetColumn.Cell(i, 0) = oEdit.sForeignTable then
		      // This is the table we want
		      // Expanding will get us the columns
		      iTargetTableRow = i
		      lbTargetColumn.Expanded(iTargetTableRow) = true
		      
		      exit for i
		      
		    end
		    
		  next
		  
		  // Select Target Column
		  // With the table expanded, the column needs to be highlighted
		  iMax = lbTargetColumn.ListCount - 1
		  for i as Integer = iTargetTableRow to iMax
		    if lbTargetColumn.RowIsFolder(i) = true then continue
		    
		    if lbTargetColumn.Cell(i, 0) = oEdit.sForeignColumn then
		      lbTargetColumn.Enabled = false
		      lbTargetColumn.ListIndex = i
		      lbTargetColumn.Enabled = true
		      exit for i
		      
		    end
		    
		  next
		  
		  // Set the relation object
		  moRelation = oEdit
		  
		  self.ShowModalWithin(oAttach)
		  
		  return moRelation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTableFromListbox(lbSource as Listbox) As ARProject.TableData
		  if lbSource.ListIndex < 0 then return nil
		  
		  for i as Integer = lbSource.ListIndex DownTo 0
		    if lbSource.RowIsFolder(i) = true then
		      return lbSource.RowTag(i)
		      
		    end
		    
		  next
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleCreate()
		  moRelation.bManualEntry = true
		  
		  if moEditSource = nil then
		    moRelation.bMarkedForInsert = true
		    
		  end
		  
		  moRelation.CreateName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEnabledState()
		  CreateEnabled = IsSourceGood and IsTargetGood
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsSourceGood() As Boolean
		  return lbSourceColumn.ListIndex > -1 and _
		  (lbSourceColumn.RowIsFolder(lbSourceColumn.ListIndex) = false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsTargetGood() As Boolean
		  return lbTargetColumn.ListIndex > -1 and _
		  (lbTargetColumn.RowIsFolder(lbTargetColumn.ListIndex) = false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(oProj as DataFile.t_Project, oSource as ARProject.TableData)
		  meType = oProj.eProjectType
		  miAPI = oProj.iProjectAPI
		  moProject = oProj.DataClass
		  moTableSource = oSource
		  
		  // Source list
		  lbSourceColumn.AddFolder(moTableSource.sTableName)
		  lbSourceColumn.RowTag(lbSourceColumn.LastIndex) = oSource
		  lbSourceColumn.Expanded(0) = true // Expanding loads the table
		  
		  // Targets list
		  for each oTable as ARProject.TableData in moProject.aroTables
		    // Skip the source table
		    if oTable is moTableSource then continue
		    
		    lbTargetColumn.AddFolder(oTable.sTableName)
		    lbTargetColumn.RowTag(lbTargetColumn.LastIndex) = oTable
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewRelationship(oAttach as Window) As ARProject.ForeignKey
		  CreateEnabled = false
		  ctlOK.DefaultButton.Caption = "Create"
		  lbSourceColumn.SetFocus
		  
		  moRelation = new ARProject.ForeignKey
		  
		  self.ShowModalWithin(oAttach)
		  
		  return moRelation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateRelationship()
		  if IsSourceGood = true then
		    var oSourceTable as ARProject.TableData = GetTableFromListbox(lbSourceColumn)
		    moRelation.sTable = oSourceTable.sTableName
		    
		    var oSourceColumn as ARProject.ClassPropertyInfo = lbSourceColumn.RowTag(lbSourceColumn.ListIndex)
		    moRelation.sColumn = oSourceColumn.sColumnName
		    
		  end
		  
		  if IsTargetGood then
		    var oTargetTable as ARProject.TableData = GetTableFromListbox(lbTargetColumn)
		    moRelation.sForeignTable = oTargetTable.sTableName
		    
		    var oTargetColumn as ARProject.ClassPropertyInfo = lbTargetColumn.RowTag(lbTargetColumn.ListIndex)
		    moRelation.sForeignColumn = oTargetColumn.sColumnName
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Validate() As Boolean
		  // Is this key set up correctly?
		  if IsSourceGood = false then return false
		  if IsTargetGood = false then return false
		  
		  // Verify that this foreign key doesn't already exist
		  for each oKey as ARProject.ForeignKey in moTableSource.aroForeignKey
		    // Avoid circular references and false positives when editing
		    if moEditSource <> nil and oKey = moRelation then continue
		    
		    if oKey.sTable = moRelation.sTable and _
		      oKey.sColumn = moRelation.sColumn and _
		      oKey.sForeignTable = moRelation.sForeignTable and _
		      oKey.sForeignColumn = moRelation.sForeignColumn then
		      
		      oKey.CreateName
		      
		      MessageBox("Foreign Key Exists", "The relationship " + oKey.sName + " already exists.")
		      
		      return false
		      
		    end
		    
		  next
		  
		  // Good to go
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bSaved As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private meType As ProjectType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private miAPI As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moEditSource As ARProject.ForeignKey
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moProject As ARProject.ProjectData
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moRelation As ARProject.ForeignKey
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moTableSource As ARProject.TableData
	#tag EndProperty


#tag EndWindowCode

#tag Events lbSourceColumn
	#tag Event
		Sub ExpandRow(row As Integer)
		  #pragma unused row
		  
		  for i as Integer = 0 to moTableSource.aroFields.Ubound
		    var oThis as ARProject.ClassPropertyInfo = moTableSource.aroFields(i)
		    
		    me.InsertRow(i + 1, oThis.sColumnName, 1)
		    me.Cell(i + 1, 1) = oThis.GetPropertyType(meType, miAPI)
		    me.RowTag(me.LastIndex) = oThis
		    
		  next
		  
		  HandleEnabledState
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.Enabled = false then return
		  
		  UpdateRelationship
		  HandleEnabledState
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlOK
	#tag Event
		Sub ClickedCancel()
		  if moEditSource = nil then
		    // New relationship cancelled
		    moRelation = nil
		    
		  else
		    // Edit relationship cancelled
		    moRelation.CloneFrom(moEditSource)
		    
		  end
		  
		  self.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClickedOK()
		  if Validate = true then
		    HandleCreate
		    bSaved = true
		    self.Close
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbTargetColumn
	#tag Event
		Sub ExpandRow(row As Integer)
		  if row < 0 then return
		  
		  var oThisTable as ARProject.TableData = me.RowTag(row)
		  for i as Integer = 0 to oThisTable.aroFields.Ubound
		    var oThis as ARProject.ClassPropertyInfo = oThisTable.aroFields(i)
		    
		    me.InsertRow(row + i + 1, oThis.sColumnName, 1)
		    me.Cell(row + i + 1, 1) = oThis.GetPropertyType(meType, miAPI)
		    me.RowTag(me.LastIndex) = oThis
		    
		  next
		  
		  HandleEnabledState
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.Enabled = false then return
		  
		  UpdateRelationship
		  HandleEnabledState
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlSplitter
	#tag Event
		Sub Open()
		  me.AddControl(lbSourceColumn, true)
		  me.AddControl(lbTargetColumn, false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="bSaved"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
