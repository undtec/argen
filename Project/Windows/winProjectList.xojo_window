#tag Window
Begin Window winProjectList
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   450
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   573188042
   MenuBarVisible  =   True
   MinHeight       =   450
   MinimizeButton  =   True
   MinWidth        =   420
   Placement       =   3
   Resizeable      =   True
   Title           =   "#kTitle"
   Visible         =   False
   Width           =   600
   Begin GroupBox grpControls
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Project"
      Enabled         =   True
      Height          =   136
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
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   212
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
      Begin WindowsButton btnNew
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "New"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpControls"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   244
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin WindowsButton btnEdit
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Edit"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpControls"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   276
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin WindowsButton btnDelete
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Delete"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpControls"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   308
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
   End
   Begin Listbox lbProjects
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   42
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   410
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Projects"
      Italic          =   False
      Left            =   160
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
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   420
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas cvsIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1309956095
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   42
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin Label lblARGen
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ARGen"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   20.0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
   Begin Label lblBuild
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Build"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
   Begin Label lblCopyright
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
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "© 2013 - 2021 Underwriters Technologies"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   427
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  RefreshView
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma unused appQuitting
		  
		  #if not DebugBuild then
		    // Save window position
		    var toPos as REALbasic.Rect = self.Bounds
		    var tjsPos as new JSONItem
		    tjsPos.Append(toPos.Left)
		    tjsPos.Append(toPos.Top)
		    tjsPos.Append(toPos.Width)
		    tjsPos.Append(toPos.Height)
		    
		    TPSettings.Set("MainWindowCoordinates") = tjsPos.ToString
		    
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  ProjectProjectEdit.Enabled = (lbProjects.ListIndex > -1)
		  ProjectProjectDelete.Enabled = ProjectProjectEdit.Enabled
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  HandleEnabledStates
		  
		  // LoadList and license button
		  RefreshView
		  
		  // Window position
		  #if not DebugBuild then
		    var tsPos as String = TPSettings.Get("MainWindowCoordinates", "")
		    if tsPos <> "" then
		      try
		        var tjsPos as new JSONItem(tsPos)
		        var toPos as new REALbasic.Rect(tjsPos.Value(0), tjsPos.Value(1), tjsPos.Value(2), tjsPos.Value(3))
		        if modGlobals.WindowIsOnScreen(toPos) then
		          self.Bounds = toPos
		          
		        end
		        
		      catch e as JSONException
		        // Bad JSON somehow?
		      end try
		      
		    end
		    
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ProjectNewProject() As Boolean Handles ProjectNewProject.Action
			HandleAdd
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectProjectDelete() As Boolean Handles ProjectProjectDelete.Action
			HandleDelete
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectProjectEdit() As Boolean Handles ProjectProjectEdit.Action
			HandleEdit
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowClose() As Boolean Handles WindowClose.Action
			self.Close
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub HandleAdd()
		  // var oRecord as new DataFile.T_Project
		  // 
		  // var wConnect as new winNewProject
		  // wConnect.Display(oRecord)
		  // 
		  // if wConnect.bSaved = false then return
		  // 
		  // LoadList
		  // lbProjects.SetID = oRecord.iProject_ID
		  // 
		  // HandleEdit(true)
		  
		  var toConnect as new winNewProject
		  toConnect.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDelete()
		  if lbProjects.ListIndex < 0 then return
		  
		  var md as new MessageDialog
		  md.Message = "Delete Selected Connections?"
		  md.Explanation = "Are you sure you wish to delete each of the selected connections?"
		  
		  // Single project handling
		  if lbProjects.SelCount = 1 then
		    var toProj as DataFile.t_Project = lbProjects.RowTag(lbProjects.ListIndex)
		    if toProj <> nil then
		      md.Message = "Delete " + toProj.sProjectName + "?"
		      md.Explanation = "Are you sure you want to delete the connection named " + toProj.sProjectName + "?"
		      
		    end
		    
		  end
		  
		  // Cannot undo!
		  md.Explanation = md.Explanation + " This action cannot be undone."
		  
		  // Buttons
		  md.ActionButton.Caption = "Delete"
		  md.ActionButton.Default = false
		  
		  md.CancelButton.Default = true
		  md.CancelButton.Visible = true
		  
		  if md.ShowModal = md.CancelButton then return
		  
		  // Delete confirmed
		  for i as Integer = (lbProjects.ListCount - 1) DownTo 0
		    // Skip unselected projects
		    if lbProjects.Selected(i) = false then continue
		    
		    var oRecord as DataFile.T_Project = lbProjects.RowTag(i)
		    
		    // Close any related project windows
		    for iWindow as Integer = (WindowCount - 1) DownTo 0
		      var winThis as Window = Window(iWindow)
		      if winThis isa winProject then
		        if oRecord.iProject_ID = winProject(winThis).oProject.iProject_ID then
		          winThis.Close
		          
		        end
		        
		      end
		      
		    next
		    
		    // Delete the record
		    oRecord.Delete
		    
		    // Delete from list so that we don't need to reload the list
		    lbProjects.RemoveRow(i)
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDuplicate()
		  var tiMaxProj as Integer = lbProjects.ListCount - 1
		  for tiRow as Integer = 0 to tiMaxProj
		    if lbProjects.Selected(tiRow) = false then continue
		    
		    var toSelection as DataFile.t_Project = lbProjects.RowTag(tiRow)
		    if toSelection = nil then continue for tiRow
		    
		    // Fetch password for copy
		    toSelection.KeychainRestorePassword
		    
		    // Clone the project data
		    var toNewDataClass as new ARProject.ProjectData
		    toNewDataClass.FromJSON(new JSONItem(toSelection.DataClass.ToString))
		    
		    var toNewData as new DataFile.t_ProjectData
		    toNewData.oData = toNewDataClass
		    
		    // Clone the project
		    var toNew as DataFile.t_Project = toSelection.Clone
		    toNew.sPassword = toSelection.sPassword
		    toNew.oProjectData = toNewData
		    toNew.sProjectName = toNew.sProjectName + " Copy"
		    
		    toNew.Save
		    
		  next tiRow
		  
		  LoadList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEdit(tbAutoConnect as Boolean = true)
		  if lbProjects.ListIndex < 0 then return
		  
		  var taroWindows() as Window
		  var tiMaxWin as Integer = WindowCount - 1
		  for ti as Integer = 0 to tiMaxWin
		    taroWindows.Append(Window(ti))
		    
		  next ti
		  
		  var tiMaxProj as Integer = lbProjects.ListCount - 1
		  for tiRow as Integer = 0 to tiMaxProj
		    if lbProjects.Selected(tiRow) = false then continue
		    
		    var toSelection as DataFile.t_Project = lbProjects.RowTag(tiRow)
		    if toSelection = nil then continue for tiRow
		    
		    // Check to see if we already have a window open
		    for each toWin as Window in taroWindows
		      if toWin isa winProject then
		        if winProject(toWin).oProject.iProject_ID = toSelection.iProject_ID then
		          toWin.Show
		          continue for tiRow
		          
		        end
		        
		      end
		      
		    next toWin
		    
		    // Attempt to autoconnect
		    if tbAutoConnect and (TargetMacOS or toSelection.eDBEngine = DBEngine.SQLite) then
		      toSelection.KeychainRestorePassword
		      
		      var tsError as String
		      var toDB as Database = toSelection.Connect(tsError)
		      
		      // Connected automatically
		      if toDB <> nil then
		        // Store the connected db
		        toSelection.oProjectDB = toDB
		        
		        var toProj as new winProject
		        toProj.oProject = toSelection
		        toProj.Load
		        toProj.Show
		        
		        continue for tiRow
		        
		      end
		      
		    end
		    
		    // Show connection window, awaiting password
		    var toConnect as new winConnect
		    toConnect.oProject = toSelection
		    toConnect.Load
		    toConnect.Show
		    
		    
		  next tiRow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEnabledStates()
		  var bEnabled as Boolean = (lbProjects.ListIndex > -1)
		  
		  btnEdit.Enabled = bEnabled
		  btnDelete.Enabled = bEnabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadList()
		  var tariSelectedProjects() as Integer
		  
		  for ti as Integer = 0 to (lbProjects.ListCount - 1)
		    if lbProjects.Selected(ti) = true then
		      var toProject as DataFile.t_Project = lbProjects.RowTag(ti)
		      tariSelectedProjects.Append(toProject.iProject_ID)
		      
		    end
		    
		  next ti
		  
		  lbProjects.DeleteAllRows
		  
		  for each oRecord as DataFile.T_Project in DataFile.t_Project.List
		    lbProjects.AddRow(oRecord.sProjectName)
		    lbProjects.RowTag(lbProjects.LastIndex) = oRecord
		    
		    // Reselect
		    if tariSelectedProjects.IndexOf(oRecord.iProject_ID) > -1 then
		      lbProjects.Selected(lbProjects.LastIndex) = true
		      
		    end
		    
		  next oRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshList(oRecord as DataFile.T_Project = nil)
		  // Reload the list
		  if oRecord = nil then
		    LoadList
		    return
		    
		  end
		  
		  // Reload a specific row
		  for i as integer = 0 to lbProjects.ListCount - 1
		    if lbProjects.RowTag(i) = nil then Continue
		    var oRowRecord as DataFile.T_Project = lbProjects.RowTag(i)
		    
		    if oRowRecord.iProject_ID = oRecord.iProject_ID then
		      lbProjects.Cell(i, 0) = oRecord.sProjectName
		      return
		      
		    end
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshView()
		  LoadList
		End Sub
	#tag EndMethod


	#tag Constant, Name = kFinderExplorer, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Finder"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Explorer"
	#tag EndConstant

	#tag Constant, Name = kTitle, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"ARGen"
	#tag EndConstant


	#tag Enum, Name = ProjectAction, Type = Integer, Flags = &h21
		Unknown
		  Connect
		  EditConnection
		  Duplicate
		  Reveal
		Delete
	#tag EndEnum


#tag EndWindowCode

#tag Events btnNew
	#tag Event
		Sub Action()
		  HandleAdd
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEdit
	#tag Event
		Sub Action()
		  HandleEdit
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDelete
	#tag Event
		Sub Action()
		  HandleDelete
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbProjects
	#tag Event
		Sub Change()
		  HandleEnabledStates
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  HandleEdit
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  const kDeleteKey = 8
		  
		  #if TargetMacOS then
		    if Keyboard.CommandKey and asc(key) = kDeleteKey then
		      HandleDelete
		      return true
		      
		    end
		    
		  #else
		    
		    if Keyboard.ControlKey and asc(key) = kDeleteKey then
		      HandleDelete
		      return true
		      
		    end
		    
		  #Endif
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.ColumnAlignmentOffset(0) = 12
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma unused column
		  #pragma unused x
		  #pragma unused y
		  
		  var toConnection as DataFile.t_Project = me.RowTag(row)
		  if toConnection = nil then return false
		  
		  var tsConnection as String = toConnection.sDatabaseHost
		  
		  var toIcon as new clsEngineIcon
		  toIcon.Width = 32
		  toIcon.Height = 32
		  toIcon.Top = (g.Height - toIcon.Height) / 2
		  toIcon.Left = g.Height - toIcon.Height
		  toIcon.Selected = me.Selected(row)
		  toIcon.Engine = toConnection.eDBEngine
		  
		  // Draw icon
		  toIcon.Draw(g)
		  
		  // Draw Name
		  g.DrawString(toConnection.sProjectName, toIcon.Left + toIcon.Width + 12, 18)
		  
		  // Draw connection
		  if not me.Selected(row) then
		    #if TargetMacOS then
		      g.ForeColor = NSColorMBS.secondaryLabelColor.colorValue
		      
		    #else
		      g.ForeColor = &c666666
		      
		    #endif
		    
		  end
		  
		  g.TextSize = 11
		  g.DrawString(tsConnection, toIcon.Left + toIcon.Width + 12, 32)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  
		  me.ListIndex = me.RowFromXY(x, y)
		  
		  if me.ListIndex < 0 then return false
		  var toSelection as DataFile.t_Project = me.RowTag(me.ListIndex)
		  
		  var toShowSQLite as new MenuItem("Reveal in " + kFinderExplorer)
		  toShowSQLite.Enabled = (toSelection.eDBEngine = DBEngine.SQLite)
		  toShowSQLite.Tag = ProjectAction.Reveal
		  
		  base.AddItemAndTag("Connect", ProjectAction.Connect)
		  
		  #if TargetMacOS then
		    base.AddItemAndTag(MenuItem.TextSeparator, ProjectAction.Unknown)
		    base.AddItemAndTag("Edit Connection", ProjectAction.EditConnection)
		    
		  #endif
		  
		  base.AddItemAndTag("Duplicate", ProjectAction.Duplicate)
		  base.AddItemAndTag(MenuItem.TextSeparator, ProjectAction.Unknown)
		  
		  base.Append(toShowSQLite)
		  base.AddItemAndTag(MenuItem.TextSeparator, ProjectAction.Unknown)
		  
		  base.AddItemAndTag("Delete", ProjectAction.Delete)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem = nil then return false
		  
		  var teAction as ProjectAction = hitItem.Tag
		  
		  select case teAction
		  case ProjectAction.Connect
		    HandleEdit
		    
		  case ProjectAction.EditConnection
		    HandleEdit(false)
		    
		  case ProjectAction.Duplicate
		    HandleDuplicate
		    
		  case ProjectAction.Reveal
		    var toProj as DataFile.t_Project = me.RowTag(me.ListIndex)
		    if toProj <> nil and toProj.eDBEngine = DBEngine.SQLite and toProj.fDatabase <> nil then
		      toProj.fDatabase.ShowOnDisk
		      
		    end
		    
		  case ProjectAction.Delete
		    HandleDelete
		    
		  end select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cvsIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  g.DrawPicture(picAppIcon, 0, 0, g.Width, g.Height, 0, 0, picAppIcon.Width, picAppIcon.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblBuild
	#tag Event
		Sub Open()
		  var tiBuild as Integer = App.NonReleaseVersion
		  #if DebugBuild then
		    tiBuild = tiBuild + 1
		    
		  #endif
		  
		  me.Text = "Build " + Format(tiBuild, "#####")
		  
		  select case App.StageCode
		  case 0
		    me.Text = me.Text + " (dev)"
		    
		  case 1
		    me.Text = me.Text + " (alpha)"
		    
		  case 2
		    me.Text = me.Text + " (beta)"
		    
		  case 3
		    // Final release
		    
		  end select
		  
		  #if TargetWindows then
		    lblBuild.TextColor = &c666666
		    lblCopyright.TextColor = &c666666
		    
		  #endif
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
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
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
		Visible=false
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
