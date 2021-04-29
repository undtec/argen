#tag Window
Begin ContainerControl ccRelationships
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
   Begin CheckBox chkShowAllTables
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show all Tables / Views"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Show all Tables and Views in the database or just those with defined relationships."
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
      Width           =   191
   End
   Begin AlternatingList lbKeys
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   True
      ColumnWidths    =   "24,24,20%,25%,*,20%"
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
      InitialValue    =   " 	 	Column	Foreign Table	Foreign Column	Type"
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
      Width           =   480
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas cvsStatusbarButtons
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   34
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   203
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   327
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   497
      Begin WindowsButton btnAddRelationship
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Add Manual Relationship"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsStatusbarButtons"
         Italic          =   False
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   338
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   186
      End
      Begin WindowsButton btnDeleteRelationship
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Delete"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsStatusbarButtons"
         Italic          =   False
         Left            =   620
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   338
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin WindowsButton btnEditRelationship
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Edit"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsStatusbarButtons"
         Italic          =   False
         Left            =   528
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   338
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
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
		Private Sub Handle_AddRelationship()
		  if moSelectedTable = nil then return
		  
		  var oNew as new winManualRelationship
		  oNew.Load(moProject, moSelectedTable)
		  
		  var oRelation as ARProject.ForeignKey = oNew.NewRelationship(self.TrueWindow)
		  
		  // User cancelled
		  if oRelation = nil then return
		  
		  // Add it
		  moSelectedTable.AppendForeignKey(oRelation)
		  self.TrueWindow.ContentsChanged = true
		  
		  LoadTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DeleteRelationship()
		  if moSelectedTable = nil then return
		  
		  var oFKey as ARProject.ForeignKey = lbKeys.RowTag(lbKeys.ListIndex)
		  
		  var md as new MessageDialog
		  md.Message = "Delete Manual Relationship?"
		  md.Explanation = "Are you sure you wish to delete this manual relationship? This cannot be undone."
		  
		  md.ActionButton.Caption = "Delete Relationship"
		  md.ActionButton.Default = false
		  md.CancelButton.Default = true
		  md.CancelButton.Visible = true
		  
		  if md.ShowModal = md.ActionButton then
		    moSelectedTable.RemoveForeignKey(oFKey)
		    self.TrueWindow.ContentsChanged = true
		    
		  end
		  
		  LoadTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_EditRelationship()
		  if moSelectedTable = nil then return
		  
		  // Get the Relationship so we can pass it in.
		  var oFK as ARProject.ForeignKey = lbKeys.RowTag(lbKeys.ListIndex)
		  
		  if oFK = nil then return
		  
		  // Can only edit manual entries
		  if oFK.bManualEntry = false then return
		  
		  var oEditor as new winManualRelationship
		  oEditor.Load(moProject, moSelectedTable)
		  
		  var oRelation as ARProject.ForeignKey = oEditor.Edit(oFK, self.TrueWindow)
		  #pragma unused oRelation
		  
		  if oEditor.bSaved = true then
		    self.TrueWindow.ContentsChanged = true
		    
		  end
		  
		  LoadTable
		End Sub
	#tag EndMethod

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
		    
		    // Show only tables with foreign keys?
		    if oTable.aroForeignKey.Ubound = -1 and chkShowAllTables.value = false then continue for oTable
		    
		    lbTables.AddRow("", oTable.sTableName)
		    lbTables.CellCheck(lbTables.LastIndex, 0) = oTable.bGenerateAutoObjects
		    lbTables.RowTag(lbTables.LastIndex) = oTable
		    
		  next oTable
		  
		  lbTables.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadTable()
		  // Store selection
		  var tsSelection as String
		  if lbKeys.ListIndex > -1 then
		    tsSelection = ARProject.ForeignKey(lbKeys.RowTag(lbKeys.ListIndex)).sName
		    
		  end
		  
		  // Clear UI
		  btnAddRelationship.Enabled = false
		  lblTableName.Text = ""
		  lbKeys.DeleteAllRows
		  
		  if lbTables.ListIndex < 0 then return
		  
		  btnAddRelationship.Enabled = true
		  lblTableName.Text = moSelectedTable.sTableName
		  
		  // Load foreign keys
		  for each oFK as ARProject.ForeignKey in moSelectedTable.aroForeignKey
		    lbKeys.AddRow("", "", oFK.sColumn, oFK.sForeignTable, oFK.sForeignColumn, oFK.DisplayObjectType)
		    lbKeys.CellCheck(lbKeys.LastIndex, 1) = oFK.bSelected
		    lbKeys.RowTag(lbKeys.LastIndex) = oFK
		    
		    // Restore selection
		    if tsSelection <> "" then
		      if oFK.sName = tsSelection then
		        lbKeys.ListIndex = lbKeys.LastIndex
		        
		      end
		      
		    end
		    
		  next
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

#tag Events lbTables
	#tag Event
		Sub Change()
		  LoadTable
		End Sub
	#tag EndEvent
	#tag Event
		Sub CheckAllState(teState as CheckBox.CheckedStates)
		  chkAll.Enabled = false
		  chkAll.State = teState
		  chkAll.Enabled = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row as Integer, column as Integer)
		  if me.Enabled = false then return
		  
		  // Only the checkboxes
		  if column = 0 then
		    ARProject.TableData(lbTables.RowTag(row)).bGenerateAutoObjects = me.CellCheck(row, 0)
		    self.TrueWindow.ContentsChanged = true
		    
		  end
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
		    ARProject.TableData(lbTables.RowTag(ti)).bGenerateAutoObjects = tbTargetValue
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
		  me.AddControl(lbKeys, false)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SplitterMoved(X as Integer,Y as Integer)
		  #pragma unused x
		  #pragma unused y
		  
		  cvsStatusbarButtons.Left = me.Left
		  cvsStatusbarButtons.Width = self.Width - cvsStatusbarButtons.Left
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkShowAllTables
	#tag Event
		Sub Action()
		  if me.Enabled = true then
		    LoadList
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbKeys
	#tag Event
		Function CellTextPaint(g as graphics, row as integer, column as integer, x as integer, y as integer) As boolean
		  var oRecord as ARProject.ForeignKey = me.RowTag(row)
		  
		  select case column
		  case 0
		    // Draw manual relationship indicator
		    if oRecord.bManualEntry = true then
		      g.TextSize = 14
		      g.DrawString(&u266F, 6, 15)     // Offset a little
		      return true
		      
		    end
		    
		  case 5
		    // Draw type triangle
		    me.DrawTriangle(g, me.Selected(row))
		    
		    if me.Selected(row) then g.ForeColor = &cffffff
		    g.DrawString(oRecord.DisplayObjectType, x, y)
		    
		    return true
		    
		  end
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  // Display menu if clicked in PopupMenu column
		  var row As Integer = Me.RowFromXY(x, y)
		  var col As Integer = Me.ColumnFromXY(x, y)
		  if col <> 5 then  Return
		  
		  
		  Me.ListIndex = row
		  Me.Selected(row) = True
		  
		  var base As New MenuItem
		  base.AddItemAndTag "Single Object", ARProject.ForeignKey.kSingle
		  base.AddItemAndTag "Array of Objects", ARProject.ForeignKey.kArray
		  
		  var selectedMenu As MenuItem
		  selectedMenu = base.PopUp
		  if selectedMenu = nil then Return
		  
		  
		  // CellTextPaint will check for a value in the CellTag
		  // and display it.
		  Me.CellTag(row, col) = selectedMenu.Text
		  
		  
		  var oRecord as ARProject.ForeignKey = me.RowTag(row)
		  oRecord.iObjectType = selectedMenu.Tag.IntegerValue
		  self.TrueWindow.ContentsChanged = true
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  If Me.ColumnFromXY(x, y) = 5 Then
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.ColumnType(1) = listbox.TypeCheckbox
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  if column <> 1 then Return
		  if row = -1 then Return
		  
		  
		  var oFK as ARProject.ForeignKey = me.RowTag(row)
		  oFK.bSelected = not  oFK.bSelected
		  self.TrueWindow.ContentsChanged = true
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Handle_EditRelationship
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex < 0 then
		    btnEditRelationship.Enabled = false
		    btnDeleteRelationship.Enabled = false
		    
		  else
		    var oForeignKey as ARProject.ForeignKey = me.RowTag(me.ListIndex)
		    
		    btnEditRelationship.Enabled = oForeignKey.bManualEntry
		    btnDeleteRelationship.Enabled = oForeignKey.bManualEntry
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddRelationship
	#tag Event
		Sub Action()
		  // Delay to let the button release
		  Xojo.Core.Timer.CallLater(50, WeakAddressOf Handle_AddRelationship)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteRelationship
	#tag Event
		Sub Action()
		  Handle_DeleteRelationship
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEditRelationship
	#tag Event
		Sub Action()
		  // Delay to let the button release
		  Xojo.Core.Timer.CallLater(50, WeakAddressOf Handle_EditRelationship)
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
