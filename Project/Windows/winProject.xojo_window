#tag Window
Begin Window winProject
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   480
   ImplicitInstance=   False
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   573188042
   MenuBarVisible  =   True
   MinHeight       =   420
   MinimizeButton  =   True
   MinWidth        =   820
   Placement       =   3
   Resizeable      =   True
   Title           =   "Untitled Project"
   Visible         =   False
   Width           =   940
   Begin Listbox lbStep
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   22
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   252
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Step"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   False
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   36
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   180
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PagePanel ppMain
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   440
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   7
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   20
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   700
      Begin ccProjectSetup ctlProject
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   330
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   440
      End
      Begin ccClassSetup ctlClassSetup
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   700
      End
      Begin ccUISetup ctlUISetup
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   700
      End
      Begin ccRelationships ctlRelationships
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   700
      End
      Begin ccExtrasSetup ctlExtras
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   420
      End
      Begin ccReviewGenerate ctlReview
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   7
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   700
      End
      Begin ccCustomize ctlCustomize
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   440
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   220
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   700
      End
   End
   Begin Label lblLoading
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
      Left            =   248
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Loading..."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   448
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   289
   End
   Begin ProgressWheel pwLoading
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   450
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin BKS_Thread thdLoad
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
      ThreadID        =   0
      ThreadState     =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  // Make sure the license status is up to date
		  self.Invalidate
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma unused appQuitting
		  
		  // Still loading
		  if mbThreadWorking = true then
		    var tmd as new MessageDialog
		    tmd.Message = "Close Project?"
		    tmd.Explanation = "The project is still loading the database schema. Do you really want to close the project?"
		    tmd.ActionButton.Caption = "Continue Loading"
		    tmd.AlternateActionButton.Caption = "Close"
		    tmd.AlternateActionButton.Visible = true
		    
		    var toResponse as MessageDialogButton = tmd.ShowModalWithin(self)
		    if toResponse = tmd.AlternateActionButton then
		      thdLoad.Kill
		      return false
		      
		    elseif toResponse = tmd.ActionButton then
		      return true
		      
		    end
		    
		  end
		  
		  // Skip if document saved
		  if self.ContentsChanged = false then return false
		  
		  // Create Dialog
		  var dlg as new MessageDialog
		  dlg.Message = "Do you want to save changes before closing?"
		  dlg.Explanation = "There are unsaved changes for this project. If you don't save, your changes will be lost."
		  dlg.ActionButton.Caption = "&Save"
		  dlg.CancelButton.Caption = "Cancel"
		  dlg.CancelButton.Visible = true
		  dlg.AlternateActionButton.Caption = "&Don't Save"
		  dlg.AlternateActionButton.Visible = true
		  
		  // Show Dialog
		  var btn as MessageDialogButton = dlg.ShowModalWithin(self)
		  
		  select case btn
		  case dlg.ActionButton
		    // Save
		    if HandleSave = false then
		      return true
		      
		    end
		    
		  case dlg.AlternateActionButton
		    // Don't Save
		    
		  case dlg.CancelButton
		    // Cancel
		    return true
		    
		  end select
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  ProjectProjectGenerate.Enabled = not mbThreadWorking
		  ProjectProjectRefresh.Enabled = not mbThreadWorking
		  ProjectSave.Enabled = self.ContentsChanged
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Setup UI
		  LoadSteps
		  
		  PositionContainers
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  PositionContainers
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  PositionContainers
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ProjectProjectGenerate() As Boolean Handles ProjectProjectGenerate.Action
			ValidateTables
			
			lbStep.ListIndex = (lbStep.ListCount - 1)
			
			ctlReview.TryGenerate
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectProjectRefresh() As Boolean Handles ProjectProjectRefresh.Action
			// Refresh project
			lbStep.ListIndex = 0
			ShowLoading(true)
			
			thdLoad.Run
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ProjectSave() As Boolean Handles ProjectSave.Action
			call HandleSave
			
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
		Private Sub HandleGenerate()
		  // Warn if options selected don't generate UI
		  ValidateUI
		  
		  // Get target FolderItem
		  var tfTarget as FolderItem
		  
		  #if DebugBuild then
		    tfTarget = SpecialFolder.Desktop.Child(oProject.sProjectName + ".xojo_xml_project")
		    
		  #else
		    var toFT as new FileType
		    toFT.Name = "Xojo XML Project"
		    toFT.Extensions = ".xojo_xml_project"
		    
		    var md as new SaveAsDialog
		    md.Filter = toFT
		    // md.PromptText = "Select a destination"
		    md.SuggestedFileName = oProject.sProjectName + ".xojo_xml_project"
		    
		    tfTarget = md.ShowModalWithin(self)
		    if tfTarget = nil then return
		    
		  #endif
		  
		  var toGenerate as new ProjectGenerator.GeneratorThread
		  toGenerate.oProject = oProject
		  toGenerate.fDestination = tfTarget
		  
		  var toWin as new winGenerate
		  toWin.RunThread(toGenerate, self)
		  
		  #if DebugBuild then
		    tfTarget.Launch
		    
		  #else
		    tfTarget.ShowOnDisk
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleSave() As Boolean
		  // Save
		  oProject.Save
		  
		  // Done
		  SetTitle
		  self.ContentsChanged = false
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load()
		  // Set UI
		  SetTitle
		  lbStep.ListIndex = 0
		  ShowLoading(true)
		  
		  ctlProject.Load(me.oProject)
		  ctlProject.Enabled = false
		  
		  thdLoad.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadContainers()
		  ctlClassSetup.Load(me.oProject)
		  ctlUISetup.Load(me.oProject)
		  ctlRelationships.Load(me.oProject)
		  ctlCustomize.Load(me.oProject)
		  // ctlExtras.Load(me.oProject)
		  ctlReview.Load(me.oProject)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSteps()
		  var toProjectDetails as new clsProjectStep
		  toProjectDetails.eStep = clsProjectStep.ProjStep.Project
		  lbStep.AddRowAndTag("Project", toProjectDetails)
		  
		  var toClass as new clsProjectStep
		  toClass.eStep = clsProjectStep.ProjStep.ClassGen
		  lbStep.AddRowAndTag("Class Setup", toClass)
		  
		  var toUI as new clsProjectStep
		  toUI.eStep = clsProjectStep.ProjStep.UIGen
		  lbStep.AddRowAndTag("User Interface", toUI)
		  
		  var toRelationships as new clsProjectStep
		  toRelationships.eStep = clsProjectStep.ProjStep.Relationships
		  lbStep.AddRowAndTag("Relationships", toRelationships)
		  
		  var toCustomize as new clsProjectStep
		  toCustomize.eStep = clsProjectStep.ProjStep.Customize
		  lbStep.AddRowAndTag("Customize Template", toCustomize)
		  
		  // var toExtras as new clsProjectStep
		  // toExtras.eStep = clsProjectStep.ProjStep.Extras
		  // lbStep.AddRowAndTag("Extras", toExtras)
		  
		  var toReview as new clsProjectStep
		  toReview.eStep = clsProjectStep.ProjStep.Review
		  lbStep.AddRowAndTag("Review & Generate", toReview)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PositionContainers()
		  ctlProject.Left = ppMain.Left + ((ppMain.Width - ctlProject.Width) / 2)
		  ctlProject.Top = ppMain.Top + (ppMain.Height * 0.08)
		  
		  ctlExtras.Left = ppMain.Left + ((ppMain.Width - ctlExtras.Width) / 2)
		  ctlExtras.Top = ppMain.Top + (ppMain.Height * 0.1)
		  ctlExtras.Height = self.Height - ctlExtras.Top - 20
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTitle()
		  // Set up Title
		  self.Title = oProject.sProjectName + " - " + oProject.eDBEngine.ToString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowLoading(bVal as Boolean)
		  lblLoading.Enabled = bVal
		  lblLoading.Visible = bVal
		  lbStep.Enabled = not bVal
		  pwLoading.Enabled = bVal
		  pwLoading.Visible = bVal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ValidateTables()
		  // Check for Xojo errors / conflicts
		  var arsErrors() as String
		  
		  // CubeSQL is API 1 only
		  if oProject.iProjectAPI = 2 then
		    if oProject.eDBEngine = DBEngine.CubeSQL then
		      arsErrors.Append("CubeSQL Xojo Plugin does not support API 2.0.")
		      
		    end
		    
		  end
		  
		  // Tables and Views
		  for each oTable as ARProject.TableData in oProject.DataClass.aroTables
		    if oTable.bSelected = false then
		      // Item not selected, but has UI?
		      if oTable.bHasUI then
		        arsErrors.Append(oTable.sTableName + " has User Interface selected but does not generate ActiveRecord classes.")
		        
		      end
		      
		      // Only check selected items
		      continue
		      
		    end
		    
		    // Validate the table
		    oTable.Validate(oProject.IsWeb20)
		    
		    // Gather the errors
		    for each sTableError as String in oTable.arsErrors
		      arsErrors.Append(sTableError)
		      
		    next sTableError
		    
		  next oTable
		  
		  // Customization template
		  oProject.DataClass.CustomTemplate.Validate
		  for each sTableError as String in oProject.DataClass.CustomTemplate.arsErrors
		    arsErrors.Append(sTableError)
		    
		  next sTableError
		  
		  
		  // Set
		  ctlReview.SetErrors(arsErrors)
		  
		  // Display
		  if mbDisplaySchemaWarning = true and arsErrors.Ubound > -1 then
		    var md as new MessageDialog
		    md.Message = "Project Conflicts"
		    md.Explanation = "Some issues were found while validating the schema for Xojo. " + _
		    "Would you like to review the conflicts now?"
		    
		    md.ActionButton.Caption = "Review"
		    md.CancelButton.Caption = "Later"
		    md.CancelButton.Visible = true
		    
		    if md.ShowModalWithin(self) = md.ActionButton then
		      mbDisplaySchemaWarning = false
		      lbStep.ListIndex = (lbStep.ListCount - 1)
		      
		    end
		    
		  end
		  
		  // Only the first time / window open
		  mbDisplaySchemaWarning = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ValidateUI()
		  // Already set. Using date in case I decide to change to remind every so often
		  if TPSettings.Get("WarnedAboutNoUI", "") <> "" then return
		  
		  if oProject.eProjectType = ProjectType.Console or _
		    oProject.eProjectType = ProjectType.iOS then
		    var md as new MessageDialog
		    md.Icon = MessageDialog.GraphicCaution
		    md.Message = "No User Interface Generation"
		    md.Explanation = "The platform selected does not generate user interface controls. " + _
		    "This is indicated by the " + &u26A0 + " icon." + EndOfLine + EndOfLine + _
		    "You will not see this reminder again :)"
		    
		    call md.ShowModalWithin(self)
		    
		    var dtmNow as new Date
		    TPSettings.Set("WarnedAboutNoUI") = dtmNow.SQLDateTime
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mbDisplaySchemaWarning As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbListFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbThreadWorking As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty


	#tag Constant, Name = kNotActivated, Type = String, Dynamic = False, Default = \"License Not Activated", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events lbStep
	#tag Event
		Sub Change()
		  // Change view
		  var toTag as clsProjectStep = me.RowTag(me.ListIndex)
		  if toTag = nil then
		    ppMain.Value = 0
		    
		  else
		    select case toTag.eStep
		    case clsProjectStep.ProjStep.Project
		      ppMain.Value = 0
		      
		    case clsProjectStep.ProjStep.ClassGen
		      ppMain.Value = 1
		      
		    case clsProjectStep.ProjStep.UIGen
		      ppMain.Value = 2
		      
		    case clsProjectStep.ProjStep.Relationships
		      ppMain.Value = 3
		      
		    case clsProjectStep.ProjStep.Customize
		      ppMain.Value = 4
		      
		    case clsProjectStep.ProjStep.Extras
		      ppMain.Value = 5
		      
		    case clsProjectStep.ProjStep.Review
		      ValidateTables
		      ppMain.Value = 6
		      
		    end select
		    
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  mbListFocus = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  mbListFocus = false
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlProject
	#tag Event
		Sub InvalidateStepList()
		  lbStep.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ctlReview
	#tag Event
		Sub GenerateProject()
		  HandleGenerate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Revalidate()
		  ValidateTables
		  LoadContainers
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thdLoad
	#tag Event
		Sub HandleEvent(sEvent As String)
		  select case sEvent
		  case BKS_Thread.kStart
		    mbThreadWorking = true
		    
		  case BKS_Thread.kFinished
		    // Done!
		    LoadContainers
		    
		    // Enable
		    ctlProject.Enabled = true
		    ShowLoading(false)
		    
		    // Did some control inadvertently mark a clean document dirty?
		    #if DebugBuild then
		      if self.ContentsChanged = true and not oProject.IsNew then break
		    #endif
		    
		    // Validate the tables
		    ValidateTables
		    
		    mbThreadWorking = false
		    
		  end select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Run()
		  // Load the project in a thread
		  oProject.LoadData(me)
		  
		  // Set final status
		  var td as new Dictionary
		  td.Value("CheckingForConflictsMessage") = "Checking for conflicts..."
		  me.UpdateUI(td)
		  me.Sleep(15)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UIUpdate(d as Dictionary)
		  if d.HasKey("msg") then
		    lblLoading.Text = d.Value("msg").StringValue
		    return
		    
		  end
		  
		  if d.HasKey("CheckingForConflictsMessage") then
		    lblLoading.Text = d.Value("CheckingForConflictsMessage").StringValue
		    return
		    
		  end
		  
		  // Something else?
		  break
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
#tag EndViewBehavior
