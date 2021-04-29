#tag Window
Begin ContainerControl ccServerConnect
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   240
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
   Width           =   460
   Begin GroupBox gbServer
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Database Server"
      Enabled         =   True
      Height          =   176
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1
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
      Top             =   1
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   457
      Begin TextField txtUsername
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
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   127
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   102
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   311
      End
      Begin TextField txtPassword
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
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   129
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   True
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   136
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   309
      End
      Begin TextField txtDatabase
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
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   127
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   68
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   311
      End
      Begin TextField txtPort
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
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   373
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "3306"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   65
      End
      Begin TextField txtHost
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
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   127
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "localhost"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   197
      End
      Begin Label lblPort
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   323
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
         Text            =   "Port:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   35
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   38
      End
      Begin Label lblHost
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   9
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
         Text            =   "Host:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   106
      End
      Begin Label lblDBName
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   9
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
         Text            =   "Database:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   69
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   106
      End
      Begin Label lblUsername
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   9
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Username:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   103
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   106
      End
      Begin Label lblPassword
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gbServer"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Password:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   137
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   106
      End
   End
   Begin Canvas cvsSecureConnection
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   35
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   183
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   279
      Begin CheckBox chkUseSSL
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use SSL connection"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsSecureConnection"
         Italic          =   False
         Left            =   3
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
         Top             =   189
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   152
      End
      Begin WindowsButton btnConfigureSSL
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Configure"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsSecureConnection"
         Italic          =   False
         Left            =   166
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
         Top             =   189
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin WindowsButton btnTest
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Test"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   286
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   189
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin WindowsButton btnSave
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   378
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   189
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer tmrPasswordFocus
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
	#tag Method, Flags = &h21
		Private Sub CheckEnableConnect()
		  btnSave.Enabled = (txtUsername.Text <> "" and txtHost.Text <> "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleConnect()
		  if oProject = nil then
		    oProject = new DataFile.t_Project
		    
		    // Set default project name
		    oProject.sProjectName = txtDatabase.Text
		    
		  end
		  
		  oProject.eDBEngine = me.eType
		  oProject.sDatabaseHost = txtHost.Text
		  oProject.iDatabasePort = cdbl(txtPort.Text)
		  oProject.sDatabaseName = txtDatabase.Text
		  oProject.sDatabaseUsername = txtUsername.Text
		  oProject.sPassword = txtPassword.Text
		  
		  if chkUseSSL.Value = true and _
		    (me.eType = DBEngine.MySQL or me.eType = DBEngine.Postgres) then
		    oProject.oSSLConfig = moSSLConfig
		    
		  end
		  
		  // Test connect
		  var tsError as String
		  var toDB as Database = oProject.Connect(tsError)
		  
		  if toDB = nil then
		    MsgBox("Failed to Connect" + EndOfLine + EndOfLine + _
		    "Database connection failed. " + tsError)
		    
		  else
		    // Store the connected db
		    oProject.oProjectDB = toDB
		    
		    var toProj as new winProject
		    toProj.oProject = oProject
		    toProj.Load
		    toProj.Show
		    
		    RaiseEvent Connected
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTest()
		  var toConnect as new DataFile.t_Project
		  toConnect.eDBEngine = me.eType
		  toConnect.sDatabaseHost = txtHost.Text
		  toConnect.iDatabasePort = cdbl(txtPort.Text)
		  toConnect.sDatabaseName = txtDatabase.Text
		  toConnect.sDatabaseUsername = txtUsername.Text
		  toConnect.sPassword = txtPassword.Text
		  
		  if chkUseSSL.Value = true and _
		    (me.eType = DBEngine.MySQL or me.eType = DBEngine.Postgres) then
		    toConnect.oSSLConfig = moSSLConfig
		    
		  end
		  
		  // Test connect
		  var tsError as String
		  var toDB as Database = toConnect.Connect(tsError)
		  if toDB = nil then
		    MsgBox("Failed to Connect" + EndOfLine + EndOfLine + _
		    "Database connection failed. " + tsError)
		    
		  else
		    MsgBox("Success" + EndOfLine + EndOfLine + _
		    "Connection to the database was successful.")
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load()
		  me.eType = oProject.eDBEngine
		  
		  if me.eType = DBEngine.MySQL then
		    chkUseSSL.Value = (oProject.oSSLConfig <> nil)
		    
		  end
		  
		  txtHost.Text = oProject.sDatabaseHost
		  txtPort.Text = Format(oProject.iDatabasePort, "######")
		  txtDatabase.Text = oProject.sDatabaseName
		  txtUsername.Text = oProject.sDatabaseUsername
		  
		  tmrPasswordFocus.Mode = Timer.ModeSingle
		  tmrPasswordFocus.Reset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupUI()
		  var tsExisting as String = txtPort.Text.Trim
		  
		  // Change port if existing is default
		  if tsExisting = "" or tsExisting = "1433" or tsExisting = "3306" or _
		    tsExisting = "4430" or tsExisting = "5432" then
		    
		    select case eType
		    case DBEngine.CubeSQL
		      txtPort.Text = "4430"
		      
		    case DBEngine.MSSQL
		      txtPort.Text = "1433"
		      
		    case DBEngine.MySQL
		      txtPort.Text = "3306"
		      
		    case DBEngine.Postgres
		      txtPort.Text = "5432"
		      
		    end select
		    
		  end
		  
		  gbServer.Caption = eType.ToString
		  
		  // SSL support
		  var tbShowSSL as Boolean = (eType = DBEngine.MySQL or eType = DBEngine.Postgres)
		  cvsSecureConnection.Visible = tbShowSSL
		  chkUseSSL.Enabled = tbShowSSL
		  chkUseSSL.Visible = tbShowSSL
		  btnConfigureSSL.Enabled = chkUseSSL.Value
		  btnConfigureSSL.Visible = tbShowSSL
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Connected()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return meType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  meType = value
			  SetupUI
			End Set
		#tag EndSetter
		eType As DBEngine
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private meType As DBEngine
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moSSLConfig As ARProject.SSLConfiguration
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty


#tag EndWindowCode

#tag Events txtUsername
	#tag Event
		Sub TextChange()
		  CheckEnableConnect
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtHost
	#tag Event
		Sub TextChange()
		  CheckEnableConnect
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkUseSSL
	#tag Event
		Sub Action()
		  // Enable the configure button
		  btnConfigureSSL.Enabled = me.Value
		  
		  // Perform SSL Setup
		  if me.Value and me.Enabled and moSSLConfig = nil then
		    var oWin as new winSSLConfig
		    
		    // Get the config
		    select case self.eType
		    case DBEngine.MySQL
		      moSSLConfig = oWin.NewMySQL(self.TrueWindow)
		      
		    case DBEngine.Postgres
		      moSSLConfig = oWin.NewPostgres(self.TrueWindow)
		      
		    case else
		      raise new TPUnimplementedException(CurrentMethodName)
		      
		    end select
		    
		    // Check if user cancelled
		    if moSSLConfig = nil then
		      me.Value = false
		      
		    end
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnConfigureSSL
	#tag Event
		Sub Action()
		  var oWin as new winSSLConfig
		  
		  var oNewConfgig as ARProject.SSLConfiguration
		  
		  // Get the config
		  select case self.eType
		  case DBEngine.MySQL
		    oNewConfgig = oWin.EditMySQL(moSSLConfig, self.TrueWindow)
		    
		  case DBEngine.Postgres
		    oNewConfgig = oWin.EditPostgres(moSSLConfig, self.TrueWindow)
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		  // Check if user cancelled edting
		  if oNewConfgig = nil then return
		  
		  // Store the config changes
		  moSSLConfig = oNewConfgig
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnTest
	#tag Event
		Sub Action()
		  HandleTest
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSave
	#tag Event
		Sub Action()
		  HandleConnect
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrPasswordFocus
	#tag Event
		Sub Action()
		  txtPassword.SetFocus
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
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
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
		Name="LockRight"
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
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
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="eType"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="DBEngine"
		EditorType="Enum"
		#tag EnumValues
			"0 - Unknown"
			"1 - CubeSQL"
			"2 - MSSQL"
			"3 - MySQL"
			"4 - ODBC"
			"5 - Postgres"
			"6 - SQLite"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
