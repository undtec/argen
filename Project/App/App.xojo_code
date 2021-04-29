#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  try
		    DB.Close
		    
		  catch
		    
		  end try
		End Sub
	#tag EndEvent

	#tag Event
		Sub NewDocument()
		  winProjectList.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Register plugins
		  if SetupPlugins = false then
		    App.Terminate
		    return
		    
		  end
		  
		  // Setup platform specific needs
		  DisableMacosTabs
		  SetupWindowMenu
		  
		  // Load preferences
		  SetupSettings
		  
		  // Connect to the main database
		  if SetupMainConnection = false then
		    App.Terminate
		    return
		    
		  end
		  // Now that this is all done, AutoQuit=true
		  App.AutoQuit = TargetWindows
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditPreferences() As Boolean Handles EditPreferences.Action
			winPrefs.show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAboutARGen() As Boolean Handles HelpAboutARGen.Action
			winAbout.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpUsersGuide() As Boolean Handles HelpUsersGuide.Action
			var fHelp as FolderItem = SpecialFolder.Resources.Child("Help Book").Child("index.html")
			
			if fHelp <> nil and fHelp.Exists = true then
			#if TargetMacOS then
			// What opens websites?
			var tsAppPath as String = NSWorkspaceMBS.URLForApplicationToOpenURL("https://strawberrysw.com")
			
			// Strip file://
			tsAppPath = tsAppPath.Right(tsAppPath.Len - 7)
			
			// Get bundle
			var toBundle as NSBundleMBS = NSBundleMBS.bundleWithPath(tsAppPath)
			if toBundle <> nil then
			if NSWorkspaceMBS.openURL(fHelp.URLPath, toBundle.bundleIdentifier) then
			// Success!
			return true
			
			end
			
			end
			
			#endif
			
			fHelp.Launch
			
			else
			// Could not find built in help, revert to website.
			MsgBox("Help Not Available")
			
			end
			
			return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpWebsite() As Boolean Handles HelpWebsite.Action
			ShowURL("https://strawberrysw.com/argen")
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowProjectList() As Boolean Handles WindowProjectList.Action
			winProjectList.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function BuildDateTime() As DateTime
		  // Manually set the build date so that changing the 
		  // modification date doesn't circumvent the DRM
		  const kYear  = 2021
		  const kMonth = 04
		  const kDay   = 02
		  
		  #if DebugBuild then
		    return DateTime.Now
		    return new DateTime(1970, 01, 01)
		    
		  #else
		    return new DateTime(kYear, kMonth, kDay)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataFolder() As FolderItem
		  // App Support folder
		  static sIdentifier as String = "com.strawberrysw.argen"
		  
		  #if TargetMacOS then
		    return SpecialFolder.ApplicationData.Child(sIdentifier)
		    
		  #elseif TargetWin32 then
		    return SpecialFolder.ApplicationData.Child(sIdentifier)
		    
		  #elseif TargetLinux then
		    return SpecialFolder.ApplicationData.Child("." + sIdentifier)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisableMacosTabs()
		  // https://forum.xojo.com/conversation/post/396640 source
		  
		  #if TargetCocoa then
		    Declare Function NSClassFromString Lib "Cocoa" (s As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (s As CFStringRef) As Ptr
		    Declare Sub setAllowsAutomaticWindowTabbing Lib "Cocoa" selector "setAllowsAutomaticWindowTabbing:" (cls As Ptr, ena As Boolean)
		    Declare Function respondsToSelector Lib "Cocoa" selector "respondsToSelector:" (p As Ptr, sel As Ptr) As Boolean
		    
		    var nswCls As Ptr = NSClassFromString ("NSWindow")
		    if respondsToSelector (nswCls, NSSelectorFromString ("setAllowsAutomaticWindowTabbing:")) then
		      setAllowsAutomaticWindowTabbing (nswCls, False)
		      
		    end
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RegisterPlugins() As Boolean
		  // Check MBS plugin version against the obfuscated key
		  #if  BuildConstantsMBS.Year > 2022 or _
		    (BuildConstantsMBS.Year = 2022 and BuildConstantsMBS.Month > 11) then
		    #pragma Error "Active MBS Plugins are newer than this license key."
		    
		  #endif
		  
		  // Don't register in debug
		  #if DebugBuild then
		    return true
		    
		  #endif
		  
		  var sName as String
		  var sProd as String
		  var sCode as String
		  
		  if RegisterMBSPlugin(sName, sProd, 202211, sCode) = true then
		    return true
		    
		  else
		    return false
		    
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetupMainConnection() As Boolean
		  // Connect to main database
		  // Return false to quit
		  DataFile.OpenDB
		  
		  if DataFile.DB = nil then
		    MsgBox("Initialization Error" + EndOfLine + EndOfLine + _
		    "Could not connect to the central data storage.")
		    App.Terminate
		    return false
		    
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetupPlugins() As Boolean
		  // Register plugins, or offer download
		  // Return false to quit
		  if RegisterPlugins = true then return true
		  
		  var md as new MessageDialog
		  md.Message = "Critical Error"
		  md.Explanation = "Failed to activate required libraries. " + _
		  "Please download the latest version of ARGen from Strawberry Software."
		  
		  md.ActionButton.Caption = "Visit Website"
		  md.CancelButton.Visible = true
		  
		  if md.ShowModal = md.ActionButton then
		    ShowURL("https://strawberrysw.com/argen")
		    
		  end
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupSettings()
		  // Create the app dir if needed
		  if App.DataFolder.Exists = false then
		    App.DataFolder.CreateAsFolder
		    
		  end
		  
		  TPSettings.Load
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupWindowMenu()
		  #if TargetMacOS then
		    // Set the Window menu
		    var oNSMenuItemMaster as new NSMenuItemMBS(mbMain.Handle(MenuItem.HandleType.CocoaNSMenuItem))
		    var mnuMain as NSMenuMBS = oNSMenuItemMaster.submenu
		    
		    var iMax as Integer = mnuMain.numberOfItems - 1
		    for i as Integer = 0 to iMax
		      var oThisItem as NSMenuItemMBS = mnuMain.Item(i)
		      if oThisItem.Title = "Window" and oThisItem.hasSubmenu = true then
		        var mnuWindow as NSMenuMBS = oThisItem.submenu
		        if mnuWindow <> nil then
		          NSApplicationMBS.sharedApplication.windowsMenu = mnuWindow
		          
		        end
		        
		        exit for i
		        
		      end
		      
		    next i
		    
		    // File menu is empty, Quit is in the App menu
		    mbMain.Child("FileMenu").Close
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Terminate()
		  #if TargetMacOS then
		    declare function NSClassFromString lib "Cocoa" (aClassName as CFStringRef) as Integer
		    declare function sharedApplication lib "Cocoa" selector "sharedApplication" (classRef as Integer) as Integer
		    declare sub terminate lib "Cocoa" selector "terminate:" (appRef as Integer, sender as Integer)
		    
		    var iPID as Integer = sharedApplication(NSClassFromString("NSApplication"))
		    terminate(iPID, iPID)
		    
		  #else
		    Quit
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionString() As String
		  var sVersion as String = Str(App.MajorVersion) + "." + _
		  Str(App.MinorVersion) + "." + _
		  Str(App.BugVersion) + "." + _
		  Str(App.NonReleaseVersion)
		  
		  return sVersion
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kPrefs, Type = String, Dynamic = False, Default = \"Preferences...", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Options"
	#tag EndConstant

	#tag Constant, Name = kPrefsShortCut, Type = String, Dynamic = False, Default = \"\x2C", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"H"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
