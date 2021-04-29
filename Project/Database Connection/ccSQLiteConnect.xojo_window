#tag Window
Begin ContainerControl ccSQLiteConnect
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   180
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
   Begin Canvas cvsDrop
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   145
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   460
      Begin GroupBox gbSQLite
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "SQLite Database"
         Enabled         =   True
         Height          =   140
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsDrop"
         Italic          =   False
         Left            =   1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   6
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
         Begin WindowsButton btnReveal
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   0
            Cancel          =   False
            Caption         =   "Reveal"
            Default         =   False
            Enabled         =   False
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "gbSQLite"
            Italic          =   False
            Left            =   363
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
            Top             =   -50
            Transparent     =   False
            Underline       =   False
            Visible         =   False
            Width           =   80
         End
         Begin WindowsButton btnSelect
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   0
            Cancel          =   False
            Caption         =   "Select…"
            Default         =   False
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "gbSQLite"
            Italic          =   False
            Left            =   363
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
            Top             =   30
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   80
         End
         Begin Label lblDatabaseFile
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "gbSQLite"
            Italic          =   False
            Left            =   1
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
            Text            =   "Database File:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   30
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   110
         End
         Begin Label lblFile
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   58
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "gbSQLite"
            Italic          =   True
            Left            =   123
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   2
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "None Selected"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   12.0
            TextUnit        =   0
            Top             =   32
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   228
         End
         Begin Label lblKey
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "gbSQLite"
            Italic          =   False
            Left            =   1
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   2
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Encryption Key:"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   102
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   110
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
            InitialParent   =   "gbSQLite"
            Italic          =   False
            Left            =   123
            LimitText       =   0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Mask            =   ""
            Password        =   True
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
            Top             =   101
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   320
         End
      End
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
      Top             =   153
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
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
      Top             =   153
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
	#tag Event
		Sub Open()
		  ShowKey(false)
		  ShowReveal(false)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckEnableConnect()
		  btnSave.Enabled = (mfDatabase <> nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleConnect()
		  if oProject = nil then
		    oProject = new DataFile.t_Project
		    
		    // Set default project name
		    oProject.sProjectName = mfDatabase.NameWithoutExtension
		    
		  end
		  
		  oProject.eDBEngine = DBEngine.SQLite
		  oProject.fDatabase = mfDatabase
		  
		  if txtPassword.Visible = true then
		    oProject.bDatabaseEncrypted = true
		    oProject.sPassword = txtPassword.Text
		    
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
		  toConnect.eDBEngine = DBEngine.SQLite
		  toConnect.fDatabase = mfDatabase
		  
		  if txtPassword.Visible = true then
		    toConnect.bDatabaseEncrypted = true
		    toConnect.sPassword = txtPassword.Text
		    
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
		  SelectFile(oProject.fDatabase)
		  ShowReveal(true)
		  
		  tmrPasswordFocus.Mode = Timer.ModeSingle
		  tmrPasswordFocus.Reset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectFile(tfSel as FolderItem)
		  // FolderItem selected or dropped, process
		  if tfSel = nil then return
		  mfDatabase = tfSel
		  
		  // Set path
		  lblFile.Text = mfDatabase.NativePath
		  
		  // Changed file, clear password
		  txtPassword.Text = ""
		  
		  CheckEnableConnect
		  
		  try
		    // Attempt a connection and show encryption field if it fails
		    // This is a quick and easy way to improve the UX
		    var dbTest as new SQLiteDatabase
		    dbTest.DatabaseFile = mfDatabase
		    
		    var tbConnect as Boolean = dbTest.Connect
		    ShowKey(not tbConnect)
		    
		    dbTest.Close
		    dbTest = nil
		    
		  catch e as RuntimeException
		    // Shrug it off, it's a simple test
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowKey(bVal as Boolean)
		  btnTest.Enabled = bVal
		  btnTest.Visible = bVal
		  
		  lblKey.Visible = bVal
		  
		  txtPassword.Enabled = bVal
		  txtPassword.Visible = bVal
		  
		  if bVal = true then
		    tmrPasswordFocus.Mode = Timer.ModeSingle
		    tmrPasswordFocus.Reset
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowReveal(tbReveal as Boolean)
		  if tbReveal = true then
		    btnReveal.Enabled = true
		    btnReveal.Top = btnSelect.Top
		    btnReveal.Visible = true
		    
		    btnSelect.Visible = false
		    
		  else
		    btnReveal.Enabled = false
		    btnReveal.Top = -50
		    btnReveal.Visible = false
		    
		    btnSelect.Visible = true
		    
		  end
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Connected()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mbDragging As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfDatabase As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		oProject As DataFile.t_Project
	#tag EndProperty


#tag EndWindowCode

#tag Events cvsDrop
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  
		  if mbDragging = true then
		    g.ForeColor = HighlightColor
		    g.PenWidth = 3
		    g.DrawRoundRect(2, 2, g.Width - 4, g.Height - g.PenWidth, 2, 2)
		    
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma unused action
		  mbDragging = false
		  me.Invalidate
		  
		  // Handle drop
		  if obj.FolderItemAvailable = true then
		    SelectFile(obj.FolderItem)
		    
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  #pragma unused obj
		  #pragma unused action
		  
		  mbDragging = false
		  me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  #pragma unused action
		  
		  mbDragging = (obj <> nil and obj.FolderItemAvailable and obj.FolderItem <> nil)
		  me.Invalidate
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AcceptFileDrop("????")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReveal
	#tag Event
		Sub Action()
		  if mfDatabase <> nil and mfDatabase.Exists then
		    mfDatabase.ShowOnDisk
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSelect
	#tag Event
		Sub Action()
		  var toOpen as new OpenDialog
		  toOpen.PromptText = "Select SQLite Database"
		  
		  var tfSel as FolderItem = toOpen.ShowModal
		  if tfSel <> nil then
		    SelectFile(tfSel)
		    
		  end
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
#tag Events btnTest
	#tag Event
		Sub Action()
		  HandleTest
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
#tag EndViewBehavior
