#tag Window
Begin Window winGenerate
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   3
   FullScreen      =   False
   HasBackColor    =   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   96
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Generate Xojo Project"
   Type            =   8
   Visible         =   False
   Width           =   420
   Begin Label lblMessage
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
      Text            =   "Generating Xojo Project File"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   380
   End
   Begin ProgressBar pbWait
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   37
      Transparent     =   False
      Value           =   100.0
      Visible         =   True
      Width           =   380
   End
   Begin Label lblStatus
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Message"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   59
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   380
   End
   Begin Timer tmrRelay
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   50
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  // Clear taskbar tile progress
		  #if TargetWindows then
		    moWindowsTaskBar.SetProgressState(muiWindowsHandle, WindowsTaskbarListMBS.ProgressStateFlagNoProgress)
		    
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RunThread(toThread as ProjectGenerator.GeneratorThread, toAttach as Window)
		  moThread = toThread
		  
		  AddHandler moThread.HandleEvent, WeakAddressOf ThreadEvent
		  AddHandler moThread.UIUpdate, WeakAddressOf ThreadUpdate
		  
		  tmrRelay.Mode = Timer.ModeSingle
		  
		  // Clear placeholders
		  lblStatus.Text = ""
		  pbWait.Maximum = 100
		  pbWait.Value = 0
		  
		  #if TargetWindows then
		    muiWindowsHandle = toAttach.Handle
		    moWindowsTaskBar = new WindowsTaskbarListMBS
		    moWindowsTaskBar.SetProgressState(muiWindowsHandle, WindowsTaskbarListMBS.ProgressStateFlagNormal)
		    
		  #endif
		  
		  self.ShowModalWithin(toAttach)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadEvent(oSender as BKS_Thread, sEvent as String)
		  select case sEvent
		  case BKS_Thread.kStart
		    
		  case BKS_Thread.kKilled
		    // An error ocurred, kFinished will still happen!
		    var md as new MessageDialog
		    md.Message = "Generation Failed"
		    md.Explanation = Introspection.GetType(oSender.exKilledMessage).Name + ": " + oSender.exKilledMessage.Message
		    
		    call md.ShowModalWithin(self)
		    
		  case BKS_Thread.kFinished
		    // Close
		    mbClose = true
		    tmrRelay.Reset
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadUpdate(oSender as BKS_Thread, dictUpdate as Dictionary)
		  #pragma unused oSender
		  
		  // Check label update
		  if dictUpdate.HasKey("LabelValue") then
		    lblStatus.Text = dictUpdate.Value("LabelValue")
		    
		  end
		  
		  // Check progress max
		  if dictUpdate.HasKey("ProgressMax") then
		    pbWait.Maximum = dictUpdate.Value("ProgressMax")
		    
		  end
		  
		  // Check progress value
		  if dictUpdate.HasKey("ProgressValue") then
		    pbWait.Value = dictUpdate.Value("ProgressValue")
		    
		    // Taskbar tile progress
		    #if TargetWindows then
		      moWindowsTaskBar.SetProgressValue(muiWindowsHandle, pbWait.Value, pbWait.Maximum)
		      
		    #endif
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mbClose As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moThread As ProjectGenerator.GeneratorThread
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moWindowsTaskBar As WindowsTaskbarListMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private muiWindowsHandle As UInteger
	#tag EndProperty


#tag EndWindowCode

#tag Events tmrRelay
	#tag Event
		Sub Action()
		  if mbClose = true then
		    // Relay closing the window
		    self.Close
		    
		  else
		    // Relay starting the thread
		    lblStatus.Text = "Starting..."
		    moThread.Run
		    
		  end
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
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
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
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
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
		Group="Appearance"
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
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
