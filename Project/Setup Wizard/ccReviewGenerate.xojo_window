#tag Window
Begin ContainerControl ccReviewGenerate
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
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
   Width           =   620
   Begin Listbox lbErrors
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   24
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   236
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Xojo Conflicts"
      Italic          =   False
      Left            =   0
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
      Width           =   620
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblHeading
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
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kHeading_Single"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   376
   End
   Begin WindowsButton btnGenerate
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Generate Project"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   278
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin Timer tmrGenerateRelay
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   15
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin LinkLabel lblHelp
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
      Left            =   388
      LinkURL         =   ""
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "More information on project conflicts"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   232
   End
   Begin WindowsButton btnFastResolve
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Quick Resolve"
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
      Top             =   278
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function ErrorCount() As Integer
		  return lbErrors.ListCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FastResolve()
		  for each toTable as ARProject.TableData in moProject.Tables
		    if toTable.bSelected = false then
		      // Fix UI no Class
		      toTable.bHasUI = false
		      
		      continue for toTable
		      
		    end
		    
		    // Revalidate
		    toTable.Validate(moProject.IsWeb20)
		    
		    if toTable.arsErrors.Ubound > -1 then
		      toTable.bHasUI = false
		      toTable.bSelected = false
		      
		    end
		    
		  next toTable
		  
		  RaiseEvent Revalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(toProject as DataFile.t_Project)
		  moProject = toProject
		  
		  // Platform specific behaviors
		  lbErrors.UseFocusRing = not TargetMacOS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetErrors(arsErrors() as String)
		  // This happens if you manage to hit Generate before the thread starts
		  if moProject = nil then
		    lbErrors.InsertRow(0, "Project not ready to generate.")
		    btnFastResolve.Enabled = false
		    return
		    
		  end
		  
		  lbErrors.DeleteAllRows
		  for i as Integer = 0 to arsErrors.Ubound
		    lbErrors.AddRow(arsErrors(i))
		    
		  next
		  
		  // Handle count / plurals
		  if lbErrors.ListCount = 0 then
		    lblHeading.Text = kHeading_None.Replace("%project%", moProject.sProjectName)
		    
		  elseif lbErrors.ListCount = 1 then
		    lblHeading.Text = kHeading_Single.Replace("%project%", moProject.sProjectName)
		    
		  else
		    lblHeading.Text = kHeading_Plural.Replace("%project%", moProject.sProjectName)
		    
		  end
		  
		  btnFastResolve.Enabled = (lbErrors.ListCount > 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TryGenerate()
		  #if DebugBuild then
		    if Keyboard.OptionKey then
		      lbErrors.DeleteAllRows
		      
		    end
		    
		  #endif
		  
		  if self.ErrorCount > 0 then
		    var md as new MessageDialog
		    md.Message = "Project Conflicts"
		    md.Explanation = "Some settings could cause conflicts with Xojo. " + _
		    "Please resolve the conflicts to generate a valid XML project."
		    
		    Beep
		    call md.ShowModalWithin(self.TrueWindow)
		    
		  else
		    // Use a relay to release the button in the UI
		    btnGenerate.Enabled = false
		    tmrGenerateRelay.Mode = Timer.ModeSingle
		    tmrGenerateRelay.Reset
		    
		  end
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GenerateProject()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Revalidate()
	#tag EndHook


	#tag Property, Flags = &h21
		Private moProject As DataFile.t_Project
	#tag EndProperty


	#tag Constant, Name = kError, Type = String, Dynamic = True, Default = \"Error", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kHeading_None, Type = String, Dynamic = False, Default = \"%project% has no conflicts.", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kHeading_Plural, Type = String, Dynamic = False, Default = \"%project% has some conflicts with Xojo.", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kHeading_Single, Type = String, Dynamic = False, Default = \"%project% has a conflict with Xojo.", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events btnGenerate
	#tag Event
		Sub Action()
		  TryGenerate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrGenerateRelay
	#tag Event
		Sub Action()
		  // Use a relay to release the button in the UI
		  me.Mode = Timer.ModeOff
		  
		  RaiseEvent GenerateProject
		  
		  btnGenerate.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblHelp
	#tag Event
		Sub Action()
		  try
		    SpecialFolder.Resources.Child("Help Book").Child("using-argen").Child("review").Child("index.html").Launch
		    
		  catch e as NilObjectException
		    MsgBox("Help Not Found")
		    
		  end try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnFastResolve
	#tag Event
		Sub Action()
		  var md as new MessageDialog
		  md.Message = "Perform Quick Resolve?"
		  md.Explanation = "Do you wish to perform a quick resolve? " + _
		  "This will automatically deselect tables and views that have conflicts."
		  
		  md.ActionButton.Caption = "Resolve"
		  md.ActionButton.Default = false
		  md.CancelButton.Default = true
		  md.CancelButton.Visible = true
		  
		  if md.ShowModalWithin(self.TrueWindow) = md.ActionButton then
		    FastResolve
		    self.TrueWindow.ContentsChanged = true
		    
		  end
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
