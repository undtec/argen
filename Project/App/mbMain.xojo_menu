#tag Menu
Begin Menu mbMain
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&File"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Edit"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Undo"
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Index = -2147483648
         Text = "Cu&t"
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Copy"
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Paste"
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kEditClear"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Index = -2147483648
         Text = "Select &All"
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin PrefsMenuItem EditPreferences
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kPrefs"
         ShortcutKey = "#App.kPrefsShortCut"
         Shortcut = "Cmd+#App.kPrefsShortCut"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ProjectMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Project"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem ProjectNewProject
         SpecialMenu = 0
         Index = -2147483648
         Text = "New Project"
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ProjectProjectEdit
         SpecialMenu = 0
         Index = -2147483648
         Text = "Edit Project"
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnabled = False
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem ProjectProjectDelete
         SpecialMenu = 0
         Index = -2147483648
         Text = "Delete Project"
         ShortcutKey = "DEL"
         Shortcut = "Cmd+DEL"
         MenuModifier = True
         AutoEnabled = False
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ProjectProjectRefresh
         SpecialMenu = 0
         Index = -2147483648
         Text = "Rescan Schema"
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnabled = False
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem ProjectProjectGenerate
         SpecialMenu = 0
         Index = -2147483648
         Text = "Generate"
         ShortcutKey = "G"
         Shortcut = "Cmd+G"
         MenuModifier = True
         AutoEnabled = False
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ProjectSave
         SpecialMenu = 0
         Index = -2147483648
         Text = "Save Project"
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnabled = False
         AutoEnable = False
         Visible = True
      End
   End
   Begin MenuItem WindowMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Window"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem WindowClose
         SpecialMenu = 0
         Index = -2147483648
         Text = "Close"
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowMinimize
         SpecialMenu = 0
         Index = -2147483648
         Text = "Minimize"
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowZoom
         SpecialMenu = 0
         Index = -2147483648
         Text = "Zoom"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowProjectList
         SpecialMenu = 0
         Index = -2147483648
         Text = "Project List"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Help"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin AppleMenuItem HelpAboutARGen
         SpecialMenu = 0
         Index = -2147483648
         Text = "About ARGen"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpUsersGuide
         SpecialMenu = 0
         Index = -2147483648
         Text = "Users Guide"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpWebsite
         SpecialMenu = 0
         Index = -2147483648
         Text = "Open Website"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ApplicationMenuItem ApplicationSeparator
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin AppleMenuItem HelpCheckForUpdates
         SpecialMenu = 0
         Index = -2147483648
         Text = "Check For Updates"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem OfficialEndHelpDivider
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
