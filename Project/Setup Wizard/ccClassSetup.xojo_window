#tag Window
Begin ContainerControl ccClassSetup
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   360
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   600
   Begin TableListbox lbTables
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "22,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   30
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   296
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   " 	Table / View"
      Italic          =   False
      Left            =   0
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin CheckBox chkAll
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      State           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   20
   End
   Begin AlternatingList lbProperties
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
      ColumnsResizable=   True
      ColumnWidths    =   "30,*,100,100,50"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   296
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "PK	Field Name	Schema Type	Xojo Type	Unique"
      Italic          =   False
      Left            =   220
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   30
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   380
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblTableName
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
      Left            =   220
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "t_TableName"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   380
   End
   Begin WindowsButton btnNaming
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Configure Naming Conventions"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   220
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
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   203
      LinuxStyle      =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacStyle        =   3
      MinAfterArea    =   380
      MinBeforeArea   =   200
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   26
      Visible         =   True
      Width           =   14
      WinLiveMove     =   True
      WinStyle        =   1
   End
   Begin LinkLabel lblFieldSchema
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LinkURL         =   "https://docs.xojo.com/Database.TableColumns"
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "More information on Xojo Database.TableColumns"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   319
   End
   Begin Timer tmrNamingRelay
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   15
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin SearchField txtSearch
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowRecentItems=   False
      ClearMenuItemValue=   "Clear"
      Enabled         =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   22
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumRecentItems=   -1
      RecentItemsValue=   "Recent Searches"
      Scope           =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   178
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Load(toProject as DataFile.t_Project)
		  moProject = toProject
		  
		  LoadList
		  LoadTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadList()
		  lbTables.Enabled = false
		  lbTables.DeleteAllRows
		  
		  var tsSearch as String = txtSearch.Text.Trim.ConvertEncoding(Encodings.UTF8)
		  
		  for each oTable as ARProject.TableData in moProject.DataClass.aroTables
		    // Do search filtering       Table Name                                         Search String
		    if tsSearch <> "" and (InStr(oTable.sTableName.ConvertEncoding(Encodings.UTF8), tsSearch) < 1) then continue
		    
		    lbTables.AddRow("", oTable.sTableName)
		    lbTables.CellCheck(lbTables.LastIndex, 0) = oTable.bSelected
		    lbTables.RowTag(lbTables.LastIndex) = oTable
		    
		  next
		  
		  lbTables.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadTable()
		  // Clear UI
		  lblTableName.Text = ""
		  lbProperties.DeleteAllRows
		  
		  if lbTables.ListIndex < 0 then return
		  
		  // Load table
		  lblTableName.Text = moSelectedTable.sTableName
		  
		  lbProperties.Enabled = false
		  
		  for each oProperty as ARProject.ClassPropertyInfo in moSelectedTable.aroFields
		    lbProperties.AddRow("", oProperty.sColumnName, oProperty.DisplayDBFieldSchemaFieldType, _
		    oProperty.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI))
		    lbProperties.CellCheck(lbProperties.LastIndex, 4) = oProperty.bMustBeUnique
		    
		    // Hide unique checkbox for pimary key
		    if oProperty.bIsPrimary then
		      lbProperties.CellType(lbProperties.LastIndex, 4) = Listbox.TypeNormal
		      
		    end
		    
		    // Store prop
		    lbProperties.RowTag(lbProperties.LastIndex) = oProperty
		    
		  next oProperty
		  
		  lbProperties.Enabled = true
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private moProject As DataFile.t_Project
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if lbTables.ListIndex > -1 then
			    return ARProject.TableData(lbTables.RowTag(lbTables.ListIndex))
			    
			  end
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if lbTables.ListIndex > -1 then
			    lbTables.RowTag(lbTables.ListIndex) = value
			    
			  end
			End Set
		#tag EndSetter
		Private moSelectedTable As ARProject.TableData
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events lbTables
	#tag Event
		Sub Change()
		  LoadTable
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row as Integer, column as Integer)
		  if me.Enabled = false then return
		  
		  // Only the checkboxes
		  if column = 0 then
		    ARProject.TableData(lbTables.RowTag(row)).bSelected = me.CellCheck(row, 0)
		    self.TrueWindow.ContentsChanged = true
		    
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub CheckAllState(teState as CheckBox.CheckedStates)
		  chkAll.Enabled = false
		  chkAll.State = teState
		  chkAll.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkAll
	#tag Event
		Sub Action()
		  if me.Enabled = false then return
		  if lbTables.Enabled = false then return
		  
		  var tbTargetValue as Boolean = me.Value
		  
		  // Set all states
		  lbTables.Enabled = false
		  
		  var tiMax as Integer = lbTables.ListCount - 1
		  for ti as Integer = 0 to tiMax
		    lbTables.CellCheck(ti, 0) = tbTargetValue
		    ARProject.TableData(lbTables.RowTag(ti)).bSelected = tbTargetValue
		    self.TrueWindow.ContentsChanged = true
		    
		  next ti
		  
		  lbTables.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbProperties
	#tag Event
		Function CellTextPaint(g as graphics, row as integer, column as integer, x as integer, y as integer) As boolean
		  var oRecord as ARProject.ClassPropertyInfo = me.RowTag(row)
		  
		  select case column
		  case 0
		    // Draw primary key indicator
		    if oRecord.bIsPrimary = true then
		      g.TextSize = 16
		      g.DrawString(&u2691, 6, 16)
		      return true
		      
		    end
		    
		  case 3
		    // Draw type triangle
		    me.DrawTriangle(g, me.Selected(row))
		    
		    if me.Selected(row) then g.ForeColor = &cffffff
		    g.DrawString(oRecord.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), x, y)
		    
		    return true
		    
		  end
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  // Display menu if clicked in PopupMenu column
		  var row As Integer = Me.RowFromXY(x, y)
		  var col As Integer = Me.ColumnFromXY(x, y)
		  if col <> 3 then  Return
		  
		  
		  Me.ListIndex = row
		  Me.Selected(row) = True
		  
		  var toProp as new ARProject.ClassPropertyInfo(true)
		  var oTypeMenu as new MenuItem
		  
		  // Boolean
		  toProp.eFieldType = ARProject.FieldType.FieldBoolean
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Currency
		  toProp.eFieldType = ARProject.FieldType.FieldCurrency
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Date
		  toProp.eFieldType = ARProject.FieldType.FieldDate
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Double
		  toProp.eFieldType = ARProject.FieldType.FieldDouble
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Int64
		  toProp.eFieldType = ARProject.FieldType.FieldInt64
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Integer
		  toProp.eFieldType = ARProject.FieldType.FieldInteger
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // String
		  toProp.eFieldType = ARProject.FieldType.FieldString
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  // Unknown
		  toProp.eFieldType = ARProject.FieldType.Unknown
		  oTypeMenu.AddItemAndTag(MenuItem.TextSeparator, -1)
		  oTypeMenu.AddItemAndTag(toProp.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI), toProp.eFieldType)
		  
		  var mnuTypeSelection as MenuItem = oTypeMenu.PopUp
		  
		  // Selected nothing
		  if mnuTypeSelection = nil then return
		  
		  // Selected the separator on Windows
		  if mnuTypeSelection.Tag.IntegerValue = -1 then return
		  
		  // CellTextPaint will check for a value in the CellTag
		  // and display it.
		  Me.CellTag(row, col) = mnuTypeSelection.Text
		  
		  
		  var oRecord as ARProject.ClassPropertyInfo = me.RowTag(row)
		  oRecord.eFieldType = mnuTypeSelection.Tag
		  
		  self.TrueWindow.ContentsChanged = true
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  // Type menu
		  if me.ColumnFromXY(x, y) = 3 then
		    return true
		    
		  end
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.ColumnType(4) = listbox.TypeCheckbox
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  if column <> 4 then return
		  
		  var oRecord as ARProject.ClassPropertyInfo = me.RowTag(row)
		  oRecord.bMustBeUnique = me.CellCheck(row, column)
		  
		  // Only allow one MustBeUnique in each table
		  if oRecord.bMustBeUnique then
		    for i as Integer = 0 to me.ListCount - 1
		      if i = row then continue for i
		      
		      oRecord = me.RowTag(i)
		      oRecord.bMustBeUnique = false
		      
		      me.CellCheck(i, column) = false
		      me.Invalidate(true)
		      
		    next i
		    
		  end
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNaming
	#tag Event
		Sub Open()
		  #if TargetWindows then
		    me.Top = me.Top - 2
		    
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  tmrNamingRelay.Mode = Timer.ModeSingle
		  tmrNamingRelay.Reset
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlSplitter
	#tag Event
		Sub Open()
		  me.AddControl(txtSearch, true)
		  me.AddControl(lbTables, true)
		  me.AddControl(lblTableName, false)
		  me.AddControl(lbProperties, false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrNamingRelay
	#tag Event
		Sub Action()
		  var toNm as new winNaming
		  toNm.Display(moProject, self.TrueWindow)
		  
		  if toNm.bSaved = true then
		    self.TrueWindow.ContentsChanged = true
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtSearch
	#tag Event
		Sub TextChanged()
		  LoadList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
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
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
