#tag Window
Begin ContainerControl ccUISetup
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
   Width           =   700
   Begin PagePanel ppMain
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   328
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   480
      Begin AlternatingList lbControls
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   6
         ColumnsResizable=   True
         ColumnWidths    =   "30,*,80,100,50"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   20
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   296
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         InitialValue    =   "PK	Field Name	Xojo Type	Control	List	Label Text"
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
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   30
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   480
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lblSortBy
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Initial Sort By:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   31
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PopupMenu pmSortBy
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         InitialValue    =   ""
         Italic          =   False
         Left            =   352
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   31
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
   End
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
   Begin Timer tmrReorder
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin WindowsButton btnSwitch
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#kTableOptions"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   580
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
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
      Width           =   480
   End
   Begin CheckBox chkLocalize
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Prepare label text for localization"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Place the ""Label Text"" value as a localized string in the generated Strings module instead."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   235
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
	#tag Method, Flags = &h21
		Private Sub EditCurrentCell(row As Integer, column As Integer)
		  try
		    select case column
		    case kControlLabelColumn
		      lbControls.CellType(row, column) = ListBox.TypeEditable
		      lbControls.EditCell(row, column)
		      mEditing = True
		      mRow = row
		      mColumn = column
		      
		    end select
		    
		  catch ex as  RuntimeException
		    'do nothing
		    
		  end try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChangeSortBy(oField as ARProject.ClassPropertyInfo)
		  for i as Integer = 0 to lbControls.ListCount - 1
		    var oThis as ARProject.ClassPropertyInfo = lbControls.RowTag(i)
		    if oThis = nil then continue
		    
		    oThis.bInitialSortField = (oThis = oField)
		    
		  next
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(toProject as DataFile.t_Project)
		  moProject = toProject
		  
		  chkLocalize.SetValue(moProject.DataClass.bLocalizeLabels)
		  
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
		    lbTables.CellCheck(lbTables.LastIndex, 0) = oTable.bHasUI
		    lbTables.RowTag(lbTables.LastIndex) = oTable
		    
		  next
		  
		  lbTables.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadTable()
		  // Clear UI
		  btnSwitch.Caption = kTableOptions
		  btnSwitch.Enabled = false
		  lblTableName.Text = ""
		  lbControls.DeleteAllRows
		  ppMain.Value = 0
		  
		  pmSortBy.Enabled = false
		  pmSortBy.DeleteAllRows
		  pmSortBy.AddRowAndTag("None", nil)
		  pmSortBy.AddRowAndTag(MenuItem.TextSeparator, nil)
		  pmSortBy.ListIndex = 0
		  pmSortBy.Enabled = true
		  
		  if lbTables.ListIndex < 0 then return
		  
		  btnSwitch.Enabled = true
		  lblTableName.Text = moSelectedTable.sTableName
		  
		  // Load columns and populate default column popupmenu
		  lbControls.Enabled = true
		  pmSortBy.Enabled = false
		  
		  for each oField as ARProject.ClassPropertyInfo in moSelectedTable.aroFields
		    // Populate popup menu, also select it
		    pmSortBy.AddRowAndTag(oField.sColumnName, oField)
		    if oField.bInitialSortField = true then
		      pmSortBy.ListIndex = (pmSortBy.ListCount - 1)
		      
		    end
		    
		    var arsRow() as String
		    arsRow.Append("")
		    arsRow.Append(oField.sColumnName)
		    arsRow.Append(oField.GetPropertyType(moProject.eProjectType, moProject.iProjectAPI))
		    arsRow.Append(oField.eUIType.ToString)
		    arsRow.Append("")
		    arsRow.Append(oField.sLabelText)
		    
		    lbControls.AddRow(arsRow)
		    
		    lbControls.CellCheck(lbControls.LastIndex, 4) = oField.bIncludeInListbox
		    
		    lbControls.RowTag(lbControls.LastIndex) = oField
		    
		  next
		  
		  lbControls.Enabled = true
		  pmSortBy.Enabled = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReorderRows()
		  if lbControls.ListIndex = -1 then Return 'just in case
		  
		  var aro() as ARProject.ClassPropertyInfo
		  for i as integer = 0 to lbControls.ListCount -1
		    aro.Append lbControls.RowTag(i)
		  next
		  moSelectedTable.aroFields = aro
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumn As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEditing As Boolean
	#tag EndProperty

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

	#tag Property, Flags = &h21
		Private mRow As Integer
	#tag EndProperty


	#tag Constant, Name = kControlLabelColumn, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInterfaceSetup, Type = String, Dynamic = False, Default = \"Interface Setup", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTableOptions, Type = String, Dynamic = False, Default = \"Table Options", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events lbControls
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
		    g.DrawString(oRecord.eUIType.ToString, x, y)
		    
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
		  
		  var mnuControlTypes as new MenuItem
		  mnuControlTypes.AddItemAndTag("None", ARProject.UIType.None)
		  mnuControlTypes.AddItemAndTag(MenuItem.TextSeparator, ARProject.UIType.Unknown)
		  mnuControlTypes.AddItemAndTag("Checkbox", ARProject.UIType.ControlCheckbox)
		  mnuControlTypes.AddItemAndTag("Label", ARProject.UIType.ControlLabel)
		  mnuControlTypes.AddItemAndTag("Listbox", ARProject.UIType.ControlListbox)
		  mnuControlTypes.AddItemAndTag("PasswordField", ARProject.UIType.ControlPassword)
		  mnuControlTypes.AddItemAndTag("PopupMenu", ARProject.UIType.ControlPopupMenu)
		  mnuControlTypes.AddItemAndTag("TextArea", ARProject.UIType.ControlTextArea)
		  mnuControlTypes.AddItemAndTag("TextField", ARProject.UIType.ControlTextField)
		  
		  
		  var mnuSelectedControl as MenuItem = mnuControlTypes.PopUp
		  if mnuSelectedControl = nil then return
		  
		  // Selected the separator on Windows
		  if mnuSelectedControl.Tag.IntegerValue = -1 then return
		  
		  
		  // CellTextPaint will check for a value in the CellTag
		  // and display it.
		  Me.CellTag(row, col) = mnuSelectedControl.Text
		  
		  
		  var oRecord as ARProject.ClassPropertyInfo = me.RowTag(row)
		  oRecord.eUIType = mnuSelectedControl.Tag
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
		  if row = -1 then Return
		  
		  var oField as ARProject.ClassPropertyInfo = me.RowTag(row)
		  select case column
		  case 4 'add to list
		    oField.bIncludeInListbox = not oField.bIncludeInListbox
		    
		    'if not check make sure it is not added to the inital sort list
		    if oField.bIncludeInListbox = false then
		      oField.bInitialSortField = false
		      me.CellCheck(row, 5) = false
		    end if
		    
		  case kControlLabelColumn ' control lable name.
		    var sValue as String = me.Cell(row, column).Trim
		    if sValue = "" then
		      beep
		      me.Cell(row, column) = oField.sLabelText
		      Return
		    end if
		    
		    oField.sLabelText = sValue
		    
		  case else
		    'do nothing
		    Return
		  end Select
		  
		  
		  
		  self.TrueWindow.ContentsChanged = true
		End Sub
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  #pragma unused newPosition
		  #pragma unused parentRow
		  
		  tmrReorder.Mode = timer.ModeSingle
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  
		  if column <> kControlLabelColumn then Return false
		  
		  var newRow As Integer = mRow
		  var newColumn As Integer = mColumn
		  EditCurrentCell(row, Column)
		  
		  Me.InvalidateCell(row, mColumn)
		  Me.InvalidateCell(newRow, newColumn)
		  
		  mRow = newRow
		  mColumn = newColumn
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  var newRow As Integer = mRow
		  var newColumn As Integer = mColumn
		  
		  Select Case Key
		  Case Encodings.ASCII.Chr(13) // Return
		    
		    EditCurrentCell(mRow, mColumn)
		    
		    ' Case Encodings.ASCII.Chr(30) // Up arrow
		    'newRow = mRow-1
		    'If newRow < 0 Then newRow = 0
		    '
		    'Case Encodings.ASCII.Chr(31) // Down arrow
		    'newRow = mRow+1
		    'If newRow > Me.ListCount-1 Then
		    ''Me.AddRow("")
		    'newRow = Me.ListCount-1
		    'End If
		    '
		    'Case Encodings.ASCII.Chr(28) // Left arrow
		    'newColumn = newColumn-1
		    'If newColumn < 0 Then
		    'newColumn = 0
		    'newRow = mRow-1
		    'If newRow < 0 Then newRow = 0
		    'End If
		    '
		    'Case Encodings.ASCII.Chr(29) // Right arrow
		    'newColumn = newColumn+1
		    '
		    'If newColumn > Me.ColumnCount-1 Then
		    'newColumn = 0
		    '
		    'newRow = mRow+1
		    'If newRow > Me.ListCount-1 Then
		    ''Me.AddRow("")
		    'newRow = 0
		    'End If
		    '
		    '
		    'End If
		  End Select
		  
		  
		  Me.InvalidateCell(mRow, mColumn)
		  Me.InvalidateCell(newRow, newColumn)
		  
		  
		  
		  mRow = newRow
		  
		  mColumn = newColumn
		  
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pmSortBy
	#tag Event
		Sub Change()
		  if me.Enabled = false then return
		  
		  HandleChangeSortBy(me.RowTag(me.ListIndex))
		End Sub
	#tag EndEvent
#tag EndEvents
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
		    ARProject.TableData(lbTables.RowTag(row)).bHasUI = me.CellCheck(row, 0)
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
		    ARProject.TableData(lbTables.RowTag(ti)).bHasUI = tbTargetValue
		    self.TrueWindow.ContentsChanged = true
		    
		  next ti
		  
		  lbTables.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlSplitter
	#tag Event
		Sub Open()
		  me.AddControl(txtSearch, true)
		  me.AddControl(lbTables, true)
		  me.AddControl(lblTableName, false)
		  me.AddControl(ppMain, false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrReorder
	#tag Event
		Sub Action()
		  me.Mode = timer.ModeOff
		  ReorderRows
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSwitch
	#tag Event
		Sub Action()
		  select case me.Caption
		  case kTableOptions
		    me.Caption = kInterfaceSetup
		    ppMain.Value = 1
		    
		    
		  case kInterfaceSetup
		    me.Caption = kTableOptions
		    ppMain.Value = 0
		    
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkLocalize
	#tag Event
		Sub Action()
		  if me.Enabled = true then
		    moProject.DataClass.bLocalizeLabels = me.Value
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
