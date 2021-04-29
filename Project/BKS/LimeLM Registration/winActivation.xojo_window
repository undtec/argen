#tag Window
Begin Window winActivation
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   342
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1113189676
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "Please Activate this Software"
   Visible         =   False
   Width           =   513
   Begin PagePanel pp
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   283
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelCount      =   6
      Panels          =   ""
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   1
      Visible         =   True
      Width           =   513
      Begin Label stHeader
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   106
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "<<product_name>>"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   369
      End
      Begin Label stExplanation
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   106
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "<<explanation>"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   42
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   387
      End
      Begin PushButton pbActivate
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Activate"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   382
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   109
      End
      Begin Label lblKey
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   45
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Product Key:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   113
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   112
      End
      Begin TextField efRegCode
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFF00FF
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
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   169
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   113
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   322
      End
      Begin PushButton btnActivate
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Activate"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   165
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   211
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin PushButton pbActivateLater
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Activate Later"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   165
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   243
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin Label stSuccess
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "Activation was successful"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   455
      End
      Begin Label stSuccessExplanation
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   115
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "Activation helps verify that your copy of <<product_name>> is genuine. With a genuine copy of <<product_name>> you are eligible to receive all free updates and product support from BKeeney Software Inc."
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   473
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Connection Failed"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   455
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "Activate Manually"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   205
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Extend the Trial"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   376
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   39
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   96
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Please enter the product key below. Your product key should look something like the following:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   395
      End
      Begin Label Label5
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   169
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Example Product Key:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   55
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   189
      End
      Begin Label Label6
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   169
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   81
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   322
      End
      Begin PushButton pbRetryActivation
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Retry Activation"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   54
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   155
      End
      Begin PushButton pbActivateManually
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Activate Manually"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   54
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   156
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   155
      End
      Begin Label stSuccessExplanation1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   54
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Activation failed because of a problem connecting to the activation server. Please check your internet connection and try again or activate manually."
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   473
      End
      Begin Label Label7
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "Step 1:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
      Begin PushButton pbCreateRequestFile
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Create Request File"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   91
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   174
      End
      Begin Label Label8
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "Step 2: Send request file to support@bkeeney.com"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   83
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   405
      End
      Begin TextArea efExtendTrial
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFF00FF
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   152
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
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
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   462
      End
      Begin Label Label9
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Please enter the key that you received to extend your trial:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   462
      End
      Begin PushButton pbExtendTrial
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Extend Trial"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   342
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   242
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
      Begin Label Label10
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "Step 3: Once you receive a response file, click below to activate:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   115
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   471
      End
      Begin PushButton pbActivateFromFile
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Activate from Response File"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   91
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   266
      End
      Begin Label stDealerContact1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   66
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   106
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "While not activated, ARGen will only generate two ActiveRecord classes and not generate any user interface.  Click the button below to purchase."
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   98
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   387
      End
      Begin Label stDealerContact2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   42
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   27
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "If you don't have a product key please purchase one using the button below:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   179
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   473
      End
      Begin canvas appIcon1
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   64
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   64
      End
      Begin canvas appIcon
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   64
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   14
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   64
      End
      Begin PushButton btnPurchase
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Purchase"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   165
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   179
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin PushButton btnPurchase1
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Purchase"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pp"
         Italic          =   False
         Left            =   169
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
   End
   Begin PushButton pbCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Use Free Version"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   139
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   130
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   2
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   288
      Transparent     =   False
      Visible         =   True
      Width           =   473
   End
   Begin PushButton pbPrevious
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "< Back"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   281
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton pbFinish
      AutoDeactivate  =   False
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Finish"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   391
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Xojo.Net.HTTPSocket oUpgradeSock
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   1
      TabPanelIndex   =   0
      ValidateCertificates=   False
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CheckCanUpgrade()
		  // Old ARGen 2.x GUID
		  dim sOldKey as String = modTA.KeyForGUID("98378b25797bc88bd5e50.79251551")
		  
		  if trim(sOldKey) = "" then return
		  
		  sOldKey = DefineEncoding(sOldKey, Encodings.UTF8)
		  
		  dim txURL as Text = "https://bkeeney.com/argen/upgrade.php?key=" + sOldKey.ToText
		  
		  oUpgradeSock.Send("GET", txURL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Display(iTrialRemaining as integer, bAnalyze as Boolean)
		  dim sMessage as string
		  
		  if Keyboard.AsyncShiftKey then
		    'simulate expired trial
		    m_bExtendTrial = true
		    iTrialRemaining = 0
		  end if
		  
		  if iTrialRemaining = 0 then
		    if m_bExtendTrial then
		      pbActivateLater.Visible = true
		      pbActivateLater.Caption = "Extend Trial"
		    else
		      pbActivateLater.Visible = false
		    end if
		    
		    sMessage = "<<product_name>> has limited functionality when it is not activated.  Either purchase a license or activate to enable all features."
		  elseif iTrialRemaining = 1 then
		    sMessage = "You will need to activate today to continue using <<product_name>>."
		  else
		    sMessage = "You will need to activate in the next <<count>> days to continue using <<product_name>>."
		  end if
		  
		  self.Title = "ARGen Activation"
		  stHeader.Text = "ARGen"
		  
		  stExplanation.Text = FormatMessage(sMessage, iTrialRemaining)
		  stSuccessExplanation.Text = FormatMessage(stSuccessExplanation.Text, iTrialRemaining)
		  
		  
		  m_iTrialRemaining = iTrialRemaining
		  
		  'center this window with respect to the main screen
		  self.Left = (Screen(0).Width - self.Width) /2
		  // self.Top = (Screen(0).height - self.Height) /2
		  
		  // Start the asynchronous upgrade socket
		  CheckCanUpgrade
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatMessage(s as String, iTrialRemaining as integer) As string
		  s = s.ReplaceAll("<<count>>", Str(iTrialRemaining))
		  
		  s = s.ReplaceAll("<<product_name>>", "ARGen")
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCodeFromClipboard() As string
		  'extract code from the clipboard if it's available
		  dim cb as new Clipboard
		  dim sText as string
		  if cb.TextAvailable then
		    sText = cb.Text
		  end if
		  cb.Close
		  
		  if sText="" then
		    return ""
		  end if
		  
		  'check the text for something that looks like a registration code
		  'or trial extension
		  dim rx as new RegEx
		  rx.SearchPattern = "([A-Z0-9]{4}-){6}[A-Z0-9]{4}"
		  dim rm as RegExMatch = rx.Search(sText)
		  if rm=nil then
		    return ""
		  end if
		  
		  return rm.SubExpressionString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePurchase()
		  if mbCanUpgrade = true then
		    ShowURL(kPurchaseUpgrade)
		    
		  else
		    ShowURL(kPurchase)
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ApplicationIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ApplicationName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Cancelled As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbCanUpgrade As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_bExtendTrial As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_iTrialRemaining As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_sRegCode As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_sRegCode
			End Get
		#tag EndGetter
		RegCode As String
	#tag EndComputedProperty


	#tag Constant, Name = kPanelActivateManually, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPanelActivateOnline, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPanelConnectionFailed, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPanelExtendTrial, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPanelSuccess, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPurchase, Type = String, Dynamic = False, Default = \"https://sites.fastspring.com/bkeeney/product/argen30mac", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"https://sites.fastspring.com/bkeeney/product/argen30mac"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"https://sites.fastspring.com/bkeeney/product/argen30windows"
	#tag EndConstant

	#tag Constant, Name = kPurchaseUpgrade, Type = String, Dynamic = False, Default = \"https://sites.fastspring.com/bkeeney/product/argen30mac", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"https://sites.fastspring.com/bkeeney/product/argen30mac&coupon\x3DARG3MAC"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"https://sites.fastspring.com/bkeeney/product/argen30windows&coupon\x3DARG3WIN"
	#tag EndConstant


#tag EndWindowCode

#tag Events pp
	#tag Event
		Sub Change()
		  pbPrevious.Enabled = (pp.Value<>0) and (pp.Value<>kPanelSuccess)
		  pbFinish.Enabled = (pp.Value = kPanelSuccess)
		  
		  select case pp.Value
		  case kPanelActivateOnline
		    efRegCode.SetFocus
		    if efRegCode.Text="" then
		      efRegCode.Text = GetCodeFromClipboard
		    end if
		    efRegCode.SelectAll
		  case kPanelExtendTrial
		    efExtendTrial.SetFocus
		    if efExtendTrial.Text="" then
		      efExtendTrial.Text = GetCodeFromClipboard
		    end if
		    efExtendTrial.SelectAll
		  end select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbActivate
	#tag Event
		Sub Action()
		  dim sRegCode as String = Trim(efRegCode.Text)
		  if sRegCode = "" then
		    MessageBox("Missing Product Key", "Please enter the product key.")
		    efRegCode.SetFocus
		    
		    return
		    
		  end
		  
		  dim rc as Integer = TurboActivate.CheckAndSavePKey(sRegCode, TurboActivate.TA_SYSTEM)
		  if rc = TurboActivate.TA_E_PERMISSION then
		    rc = TurboActivate.CheckAndSavePKey(sRegCode, TurboActivate.TA_USER)
		    
		  end
		  
		  if rc <> TurboActivate.TA_OK then
		    // Attempt to handle the response
		    if rc <> TurboActivate.TA_E_ALREADY_ACTIVATED then
		      // Error with the key, not already activated error
		      dim sMsg as String = TurboActivate.HumanMessage(rc)
		      MessageBox("Error", "An error occurred while trying to activate (" + str(rc) + ": " + sMsg + ").")
		      
		    else
		      // Already activated error, deactivate and try again
		      try
		        TurboActivate.Deactivate(true)
		        pbActivate.Push
		        
		      catch e as TurboActivate.TurboActivateException
		        // Something happend with deactivating
		        MessageBox("Activation Error", "Machine is already activated and the automatic reactivation procedure failed. " + e.Message)
		        
		      end try
		      
		    end
		    
		    // Response was not OK, bail
		    return
		    
		  end
		  
		  
		  // Activate
		  rc = TurboActivate.Activate
		  
		  if rc=TurboActivate.TA_OK then
		    pp.Value = kPanelSuccess
		    
		  elseif rc=TurboActivate.TA_E_INET then
		    pp.Value = kPanelConnectionFailed
		    
		  elseif rc=TurboActivate.TA_E_REVOKED then
		    MessageBox("Invalid Product Key", "The application was unable to activate. The product key does not appear to be valid.")
		    
		  else
		    MessageBox("Error", "The application was unable to activate (" + Str(rc) + ").")
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events efRegCode
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  dim cb as new Clipboard
		  dim mi as new MenuItem("Paste", 1)
		  mi.Enabled = cb.TextAvailable
		  base.Append(mi)
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem.Tag=1 then
		    me.Paste
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnActivate
	#tag Event
		Sub Action()
		  pp.Value = kPanelActivateOnline
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbActivateLater
	#tag Event
		Sub Action()
		  if m_iTrialRemaining=0 then
		    pp.Value = kPanelExtendTrial
		  else
		    self.Close
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRetryActivation
	#tag Event
		Sub Action()
		  pp.Value = kPanelActivateOnline
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbActivateManually
	#tag Event
		Sub Action()
		  pp.Value = kPanelActivateManually
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCreateRequestFile
	#tag Event
		Sub Action()
		  dim sFile as string
		  
		  sFile = "ARGen Activation Request"
		  
		  dim f as FolderItem = GetSaveFolderItem( "", sFile )
		  if f=nil then
		    return
		  end if
		  
		  dim rc as integer
		  rc = TurboActivate.ActivationRequestToFile( f )
		  if rc<>TurboActivate.TA_OK then
		    MessageBox "Warning", "Unable to create the request file (" + Str(rc) + ")"
		    return
		  end if
		  
		  f = GetFolderItem( f.AbsolutePath )
		  if f<>nil then
		    f.ShowOnDisk
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events efExtendTrial
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  dim cb as new Clipboard
		  dim mi as new MenuItem("Paste", 1)
		  mi.Enabled = cb.TextAvailable
		  base.Append(mi)
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem.Tag=1 then
		    me.Paste
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbExtendTrial
	#tag Event
		Sub Action()
		  dim sExtendTrial as string = efExtendTrial.Text
		  if sExtendTrial="" then
		    'MsgBox "Please enter the code you received to extend your trial"
		    MessageBox "Missing Trial Code", "Please enter the code you received to extend your trial"
		    return
		  end if
		  
		  break
		  ' #if mConfig.kLimeLM
		  ' dim rc as integer
		  ' rc = TurboActivate.ExtendTrial( sExtendTrial )
		  ' if rc=TurboActivate.TA_OK then
		  ' 
		  ' dim iDaysRemaining as integer
		  ' 
		  ' call TurboActivate.TrialDaysRemaining( mConfig.kLimeLM_ARGenGUID, iDaysRemaining )
		  ' 
		  ' 
		  ' 
		  ' dim sMsg as string
		  ' if iDaysRemaining=1 then
		  ' sMsg = "There is 1 day remaining in your trial"
		  ' else
		  ' sMsg = "There are " + Str(iDaysRemaining) + " days remaining in your trial"
		  ' end if
		  ' 
		  ' MsgBox sMsg
		  ' self.Close
		  ' 
		  ' elseif rc=TurboActivate.TA_E_TRIAL_EUSED then
		  ' MsgBox "The trial extension has already been used"
		  ' elseif rc=TurboActivate.TA_E_TRIAL_EEXP then
		  ' MsgBox "The trial extension has expired"
		  ' else
		  ' MsgBox "An error occurred while trying to extend the trial (" + Str(rc) + ")"
		  ' end if
		  ' #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbActivateFromFile
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem = GetOpenFolderItem("")
		  if f=nil or not f.Exists then
		    return
		  end if
		  
		  try
		    if TurboActivate.ActivateFromFile(f) = true then
		      dim dtNow as new date
		      Preferences.StringValue( "ActivationCheck" ) = dtNow.SQLDate
		      pp.Value = kPanelSuccess
		      
		    end
		    
		  catch
		    'MsgBox "Unable to activate from the file"
		    MessageBox "Warning", "Unable to activate from the file"
		    return
		    
		  end try
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events appIcon1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture picAppIcon, 0, 0, g.width, g.Height, 0, 0, picAppIcon.Width, picAppIcon.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events appIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture picAppIcon, 0, 0, g.width, g.Height, 0, 0, picAppIcon.Width, picAppIcon.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPurchase
	#tag Event
		Sub Action()
		  HandlePurchase
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPurchase1
	#tag Event
		Sub Action()
		  HandlePurchase
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCancel
	#tag Event
		Sub Action()
		  Cancelled = true
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbPrevious
	#tag Event
		Sub Action()
		  if pp.Value=kPanelConnectionFailed then
		    pp.Value = kPanelActivateOnline
		  else
		    pp.Value = 0
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbFinish
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events oUpgradeSock
	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  #pragma unused URL
		  if HTTPStatus <> 200 then return
		  
		  dim mbTemp as MemoryBlock = Content.Data
		  dim mbStr as new MemoryBlock(Content.Size)
		  
		  try
		    mbStr.StringValue(0, mbStr.size) = mbTemp.StringValue(0, mbStr.Size)
		    
		  catch OutOfBoundsException
		    // No value
		    
		  end
		  
		  dim sResponse as String = mbStr
		  sResponse = DefineEncoding(sResponse, Encodings.UTF8)
		  
		  // Website responded with yes we can upgrade
		  mbCanUpgrade = (sResponse = "true")
		  
		  if mbCanUpgrade = true then
		    MsgBox("Upgrade Discount!" + EndOfLine + EndOfLine + _
		    "A valid ARGen 2 license was found, as a thank you to loyal customers we're offering a great discount! " + _
		    "Click the ""Purchase"" button to get your discount.")
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ApplicationIcon"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ApplicationName"
		Group="Behavior"
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Cancelled"
		Group="Behavior"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
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
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="RegCode"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
