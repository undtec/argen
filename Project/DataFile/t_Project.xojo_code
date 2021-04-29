#tag Class
Protected Class t_Project
Inherits DataFile.ActiveRecordBase
	#tag Event
		Sub AfterDelete()
		  self.oProjectData.Delete
		End Sub
	#tag EndEvent

	#tag Event
		Sub AfterSave()
		  if me.sPassword <> "" then
		    KeychainStorePassword
		    
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeforeDelete()
		  KeychainDestroyPassword
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeforeSave()
		  // Save the project data
		  me.oProjectData.Save
		  me.iProjectData_ID = me.oProjectData.iProjectData_ID
		  
		  // SQLite FolderItem
		  if me.eDBEngine = DBEngine.SQLite then
		    if (fDatabase <> nil and fDatabase.Exists) then
		      var sData as String = EncodeBase64(fDatabase.GetSaveInfo(nil, FolderItem.SaveInfoAbsoluteMode))
		      sDatabasePath = sData
		      
		      if me.bDatabaseEncrypted = true then
		        sDatabaseHost = "localhost"
		        
		      else
		        sDatabaseHost = fDatabase.NativePath
		        
		      end
		      
		    else
		      sDatabasePath = ""
		      
		    end
		    
		  end
		  
		  // Save the latest SSL configuration
		  if moSSLConfig = nil then
		    // Nil for off
		    sSSLConfigJSON = ""
		    
		  else
		    try
		      sSSLConfigJSON = moSSLConfig.ToJSON.ToString
		      
		    catch e as JSONException
		      // Bad json
		      sSSLConfigJSON = ""
		      
		    end try
		    
		  end
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ConfigureMySQLSecurity(byref oDBNew as MySQLCommunityServer)
		  // If no SSL config, it's unsecured and we're done
		  if me.oSSLConfig = nil then return
		  
		  // Configure MySQL from oSSLConfig object
		  oDBNew.SSLMode = true
		  
		  oDBNew.SSLAuthority = me.oSSLConfig.fAuthority
		  oDBNew.SSLAuthorityDirectory = me.oSSLConfig.fAuthorityDirectory
		  oDBNew.SSLCertificate = me.oSSLConfig.fSSLCertificate
		  oDBNew.SSLKey = me.oSSLConfig.fKey
		  
		  oDBNew.SSLCipher = me.oSSLConfig.sCipher
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConfigurePostgresSecurity(byref oDBNew as PostgreSQLDatabase)
		  // If no SSL config, it's unsecured and we're done
		  if me.oSSLConfig = nil then return
		  
		  // Configure Postgres from oSSLConfig object
		  oDBNew.SSLAuthority = me.oSSLConfig.fAuthority
		  oDBNew.SSLCertificate = me.oSSLConfig.fSSLCertificate
		  oDBNew.SSLKey = me.oSSLConfig.fKey
		  
		  // Find mode in enum
		  var tariModes() as Integer = Array( _
		  PostgreSQLDatabase.SSLDisable, PostgreSQLDatabase.SSLAllow, PostgreSQLDatabase.SSLPrefer, _
		  PostgreSQLDatabase.SSLRequire, PostgreSQLDatabase.SSLVerifyCA, PostgreSQLDatabase.SSLVerifyFull)
		  
		  for each tiMode as Integer in tariModes 
		    if tiMode = me.oSSLConfig.iPostgresSSLMode then
		      oDBNew.SSLMode = tiMode
		      exit for tiMode
		      
		    end
		    
		  next tiMode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect(ByRef sError as String) As Database
		  var oNewDB as Database
		  
		  select case me.eDBEngine
		  case DBEngine.Unknown
		    sError = "No Database Type selected"
		    return nil
		    
		  case DBEngine.SQLite
		    oNewDB = ConnectSQLite(sError)
		    
		  case DBEngine.CubeSQL, DBEngine.MSSQL, DBEngine.MySQL, DBEngine.Postgres
		    oNewDB = ConnectServer(sError)
		    
		  case DBEngine.ODBC
		    oNewDB = ConnectODBC(sError)
		    
		  case else
		    raise new TPUnimplementedException(CurrentMethodName)
		    
		  end select
		  
		  if sError <> "" then oNewDB = nil
		  
		  Return oNewDB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ConnectODBC(ByRef sError as String) As Database
		  var arsConnection() as String
		  
		  if sDatabaseHost.trim = "" then
		    sError =  "Server Response: Database Host cannnot be blank"
		    Return nil
		  end if
		  
		  if sDatabaseUserName.trim = "" then
		    sError =  "Server Response: User Name cannnot be blank"
		    Return nil
		  end if
		  
		  arsConnection.Append("DSN=")
		  arsConnection.append(sDatabaseHost)
		  
		  if sDatabaseUserName.Trim = "" then
		    // No password, connect without?
		    
		  end
		  
		  arsConnection.Append ";UID="
		  arsConnection.Append sDatabaseUserName
		  
		  arsConnection.Append";PWD="
		  arsConnection.Append sPassword
		  
		  var s as String = join(arsConnection, "")
		  
		  var testDB as new ODBCDatabase
		  testDB.DataSource = s
		  
		  // var sDB as String = testdb.DBMS
		  
		  if testDB.Connect then
		    return testDB
		    
		  else
		    sError =  "Server Response:  " + testDB.ErrorMessage
		    return nil
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ConnectServer(ByRef sError as String) As Database
		  
		  if sDatabaseHost.trim = "" then
		    sError =  "Server Response: Database Host cannnot be blank"
		    Return nil
		  end if
		  
		  if sDatabaseName.trim = "" then
		    sError =  "Server Response: Database Name cannnot be blank"
		    Return nil
		  end if
		  
		  if sDatabaseUserName.trim = "" then
		    sError =  "Server Response: User Name cannnot be blank"
		    Return nil
		  end if
		  
		  select case me.eDBEngine
		  case DBEngine.MySQL
		    var testDB as new MySQLCommunityServer
		    testDB.Host = sDatabaseHost
		    testDB.Port = iDatabasePort
		    testDB.DatabaseName = sDatabaseName
		    testDB.UserName = sDatabaseUserName
		    testDB.Password = sPassword
		    
		    ConfigureMySQLSecurity(testDB)
		    
		    if testDB.Connect then
		      return testDB
		    else
		      sError =  "Server Response:  " + testDB.ErrorMessage
		      Return nil
		    end
		    
		  case DBEngine.Postgres
		    var testDB as new PostgreSQLDatabase
		    testDB.Host = sDatabaseHost
		    testDB.Port = iDatabasePort
		    testDB.DatabaseName = sDatabaseName
		    testDB.UserName = sDatabaseUserName
		    testDB.Password = sPassword
		    
		    ConfigurePostgresSecurity(testDB)
		    
		    if testDB.Connect then
		      return testDB
		    else
		      sError =  "Server Response:  " + testDB.ErrorMessage
		      Return nil
		    end
		    
		    
		    
		  case DBEngine.MSSQL
		    #if TargetWin32 then
		      var testDB as new MSSQLServerDatabase
		      testDB.Host = sDatabaseHost
		      testDB.Port = iDatabasePort
		      testDB.DatabaseName = sDatabaseName
		      testDB.UserName = sDatabaseUserName
		      testDB.Password = sPassword
		      
		      if testDB.Connect then
		        return testDB
		      else
		        sError =  "Server Response:  " + testDB.ErrorMessage
		        Return nil
		      end
		    #endif
		    
		    
		    #if mConfig.kIncludeCubeSQL then
		  case DBEngine.CubeSQL
		    var testDB as new CubeSQLServer
		    testDB.Host = sDatabaseHost
		    testDB.Port = iDatabasePort
		    testDB.DatabaseName = sDatabaseName
		    testDB.UserName = sDatabaseUserName
		    testDB.Password = sPassword
		    
		    if testDB.Connect then
		      return testDB
		    else
		      sError =  "Server Response:  " + testDB.ErrorMessage
		      Return nil
		    end
		    #endif
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ConnectSQLite(ByRef sError as String) As Database
		  if fDatabase = nil or fDatabase.exists = false then
		    sError = "Database Not found."
		    Return nil
		  end if
		  
		  var toNewDB as new SQLiteDatabase
		  if bDatabaseEncrypted then
		    toNewDB.EncryptionKey = sPassword
		    
		  end
		  
		  toNewDB.DatabaseFile = fDatabase
		  
		  if toNewDB.Connect = false then
		    sError =  "Could not connect to the SQLite database.  Make sure it's not encrypted or that it really is an SQLite Database file."
		    return nil
		  else
		    Return toNewDB
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindByID(id as Integer) As DataFile.T_Project
		  var s as String
		  s = "Select * from T_Project WHERE Project_ID = " + str(id)
		  
		  var rs as RecordSet = DB.SQLSelectRaiseOnError(s)
		  
		  if rs.RecordCount = 0 then return nil
		  
		  var oRecord as new DataFile.T_Project
		  oRecord.ReadRecord(rs)
		  return oRecord
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDuplicate(sName as String) As Boolean
		  var ars() as String
		  ars.Append "select Count(*) as iCnt"
		  ars.Append "From T_Project "
		  ars.Append "WHERE ProjectName = "
		  ars.Append sName.SQLizeText
		  ars.Append " AND Project_ID <> " + str(self.iProject_ID)
		  var s as String = ars.JoinSQL
		  Return db.SQLSelect(s).Field("iCnt").IntegerValue > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsModified() As boolean
		  if Super.IsModified = true then Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsWeb20() As Boolean
		  return (me.eProjectType = ProjectType.Web and me.iProjectAPI = 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KeychainDestroyPassword()
		  #if TargetMacOS then
		    #pragma BreakOnExceptions false
		    
		    var oKCI as KeychainItem = KeychainGetItem
		    
		    try
		      // Check to see if it exists first, we'll need to delete it if so
		      call System.Keychain.FindPassword(oKCI)
		      
		      // Delete the item
		      oKCI.Delete
		      oKCI = nil
		      
		    catch e as KeyChainException
		      // Not found
		      
		    end try 
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KeychainGetItem() As KeychainItem
		  #if TargetMacOS then
		    var oKC as new KeychainItem
		    
		    // Name
		    oKC.Label = "ARGen"
		    
		    // Account / USERNAME
		    oKC.AccountName = "connection_" + Format(me.iProject_ID, "######")
		    
		    // Where
		    oKC.ServiceName = "com.strawberrysw.argen"
		    
		    // Kind
		    oKC.Description = "application password"
		    
		    return oKC
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KeychainRestorePassword()
		  #if TargetMacOS then
		    #pragma BreakOnExceptions false
		    
		    var oKCI as KeychainItem = KeychainGetItem
		    
		    try
		      me.sPassword = System.Keychain.FindPassword(oKCI)
		      
		    catch e as KeychainException
		      // Muffle this, it just couldn't be found
		      
		    end try
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KeychainStorePassword()
		  #if TargetMacOS then
		    #pragma BreakOnExceptions false
		    
		    if me.sPassword = "" then return
		    
		    var oKCI as KeychainItem = KeychainGetItem
		    
		    try
		      // Check to see if it exists first, we'll need to delete it if so
		      call System.Keychain.FindPassword(oKCI)
		      
		      // If we got here, the item exists
		      oKCI.Delete
		      
		      // Get a new KCI object
		      oKCI = KeychainGetItem
		      
		    catch e as KeyChainException
		      // Not found
		      
		    end try 
		    
		    #pragma BreakOnExceptions true
		    
		    try
		      System.Keychain.AddPassword(oKCI, sPassword)
		      
		    catch e as KeyChainException
		      // Not going to present to the user, this is all silent
		      
		    end
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as String = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.T_Project()
		  var aro() as DataFile.T_Project
		  var ars() as String
		  
		  
		  ars.append "select * From T_Project "
		  if sCriteria.Trim <> "" then
		    ars.append "WHERE " + sCriteria
		  end if
		  
		  if sOrder.trim <> "" then
		    ars.append " ORDER BY " + sOrder
		  else
		    ars.append "ORDER BY ProjectName"
		  end if
		  
		  if iOffset > -1 then
		    ars.append " LIMIT " + str(BKS_ActiveRecordConfig.kMaxReturn) + " Offset " + str(iOffset)
		  end if
		  
		  ars.Append("COLLATE nocase")
		  
		  var s as String = ars.JoinSQL
		  var rs as recordset = DB.SQLSelectRaiseOnError(s)
		  
		  while rs.eof = false
		    var oRecord as new DataFile.T_Project
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(sCriteria as String = "") As Integer
		  var ars() as String
		  ars.append "select count(*) as iCnt From T_Project "
		  if sCriteria<>"" then
		    ars.append "WHERE " + sCriteria
		  end if
		  var s as String = ars.JoinSQL
		  return db.SQLSelectRaiseOnError(s).Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadData(oThread as BKS_Thread)
		  #if mConfig.kIncludeODBC then
		    if oProjectDB isa ODBCDatabase  then
		      self.sDatabaseName = ODBCDatabase(oProjectDB).DatabaseName
		    end if
		  #Endif
		  
		  LoadTables(oThread)
		  LoadViews(oThread)
		  
		  for each oTable as ARProject.TableData in Tables
		    // Progress
		    if oThread <> nil then
		      var d as new Dictionary
		      d.Value("msg") = "Reading " + oTable.sTableName
		      oThread.UpdateUI(d)
		      oThread.Sleep(15)
		    end
		    
		    LoadFields(oTable)
		    
		    if oTable.bView = false then
		      LoadForeignKeys(oTable)
		      
		    end
		    
		    oTable.Validate(me.IsWeb20)
		    oTable.SortFields
		    oTable.SortForeignKeys
		    
		  next
		  
		  SortTables
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadFields(oTable as ARProject.TableData)
		  var aroNewFields() as ARProject.ClassPropertyInfo
		  
		  // FieldSchema is unreliable for Postgres
		  var rs as RecordSet = oProjectDB.FieldSchema(oTable.sTableName)
		  
		  if oProjectDB.Error then return
		  
		  while not rs.EOF
		    var oField as new ARProject.ClassPropertyInfo(rs)
		    aroNewFields.Append(oField)
		    
		    if oField.iDBFieldSchemaType = 255 then
		      System.DebugLog(oTable.sTableName + "." + oField.sColumnName + " is an unknown type.")
		      
		    end
		    
		    rs.MoveNext
		    
		  wend
		  
		  // Add any that don't exist
		  for each oNewField as ARProject.ClassPropertyInfo in aroNewFields
		    for each oField as ARProject.ClassPropertyInfo in oTable.aroFields
		      if oNewField.sColumnName.Lowercase = oField.sColumnName.Lowercase then
		        // Update primary key flag
		        if oTable.bView = false then
		          oField.bIsPrimary = oNewField.bIsPrimary
		          
		        end
		        
		        continue for oNewField
		        
		      end
		      
		    next
		    
		    // This field is new
		    oTable.aroFields.Append(oNewField)
		    
		  next
		  
		  // Remove any that don't exist any more
		  for tiExisting as Integer = oTable.aroFields.Ubound DownTo 0
		    var oField as ARProject.ClassPropertyInfo = oTable.aroFields(tiExisting)
		    
		    for each oNewField as ARProject.ClassPropertyInfo in aroNewFields
		      if oNewField.sColumnName.Lowercase = oField.sColumnName.Lowercase then
		        // Keep this field
		        continue for tiExisting
		        
		      end
		      
		    next
		    
		    // This field is not in the database anymore
		    oTable.aroFields.Remove(tiExisting)
		    
		  next tiExisting
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadForeignKeys(oTable as ARProject.TableData)
		  var  ars() as String
		  var rs as RecordSet 
		  
		  select case me.eDBEngine
		  case DBEngine.MySQL
		    ars.append "SELECT CONCAT( table_name, '.', column_name, ' -> ', "
		    ars.append "referenced_table_name, '.', referenced_column_name ) as list_of_fks "
		    ars.append "FROM information_schema.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = "
		    ars.Append sDatabaseName.SQLizeText
		    ars.Append "AND "
		    ars.Append "TABLE_NAME = "
		    ars.Append oTable.sTableName.SQLizeText
		    ars.append "AND REFERENCED_TABLE_NAME is not null ORDER BY TABLE_NAME, COLUMN_NAME"
		    
		  Case DBEngine.SQLite
		    ars.Append "PRAGMA Foreign_Key_List("
		    ars.Append oTable.sTableName.SQLizeText
		    ars.Append ")"
		    
		  case DBEngine.CubeSQL
		    'do nothing. It looks like cubeSQL doesn't do foreign keys
		    
		  case DBEngine.Postgres
		    ars.Append "SELECT "
		    ars.Append "tc.constraint_name, tc.table_name, kcu.column_name, "
		    ars.Append  "ccu.table_name as foreign_table_name, "
		    ars.Append "ccu.column_name as foreign_column_name "
		    ars.Append  "FROM "
		    ars.Append  "information_schema.table_constraints as tc "
		    ars.Append  "JOIN information_schema.key_column_usage as kcu "
		    ars.Append "ON tc.constraint_name = kcu.constraint_name "
		    ars.Append "JOIN information_schema.constraint_column_usage as ccu "
		    ars.Append "ON ccu.constraint_name = tc.constraint_name "
		    ars.Append "WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name = "
		    ars.append oTable.sTableName.SQLizeText
		    
		    
		  case DBEngine.MSSQL
		    ars.Append "SELECT f.name AS ForeignKey,"
		    ars.Append "OBJECT_NAME(f.parent_object_id) AS TableName,"
		    ars.Append "COL_NAME(fc.parent_object_id, fc.parent_column_id) AS [from],"
		    ars.Append "OBJECT_NAME (f.referenced_object_id) AS [table],"
		    ars.Append "COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS [to]"
		    ars.Append "FROM sys.foreign_keys AS f"
		    ars.Append "INNER JOIN sys.foreign_key_columns AS fc"
		    ars.Append "ON f.OBJECT_ID = fc.constraint_object_id"
		    ars.Append "WHERE OBJECT_NAME(f.parent_object_id) = "
		    ars.Append oTable.sTableName.SQLizeText
		    
		  end
		  
		  var s as String = Join(ars, " ")
		  if s.Trim = "" then Return
		  
		  rs = oProjectDB.SQLSelectRaiseOnError(s)
		  if rs = nil then return'For what ever reason SQLSelectRaiseOnError doesn't work with SQLite Pragam
		  
		  var aroNewKeys() as ARProject.ForeignKey
		  while rs.eof = false
		    var oFK as  ARProject.ForeignKey
		    
		    select case me.eDBEngine
		    case DBEngine.SQLite, DBEngine.CubeSQL, DBEngine.MSSQL
		      oFK = new ARProject.ForeignKey
		      oFK.sName = oTable.sTableName + "." + rs.Field("From").StringValue + " = " + rs.Field("table").StringValue + "." + rs.Field("to").StringValue
		      oFK.sTable = oTable.sTableName
		      oFK.sColumn = rs.Field("From").StringValue
		      oFK.sForeignTable = rs.Field("table").StringValue
		      oFK.sForeignColumn = rs.Field("to").StringValue
		      
		    case DBEngine.MySQL
		      oFK = New ARProject.ForeignKey(rs.Field("list_of_fks").StringValue.DefineEncoding(Encodings.UTF8))
		      
		    case DBEngine.Postgres
		      oFK = New ARProject.ForeignKey(rs)
		      
		    case else
		      raise new TPUnimplementedException(CurrentMethodName)
		      
		    end select
		    
		    aroNewKeys.Append oFK
		    rs.MoveNext
		  wend
		  
		  var aro() as ARProject.ForeignKey = oTable.aroForeignKey
		  
		  'Add any that don't exist
		  for each oNewKey as ARProject.ForeignKey in aroNewKeys
		    var bExists as Boolean
		    for each oKey as ARProject.ForeignKey in oTable.aroForeignKey
		      if oNewKey.sName.Lowercase = oKey.sName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true then Continue
		    aro.Append oNewKey
		    
		  next
		  
		  'Remove any that don't exist any more
		  for i as integer = aro.Ubound DownTo 0
		    var bExists as Boolean
		    var oKey as ARProject.ForeignKey = aro(i)
		    var bManualEntry as Boolean = oKey.bManualEntry
		    
		    for each oNewKey as ARProject.ForeignKey in aroNewKeys
		      if oNewKey.sName.Lowercase = oKey.sName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true or bManualEntry = true then Continue
		    aro.Remove i
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadTables(oThread as BKS_Thread)
		  System.DebugLog(CurrentMethodName)
		  if oThread <> nil then
		    var d as new Dictionary
		    d.value("msg") = "Loading Tables"
		    oThread.UpdateUI(d)
		    oThread.Sleep(15)
		  end
		  
		  var arsSQL() as String
		  var arsIgnoreList() as String
		  var aroDBTables() as ARProject.TableData
		  select case me.eDBEngine
		  case DBEngine.MySQL
		    arsSQL.Append("select TABLE_NAME as name from information_schema.tables ")
		    arsSQL.Append("where TABLE_TYPE = 'BASE TABLE' ")
		    arsSQL.Append("AND TABLE_SCHEMA = ")
		    arsSQL.Append(sDatabaseName.SQLizeText)
		    arsSQL.Append("order by TABLE_NAME")
		    
		  case DBEngine.SQLite, DBEngine.CubeSQL
		    arsIgnoreList.Append("sqlite_master")
		    arsIgnoreList.Append("sqlite_sequence")
		    arsIgnoreList.Append("sqlite_sp_functions")
		    arsIgnoreList.Append("sqlite_vs_links_names")
		    arsIgnoreList.Append("sqlite_vs_properties")
		    arsIgnoreList.Append("sqlite_stat1")
		    arsIgnoreList.Append("sqlite_stat2")
		    arsIgnoreList.Append("sqlite_stat3")
		    arsIgnoreList.Append("sqlite_stat4")
		    
		    arsSQL.Append("SELECT name FROM sqlite_master WHERE type='table' order by name")
		    
		  case DBEngine.Postgres
		    arsSQL.Append("SELECT table_name FROM information_schema.tables ")
		    // ars.Append("WHERE table_schema='public' ")
		    arsSQL.Append("WHERE table_schema NOT IN ('pg_catalog', 'information_schema')")
		    arsSQL.Append("AND table_type = 'BASE TABLE'")
		    
		  case DBEngine.MSSQL
		    arsSQL.Append("SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_TYPE = 'BASE TABLE' order by TABLE_NAME ")
		    
		  case else
		    break
		    return
		    
		  end
		  
		  var rs as RecordSet = oProjectDB.SQLSelectRaiseOnError(arsSQL.JoinSQL)
		  while not rs.EOF
		    var sTableName as String = rs.IdxField(1).StringValue
		    System.DebugLog(sTableName)
		    
		    if arsIgnoreList.IndexOf(sTableName) > -1 then
		      rs.MoveNext
		      continue
		      
		    end
		    
		    var oTable as new ARProject.TableData
		    oTable.sTableName = sTableName
		    
		    aroDBTables.Append(oTable)
		    rs.MoveNext
		    
		  wend
		  
		  var aro() as ARProject.TableData = Tables
		  
		  'Add any that don't exist
		  for each oNewTable as ARProject.TableData in aroDBTables
		    var bExists as Boolean
		    for each oTable as ARProject.TableData in Tables
		      if oNewTable.sTableName.Lowercase = oTable.sTableName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true then Continue
		    aro.Append(oNewTable)
		    
		  next
		  
		  'Remove any that don't exist any more
		  for i as integer = aro.Ubound DownTo 0
		    var bExists as Boolean
		    var oTable as ARProject.TableData = aro(i)
		    if oTable.bView = true then Continue
		    
		    for each oNewTable as ARProject.TableData in aroDBTables
		      if oNewTable.sTableName.Lowercase = oTable.sTableName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true then Continue
		    aro.Remove i
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadViews(oThread as BKS_Thread)
		  System.DebugLog(CurrentMethodName)
		  if oThread <> nil then
		    var d as new Dictionary
		    d.value("msg") = "Loading Views"
		    oThread.UpdateUI(d)
		    oThread.Sleep(15)
		  end
		  
		  var arsSQL() as String
		  var arsIgnoreList() as String
		  var aroDBTables() as ARProject.TableData
		  select case me.eDBEngine
		  case DBEngine.MySQL
		    arsSQL.Append("select TABLE_NAME as name from information_schema.tables ")
		    arsSQL.Append("where TABLE_TYPE = 'View' ")
		    arsSQL.Append("AND TABLE_SCHEMA = " )
		    arsSQL.Append(sDatabaseName.SQLizeText)
		    arsSQL.Append("order by TABLE_NAME")
		    
		  case DBEngine.SQLite, DBEngine.CubeSQL
		    arsSQL.Append("SELECT name FROM sqlite_master  WHERE type='view' order by name")
		    
		  case DBEngine.MSSQL
		    arsSQL.Append("SELECT TABLE_NAME as name FROM information_schema.tables WHERE TABLE_TYPE = 'VIEW' order by TABLE_NAME")
		    
		  case DBEngine.Postgres
		    arsSQL.Append(" select viewname as name from pg_catalog.pg_views ")
		    arsSQL.Append("where schemaname NOT IN ('pg_catalog', 'information_schema') ")
		    arsSQL.Append("order by viewname;")
		    
		    arsIgnoreList.Append("pg_stat_statements")
		    
		  case else
		    break
		    return
		    
		  end
		  
		  var rs as RecordSet = oProjectDB.SQLSelectRaiseOnError(arsSQL.JoinSQL)
		  while not rs.EOF
		    var sTableName as String = rs.Field("name").StringValue
		    System.DebugLog sTableName
		    
		    if arsIgnoreList.IndexOf(sTableName) > -1 then
		      rs.MoveNext
		      continue
		      
		    end
		    
		    var oTable as new ARProject.TableData
		    oTable.sTableName = sTableName
		    oTable.bView = true
		    
		    aroDBTables.Append(oTable)
		    rs.MoveNext
		    
		  wend
		  
		  var aro() as ARProject.TableData = Tables
		  
		  'Add any that don't exist
		  for each oNewTable as ARProject.TableData in aroDBTables
		    var bExists as Boolean
		    for each oTable as ARProject.TableData in Tables
		      if oNewTable.sTableName.Lowercase = oTable.sTableName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true then Continue
		    aro.Append(oNewTable)
		    
		  next
		  
		  'Remove any that don't exist any more
		  
		  for i as integer = aro.Ubound DownTo 0
		    var bExists as Boolean
		    var oTable as ARProject.TableData = aro(i)
		    if oTable.bView = false then Continue
		    
		    for each oNewTable as ARProject.TableData in aroDBTables
		      if oNewTable.sTableName.Lowercase = oTable.sTableName.Lowercase then
		        bExists = true
		        exit for
		      end if
		    next
		    
		    if bExists = true then Continue
		    aro.Remove i
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortTables()
		  var ars() as String
		  
		  for each oTable as ARProject.TableData in Tables
		    ars.Append oTable.sTableName
		  next
		  
		  
		  ars.Sort
		  
		  
		  var aroSort() as ARProject.TableData
		  
		  for each sTableName as String in ars
		    for each oTable as ARProject.TableData in Tables
		      if oTable.sTableName.Lowercase = sTableName.Lowercase then
		        aroSort.Append oTable
		        exit for
		      end if
		    next
		  next
		  
		  oProjectData.oData.aroTables =  aroSort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tables() As ARProject.TableData()
		  Return oProjectData.oData.aroTables
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bDatabaseEncrypted As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Shortcut to the ARProject.ProjectData object
			  return oProjectData.oData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Shortcut to the ARProject.ProjectData object
			  oProjectData.oData = value
			End Set
		#tag EndSetter
		DataClass As ARProject.ProjectData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return DBEngine(iDatabaseEngine)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  iDatabaseEngine = Integer(value)
			End Set
		#tag EndSetter
		eDBEngine As DBEngine
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ProjectType(iProjectType)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  iProjectType = Integer(value)
			End Set
		#tag EndSetter
		eProjectType As ProjectType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if sDatabasePath.trim <> "" and mfDatabase = nil then
			    var sData as String = DecodeBase64(sDatabasePath)
			    mfDatabase = GetFolderItem(sData)
			  end if
			  
			  return mfDatabase
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mfDatabase = value
			End Set
		#tag EndSetter
		fDatabase As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		iDatabaseEngine As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iDatabasePort As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iProjectAPI As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		iProjectData_ID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iProjectType As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h0
		iProject_ID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfDatabase As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moProjectData As DataFile.t_ProjectData
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moSSLConfig As ARProject.SSLConfiguration
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Check cache
			  if moProjectData = nil then
			    moProjectData = DataFile.T_ProjectData.FindByID(iProjectData_ID)
			    
			  end
			  
			  // Check again, create it this time though
			  if moProjectData = nil then
			    moProjectData = new DataFile.T_ProjectData
			    
			  end
			  
			  return moProjectData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  moProjectData = value
			End Set
		#tag EndSetter
		oProjectData As DataFile.t_ProjectData
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		oProjectDB As Database
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Try to create a config object if we have saved one, but it's okay to be nil
			  if moSSLConfig = nil and sSSLConfigJSON <> "" then
			    try
			      var jsSSL as new JSONItem(sSSLConfigJSON)
			      
			      moSSLConfig = new ARProject.SSLConfiguration
			      moSSLConfig.FromJSON(jsSSL)
			      
			    catch e as JSONException
			      // Bad JSON
			    end try
			    
			  end
			  
			  return moSSLConfig
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Only set the object, we will get the latest String value in BeforeSave
			  moSSLConfig = value
			End Set
		#tag EndSetter
		oSSLConfig As ARProject.SSLConfiguration
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		sDatabaseHost As String = "localhost"
	#tag EndProperty

	#tag Property, Flags = &h0
		sDatabaseName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sDatabasePath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sDatabaseUsername As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// This is NOT saved to the database
		#tag EndNote
		sPassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sProjectName As String = "Untitled"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sSSLConfigJSON As String
	#tag EndProperty


	#tag Constant, Name = kIgnoreListSqlite, Type = String, Dynamic = False, Default = \"\'sqlite_master\'\x2C\'sqlite_sequence\'\x2C\'sqlite_sp_functions\'\x2C\'sqlite_vs_links_names\'\x2C\'sqlite_vs_properties\'", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="bDatabaseEncrypted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="iDatabasePort"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="iDatabaseEngine"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="iProject_ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="oProjectDB"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Database"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDatabaseHost"
			Visible=false
			Group="Behavior"
			InitialValue="localhost"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDatabaseName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDatabasePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDatabaseUsername"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sProjectName"
			Visible=false
			Group="Behavior"
			InitialValue="Untitled"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="iProjectType"
			Visible=false
			Group="Behavior"
			InitialValue="3"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="iProjectData_ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eDBEngine"
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
		#tag ViewProperty
			Name="iProjectAPI"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eProjectType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ProjectType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Android"
				"2 - Console"
				"3 - Desktop"
				"4 - Mobile"
				"5 - iOS"
				"6 - Web"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
