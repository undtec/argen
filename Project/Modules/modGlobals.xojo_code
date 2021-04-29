#tag Module
Protected Module modGlobals
	#tag Method, Flags = &h0
		Sub AddItemAndTag(extends base as MenuItem, sText as String, Tag as Variant)
		  base.Append(New MenuItem(sText))
		  base.Item(base.Count - 1).Tag = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRowAndTag(extends tlb as Listbox, tsRow as String, tvTag as Variant)
		  tlb.AddRow(tsRow)
		  tlb.RowTag(tlb.LastIndex) = tvTag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRowAndTag(extends pm as PopupMenu, Text as String, Tag as Variant)
		  pm.AddRow Text
		  pm.RowTag(pm.ListCount-1) = Tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTriangle(extends lst as Listbox, g as Graphics, bSelected as Boolean = false)
		  #pragma unused lst
		  
		  // Settings
		  const kPadding = 5
		  
		  // Get Original ForeColor
		  var c as Color = g.ForeColor
		  
		  // Draw an arrow to indicate that clicking this field will
		  g.ForeColor = &c8c8c8c
		  if bSelected then g.ForeColor = &cffffff
		  
		  // Points for a triangle on the right side of the cell
		  var points(6) As Integer
		  points(1) = g.Width - 16
		  points(2) = kPadding + ((g.Height - 16) / 2)
		  
		  points(3) = g.Width - 6
		  points(4) = kPadding + ((g.Height - 16) / 2)
		  
		  points(5) = g.Width - 11
		  points(6) = 12 + ((g.Height - 16) / 2)
		  
		  g.FillPolygon(points)
		  
		  g.ForeColor = c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EngineClassName(extends teType as DBEngine) As String
		  select case teType
		  case DBEngine.CubeSQL
		    return "CubeSQLServer"
		    
		  case DBEngine.MSSQL
		    return "MSSQLServerDatabase"
		    
		  case DBEngine.MySQL
		    return "MySQLCommunityServer"
		    
		  case DBEngine.ODBC
		    return "ODBCDatabase"
		    
		  case DBEngine.Postgres
		    return "PostgreSQLDatabase"
		    
		  case DBEngine.SQLite
		    return "SQLiteDatabase"
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ForceQuit()
		  #If TargetWin32 Then
		    Declare Sub ExitProcess Lib "Kernel32" ( code as Integer )
		    ExitProcess( 0 )
		  #ElseIf TargetMacOS Then
		    Declare Sub ExitToShell Lib "Carbon.framework" ()
		    ExitToShell()
		  #ElseIf TargetLinux Then
		    Soft Declare Sub my_exit Lib "LibC" Alias "exit" ( code as Integer )
		    my_exit(0)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateControlName(tsBase as String, eUIType as ARProject.UIType) As String
		  var tbPrefix as Boolean = TPSettings.Get("kUIPrefixes", true)
		  
		  select case eUIType
		  case ARProject.UIType.None
		    return tsBase
		    
		  case ARProject.UIType.ControlButton
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  case ARProject.UIType.ControlCheckbox
		    if tbPrefix then
		      return TPSettings.Get("kCheckbox", "chk") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kCheckboxSuffix", "Checkbox")
		      
		    end
		    
		  case ARProject.UIType.ControlContainer
		    if tbPrefix then
		      return TPSettings.Get("kContainerInstance", "ctl") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kContainerInstanceSuffix", "Control")
		      
		    end
		    
		  case ARProject.UIType.ControlLabel
		    if tbPrefix then
		      return TPSettings.Get("kLabel", "lbl") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kLabelSuffix", "Label")
		      
		    end
		    
		  case ARProject.UIType.ControlListbox
		    if tbPrefix then
		      return TPSettings.Get("Listbox", "lb") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kListboxSuffix", "List")
		      
		    end
		    
		  case ARProject.UIType.ControlPassword
		    if tbPrefix then
		      return TPSettings.Get("kPasswordField", "txt") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kPasswordFieldSuffix", "Password")
		      
		    end
		    
		  case ARProject.UIType.ControlPopupMenu
		    if tbPrefix then
		      return TPSettings.Get("kPopup", "pm") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kPopupSuffix", "Popup")
		      
		    end
		    
		  case ARProject.UIType.ControlTextArea
		    if tbPrefix then
		      return TPSettings.Get("kTextArea", "txt") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kTextAreaSuffix", "TextArea")
		      
		    end
		    
		  case ARProject.UIType.ControlTextField
		    if tbPrefix then
		      return TPSettings.Get("kTextField", "txt") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kTextFieldSuffix", "TextField")
		      
		    end
		    
		  case ARProject.UIType.DisplayContainer
		    if tbPrefix then
		      return TPSettings.Get("kContainer", "cc") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kContainerSuffix", "Container")
		      
		    end
		    
		  case ARProject.UIType.DisplayWindow
		    if tbPrefix then
		      return TPSettings.Get("kWindow", "win") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kWindowSuffix", "Window")
		      
		    end
		    
		  case ARProject.UIType.DisplayWebDialog
		    if tbPrefix then
		      return TPSettings.Get("kDialog", "dlg") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kDialogSuffix", "Dialog")
		      
		    end
		    
		  case ARProject.UIType.DisplayWebPage
		    if tbPrefix then
		      return TPSettings.Get("kPage", "pg") + tsBase
		      
		    else
		      return tsBase + TPSettings.Get("kPageSuffix", "Page")
		      
		    end
		    
		  case ARProject.UIType.Unknown
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID(extends pm as PopupMenu) As Integer
		  if pm.ListIndex = -1 then return 0
		  
		  if pm.RowTag(pm.ListIndex) isa DataFile.ActiveRecordBase then
		    var id as integer = DataFile.ActiveRecordBase(pm.rowtag(pm.ListIndex)).id
		    return id
		    
		  else
		    return pm.RowTag(pm.ListIndex).IntegerValue
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinSQL(extends ars() as String) As String
		  Return join(ars, " ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBox(TitleStr as String, MsgStr as string, w as window = nil)
		  
		  var d as New MessageDialog  //declare the MessageDialog object
		  var b as MessageDialogButton //for handling the result
		  
		  d.icon = MessageDialog.GraphicNote
		  
		  d.ActionButton.Caption= "OK"
		  
		  
		  d.Message = TitleStr
		  d.Explanation = MsgStr
		  
		  if w = nil then
		    b=d.ShowModal    //display the dialog
		  else
		    #if TargetWindows
		      b = d.ShowModal
		    #else
		      b = d.ShowModalWithin(w)
		    #Endif
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameWithoutExtension(extends tf as FolderItem) As String
		  var tarsName() as String = tf.Name.Split(".")
		  
		  if tarsName.Ubound > 0 then
		    call tarsName.Pop
		    
		  end
		  
		  return Join(tarsName, ".")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreparedStatementClassName(extends teType as DBEngine) As String
		  select case teType
		  case DBEngine.CubeSQL
		    return "CubeSQLVM"
		    
		  case DBEngine.MSSQL
		    return "MSSQLServerPreparedStatement"
		    
		  case DBEngine.MySQL
		    return "MySQLPreparedStatement"
		    
		  case DBEngine.ODBC
		    return "ODBCPreparedStatement"
		    
		  case DBEngine.Postgres
		    return "PostgreSQLPreparedStatement"
		    
		  case DBEngine.SQLite
		    return "SQLitePreparedStatement"
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreparedStatementStringTypePlaceholder(extends teType as DBEngine) As String
		  select case teType
		  case DBEngine.CubeSQL
		    // Original generator does not handle this case
		    
		  case DBEngine.MSSQL
		    return DBEngine.MSSQL.PreparedStatementClassName +  ".MSSQLSERVER_TYPE_STRING"
		    
		  case DBEngine.MySQL
		    return DBEngine.MySQL.PreparedStatementClassName +  ".MYSQL_TYPE_STRING"
		    
		  case DBEngine.ODBC
		    return DBEngine.ODBC.PreparedStatementClassName +  ".ODBC_TYPE_STRING"
		    
		  case DBEngine.Postgres
		    // PostgreSQL uses $1, $2, as its markers in the prepared statement
		    // It does not require the use of BindType so there are no datatype constants.
		    
		  case DBEngine.SQLite
		    return DBEngine.SQLite.PreparedStatementClassName +  ".SQLITE_TEXT"
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFromTagValue(extends pm as PopupMenu, vTag as Variant)
		  for ti as Integer = 0 to (pm.ListCount - 1)
		    if pm.RowTag(ti) = vTag then
		      pm.Enabled = false
		      pm.ListIndex = ti
		      pm.Enabled = true
		      return
		      
		    end
		    
		  next ti
		  
		  // Nothing found
		  pm.Enabled = false
		  pm.ListIndex = -1
		  pm.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetID(extends lst as Listbox, id as integer)
		  if id < 0 then
		    lst.ListIndex = -1
		    return
		  end if
		  
		  for i as Integer = 0 to lst.ListCount - 1
		    
		    if lst.RowTag(i) isa DataFile.ActiveRecordBase then 'active record
		      if DataFile.ActiveRecordBase(lst.RowTag(i)).id = id then
		        lst.ListIndex = i
		        return
		      end if
		      
		    else 'not active record, integer
		      if lst.RowTag(i).IntegerValue = id then
		        lst.ListIndex = i
		        Return
		      end if
		      
		    end if
		    
		    
		  next
		  
		  'couldn't fin it
		  lst.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetId(extends lst as Listbox, assigns id as integer)
		  lst.setid id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetId(extends pm as PopupMenu, id as integer)
		  if id < 0 then
		    pm.ListIndex = -1
		    return
		  end if
		  
		  for i as Integer = 0 to pm.ListCount - 1
		    
		    if pm.RowTag(i) isa DataFile.ActiveRecordBase then 'active record
		      if DataFile.ActiveRecordBase(pm.RowTag(i)).id = id then
		        pm.ListIndex = i
		        return
		      end if
		      
		    else 'not active record, integer
		      if pm.RowTag(i).IntegerValue = id then
		        pm.ListIndex = i
		        Return
		      end if
		      
		    end if
		    
		    
		  next
		  
		  'couldn't fin it
		  pm.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetId(extends pm as PopupMenu, assigns id as integer)
		  pm.setid id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetText(extends pm as PopupMenu, text as String)
		  for i as integer = 0 to pm.ListCount -1
		    if pm.list(i) = text then
		      pm.ListIndex = i
		      exit
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetText(extends txtField as TextEdit, sValue as String)
		  if txtField <> nil then
		    txtField.Enabled = false
		    txtField.Text = sValue
		    txtField.Enabled = true
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(extends tchk as Checkbox, bVal as Boolean)
		  tchk.Enabled = false
		  tchk.Value = bVal
		  tchk.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(extends teType as DBEngine) As String
		  select case teType
		  case DBEngine.CubeSQL
		    return "CubeSQL"
		    
		  case DBEngine.MSSQL
		    return "Microsoft SQL Server"
		    
		  case DBEngine.MySQL
		    return "MySQL"
		    
		  case DBEngine.ODBC
		    return "ODBC"
		    
		  case DBEngine.Postgres
		    return "PostgreSQL"
		    
		  case DBEngine.SQLite
		    return "SQLite"
		    
		  case DBEngine.Unknown
		    return "Unknown"
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(extends teType as ProjectType) As String
		  select case teType
		  case ProjectType.Android
		    return "Android"
		    
		  case ProjectType.Console
		    return "Console"
		    
		  case ProjectType.Desktop
		    return "Desktop"
		    
		  case ProjectType.iOS
		    return "iOS"
		    
		  case ProjectType.Mobile
		    return "Mobile"
		    
		  case ProjectType.Web
		    return "Web"
		    
		  case ProjectType.Unknown
		    return "Unknown"
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WindowIsOnScreen(rectRequest as REALbasic.Rect) As Boolean
		  // Collect all the screens
		  var aroScreens() as Screen
		  var iMax as Integer = ScreenCount - 1
		  for i as Integer = 0 to iMax
		    aroScreens.Append(Screen(i))
		    
		  next
		  
		  for each oScreen as Screen in aroScreens
		    var rectScreen as new REALbasic.Rect
		    rectScreen.Left = oScreen.AvailableLeft
		    rectScreen.Top = oScreen.AvailableTop
		    rectScreen.Width = oScreen.AvailableWidth
		    rectScreen.Height = oScreen.AvailableHeight
		    
		    if rectScreen.Contains(rectRequest) then
		      return true
		      
		    end
		    
		  next oScreen
		  
		  // No screens contain this window
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Sub WindowStateRestore(extends winTarget as Window)
		  if winTarget = nil then return
		  
		  // Position saving is optional
		  if TPSettings.Get("SaveUIState", true) = false then return
		  
		  // Keyed by window name
		  var sStorageKey as String = Introspection.TypeInfo(Introspection.GetType(winTarget)).Name
		  
		  // Did save flag
		  if TPSettings.Get("UIStateSaved" + sStorageKey, false) = false then return
		  
		  // Fetch positioning
		  var rectRequest as new REALbasic.Rect
		  rectRequest.Top = TPSettings.Get(sStorageKey + "WindowTop", 100)
		  rectRequest.Left = TPSettings.Get(sStorageKey + "WindowLeft", 100)
		  rectRequest.Width = TPSettings.Get(sStorageKey + "WindowWidth", winTarget.Width)
		  rectRequest.Height = TPSettings.Get(sStorageKey + "WindowHeight", winTarget.Height)
		  
		  // Ensure that the window bounds are on a screen
		  if WindowIsOnScreen(rectRequest) = false then return
		  
		  // Restore the position
		  winTarget.Top = rectRequest.Top
		  winTarget.Left = rectRequest.Left
		  winTarget.Width = rectRequest.Width
		  winTarget.Height = rectRequest.Height 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Sub WindowStateSave(extends winTarget as Window)
		  if winTarget = nil then return
		  
		  // Position saving is optional
		  if TPSettings.Get("SaveUIState", true) = false then return
		  
		  // Keyed by window name
		  var sStorageKey as String = Introspection.TypeInfo(Introspection.GetType(winTarget)).Name
		  
		  // Did save flag
		  TPSettings.Set("UIStateSaved" + sStorageKey) = true
		  
		  // Window positioning
		  TPSettings.Set(sStorageKey + "WindowTop") = winTarget.Top
		  TPSettings.Set(sStorageKey + "WindowLeft") = winTarget.Left
		  TPSettings.Set(sStorageKey + "WindowWidth") = winTarget.Width
		  TPSettings.Set(sStorageKey + "WindowHeight") = winTarget.Height
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bCheckedQuiltingMachines As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DateTrialBegan As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		MacHelpRegistered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbLimeInitialized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SparkleLoaded As Boolean
	#tag EndProperty


	#tag Constant, Name = kMonospacedFont, Type = String, Dynamic = False, Default = \"Courier New", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Menlo"
	#tag EndConstant

	#tag Constant, Name = kUpdatesExpired, Type = String, Dynamic = False, Default = \"The updates period for this license key does not extend to this release of ARGen.", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = DBEngine, Type = Integer, Flags = &h0
		Unknown
		  CubeSQL
		  MSSQL
		  MySQL
		  ODBC
		  Postgres
		SQLite
	#tag EndEnum

	#tag Enum, Name = ProjectType, Type = Integer, Flags = &h0
		Unknown
		  Android
		  Console
		  Desktop
		  Mobile
		  iOS
		Web
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="bCheckedQuiltingMachines"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacHelpRegistered"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
