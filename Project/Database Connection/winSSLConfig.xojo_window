#tag Window
Begin Window winSSLConfig
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
   Height          =   380
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   348
   MinimumWidth    =   400
   Resizeable      =   False
   Title           =   "Configure SSL"
   Type            =   8
   Visible         =   False
   Width           =   450
   Begin PagePanel ppAuthDirMode
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   75
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   78
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   450
      Begin GroupBox grpAuthorityDirectory
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Authority Directory"
         Enabled         =   True
         Height          =   57
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppAuthDirMode"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   89
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   410
         Begin ccFileSelector ctlAuthorityDirectory
            AcceptFocus     =   False
            AcceptTabs      =   True
            AutoDeactivate  =   True
            BackColor       =   &cFFFFFF00
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            HasBackColor    =   False
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpAuthorityDirectory"
            Left            =   28
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   2
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   113
            Transparent     =   True
            UseFocusRing    =   False
            Visible         =   True
            Width           =   393
         End
      End
      Begin GroupBox grpSSLMode
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "SSL Mode"
         Enabled         =   True
         Height          =   57
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppAuthDirMode"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   89
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   410
         Begin PopupMenu pmPostgresSSLMode
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpSSLMode"
            InitialValue    =   ""
            Italic          =   False
            Left            =   40
            ListIndex       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   2
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   115
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   199
         End
      End
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
      Left            =   258
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   333
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   172
   End
   Begin TextField txtCipher
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   80
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   296
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   350
   End
   Begin Label lblCipher
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
      Text            =   "Cipher:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   297
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   57
   End
   Begin GroupBox grpCertificate
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Certificate"
      Enabled         =   True
      Height          =   57
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   158
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   410
      Begin ccFileSelector ctlSSLCertificate
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpCertificate"
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   182
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   393
      End
   End
   Begin GroupBox grpAuthority
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Authority"
      Enabled         =   True
      Height          =   57
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   410
      Begin ccFileSelector ctlAuthority
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpAuthority"
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   44
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   393
      End
   End
   Begin GroupBox grpKey
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Key"
      Enabled         =   True
      Height          =   57
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   227
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   410
      Begin ccFileSelector ctlKey
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpKey"
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   251
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   393
      End
   End
   Begin Timer tmrEnableCipher
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   150
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function EditMySQL(oConfig as ARProject.SSLConfiguration, winAttachTo as Window = nil) As ARProject.SSLConfiguration
		  moConfig = oConfig
		  
		  // Setup UI
		  ShowMySQL
		  
		  // Load settings
		  ctlAuthority.fTarget = moConfig.fAuthority
		  ctlAuthorityDirectory.fTarget = moConfig.fAuthorityDirectory
		  ctlKey.fTarget = moConfig.fKey
		  ctlSSLCertificate.fTarget = moConfig.fSSLCertificate
		  txtCipher.Text = moConfig.sCipher
		  
		  self.ShowModalWithin(winAttachTo)
		  
		  return moConfig
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EditPostgres(oConfig as ARProject.SSLConfiguration, winAttachTo as Window = nil) As ARProject.SSLConfiguration
		  moConfig = oConfig
		  
		  // Setup UI
		  ShowPostgres
		  
		  // Load settings
		  ctlAuthority.fTarget = moConfig.fAuthority
		  pmPostgresSSLMode.SetFromTagValue(moConfig.iPostgresSSLMode)
		  ctlKey.fTarget = moConfig.fKey
		  ctlSSLCertificate.fTarget = moConfig.fSSLCertificate
		  
		  self.ShowModalWithin(winAttachTo)
		  
		  return moConfig
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewMySQL(winAttachTo as Window = nil) As ARProject.SSLConfiguration
		  moConfig = new ARProject.SSLConfiguration
		  
		  // Setup UI
		  ShowMySQL
		  
		  // Default cipher
		  txtCipher.Text = moConfig.sCipher
		  
		  self.ShowModalWithin(winAttachTo)
		  
		  return moConfig
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewPostgres(winAttachTo as Window = nil) As ARProject.SSLConfiguration
		  moConfig = new ARProject.SSLConfiguration
		  
		  // Setup UI
		  ShowPostgres
		  
		  // Default Require
		  pmPostgresSSLMode.ListIndex = 2
		  
		  self.ShowModalWithin(winAttachTo)
		  
		  return moConfig
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveMySQL()
		  moConfig.fAuthority = ctlAuthority.fTarget
		  moConfig.fAuthorityDirectory = ctlAuthorityDirectory.fTarget
		  moConfig.fKey = ctlKey.fTarget
		  moConfig.fSSLCertificate = ctlSSLCertificate.fTarget
		  
		  moConfig.sCipher = Trim(txtCipher.Text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavePostgres()
		  moConfig.fAuthority = ctlAuthority.fTarget
		  moConfig.iPostgresSSLMode = pmPostgresSSLMode.RowTag(pmPostgresSSLMode.ListIndex)
		  moConfig.fKey = ctlKey.fTarget
		  moConfig.fSSLCertificate = ctlSSLCertificate.fTarget
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowMySQL()
		  meType = DBEngine.MySQL
		  ppAuthDirMode.Value = 0
		  tmrEnableCipher.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowPostgres()
		  meType = DBEngine.Postgres
		  
		  lblCipher.Enabled = false
		  lblCipher.Visible = false
		  
		  pmPostgresSSLMode.AddRowAndTag("Allow", PostgreSQLDatabase.SSLAllow)
		  pmPostgresSSLMode.AddRowAndTag("Prefer", PostgreSQLDatabase.SSLPrefer)
		  pmPostgresSSLMode.AddRowAndTag("Require", PostgreSQLDatabase.SSLRequire)
		  pmPostgresSSLMode.AddRowAndTag("Verify CA", PostgreSQLDatabase.SSLVerifyCA)
		  pmPostgresSSLMode.AddRowAndTag("Verify FULL", PostgreSQLDatabase.SSLVerifyFull)
		  
		  ppAuthDirMode.Value = 1
		  
		  txtCipher.Enabled = false
		  txtCipher.Visible = false
		  
		  self.Height = 348
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private meType As DBEngine
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moConfig As ARProject.SSLConfiguration
	#tag EndProperty


#tag EndWindowCode

#tag Events ctlOK
	#tag Event
		Sub ClickedCancel()
		  // Indicate cancel
		  moConfig = nil
		  
		  // Close modal
		  self.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClickedOK()
		  select case meType
		  case DBEngine.MySQL
		    SaveMySQL
		    
		  case DBEngine.Postgres
		    SavePostgres
		    
		  case else
		    break
		    
		  end
		  
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrEnableCipher
	#tag Event
		Sub Action()
		  // Workaround to prevent macos from pre-selecting the field
		  txtCipher.ReadOnly = false
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
