#tag Window
Begin Window winAbout
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   296
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   ""
   Visible         =   False
   Width           =   284
   Begin Canvas cvsIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   875001855
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   110
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   16
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   64
   End
   Begin Label lblAppName
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ARGen"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   88
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin Label lblVersion
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
      Text            =   "Version"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   112
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin TextArea txtCredits
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   100
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   284
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "© 2013 - 2021 Underwriters Technologies"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   256
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  BuildAboutText
		  
		  #if TargetWindows then
		    me.Title = "About " + lblAppName.Text
		    
		  #elseif TargetMacOS then
		    // Pretty margins
		    txtCredits.NSTextViewMBS.textContainerInset = NSMakeSizeMBS(2, 3)
		    
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function WindowClose() As Boolean Handles WindowClose.Action
			self.Close
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub BuildAboutText()
		  var st as new StyledText
		  var sr as StyleRun
		  
		  sr = GetNewStyleRun
		  sr.Text = "ActiveRecord Class Generator for Xojo - Save time and money creating database driven apps. " + _
		  EndOfLine.UNIX + EndOfLine.UNIX + _
		  "Automate class and user interface component generation from database schema design." + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  // Developed by:
		  sr = GetNewStyleRun(11, False, True)
		  sr.Text = EndOfLine.UNIX + "Copyright 2021:" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  sr = GetNewStyleRun
		  sr.Text = kSpacePrefix + "Underwriters Technologies" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  // Icon:
		  sr = GetNewStyleRun(11, false, true)
		  sr.Text = EndOfLine.UNIX + "Icon created by:" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  sr = GetNewStyleRun
		  sr.Text = kSpacePrefix + "Gavin Nelson" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  // Created by:
		  sr = GetNewStyleRun(11, false, true)
		  sr.Text = EndOfLine.UNIX + "With thanks to:" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  sr = GetNewStyleRun
		  sr.Text = kSpacePrefix + "Bob Keeney" + EndOfLine.UNIX
		  st.AppendStyleRun(sr)
		  
		  
		  // // Testing:
		  // sr = GetNewStyleRun(11, false, true)
		  // sr.Text = EndOfLine + "Testing:" + EndOfLine.UNIX
		  // st.AppendStyleRun(sr)
		  // 
		  // sr = GetNewStyleRun
		  // sr.Text = kSpacePrefix + "Someone Helpful" + EndOfLine.UNIX
		  // st.AppendStyleRun(sr)
		  
		  
		  // // With thanks to:
		  // sr = GetNewStyleRun(11, false, true)
		  // sr.Text = EndOfLine + "With thanks to:" + EndOfLine.UNIX
		  // st.AppendStyleRun(sr)
		  // 
		  // sr = GetNewStyleRun
		  // sr.Text = kSpacePrefix + "Anthony Cyphers" + EndOfLine.UNIX
		  // st.AppendStyleRun(sr)
		  
		  // Little stuff
		  // sr = GetNewStyleRun(10, true)
		  // sr.Text = "Made with Xojo <https://www.xojo.com>" + EndOfLine + EndOfLine
		  // st.AppendStyleRun(sr)
		  
		  txtCredits.StyledText = st
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetNewStyleRun(iFontSize as Integer = 11, bGrey as Boolean = false, bBold as Boolean = false) As StyleRun
		  var sr as new StyleRun
		  sr.Bold = bBold
		  sr.Size = iFontSize
		  
		  #if TargetMacOS then
		    sr.TextColor = if(bGrey, NSColorMBS.secondaryLabelColor.colorValue, NSColorMBS.labelColor.colorValue)
		    
		  #elseif TargetWindows then
		    sr.TextColor = if(bGrey, &c777777, TextColor)
		    
		  #endif
		  
		  return sr
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mbDarkMode As Boolean
	#tag EndProperty


	#tag Constant, Name = kSpacePrefix, Type = String, Dynamic = False, Default = \"    ", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events cvsIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  #pragma unused g
		  
		  g.DrawPicture(picAppIcon, 0, 0, 64, 64, 0, 0, 256, 256)
		  
		  // Keep text area the right color
		  if IsDarkMode <> mbDarkMode then
		    BuildAboutText
		    mbDarkMode = IsDarkMode
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblVersion
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
		Visible=true
		Group="Deprecated"
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
