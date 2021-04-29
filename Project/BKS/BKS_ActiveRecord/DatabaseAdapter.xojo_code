#tag Class
Protected Class DatabaseAdapter
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  break //Should be called by the Database Adapter Subclass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BindId(stmt as PreparedSQLStatement, i as integer, id as Int64)
		  #if BKS_ActiveRecordConfig.kIncludeSQLiteDatabase and RBVersion>=2013
		    if db isa SQLiteDatabase then
		      stmt.BindType(i, SQLitePreparedStatement.SQLITE_INT64)
		    end if
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeMySQLCommunityServer
		    if db isa MySQLCommunityServer then
		      stmt.BindType(i, MySQLPreparedStatement.MYSQL_TYPE_LONGLONG)
		    end if
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludePostgreSQLDatabase
		    if db isa PostgreSQLDatabase then
		      //PostgreSQL doesn't do binding the same way
		    end
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeMSSQLServer
		    if db isa MSSQLServerDatabase then
		      stmt.BindType(i, MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_INT)
		    end
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeODBC
		    if db isa ODBCDatabase then
		      stmt.BindType(i, ODBCPreparedStatement.ODBC_TYPE_BIGINT)
		    end
		  #endif
		  
		  
		  
		  #If BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    if db isa CubeSQLServer then
		      break
		    end
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeVSQLiteDatabase
		    if db isa VSQLiteDatabase then
		      stmt.BindType(i, SQLitePreparedStatement.SQLITE_INT64)
		    end if
		  #endif
		  
		  stmt.Bind(i, id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BindNull(stmt as PreparedSQLStatement, i as integer)
		  #if BKS_ActiveRecordConfig.kIncludeMySQLCommunityServer
		    if db isa MySQLCommunityServer then
		      stmt.BindType(i, MySQLPreparedStatement.MYSQL_TYPE_NULL)
		    end if
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeSQLiteDatabase and RBVersion>=2013
		    if db isa SQLiteDatabase then
		      stmt.BindType(i, SQLitePreparedStatement.SQLITE_NULL)
		    end if
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludePostgreSQLDatabase
		    if db isa PostgreSQLDatabase then
		      //PostgreSQL doesn't do binding the same way
		    end
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeODBC
		    if db isa ODBCDatabase then
		      stmt.BindType(i, ODBCPreparedStatement.ODBC_TYPE_NULL)
		    end
		  #endif
		  
		  #if BKS_ActiveRecordConfig.kIncludeMSSQLServer
		    if db isa MSSQLServerDatabase then
		      stmt.BindType(i, MSSQLServerPreparedStatement.MSSQLSERVER_TYPE_NULL)
		    end
		  #endif
		  
		  
		  
		  #if BKS_ActiveRecordConfig.kIncludeVSQLiteDatabase
		    if db isa VSQLiteDatabase then
		      stmt.BindType(i, SQLitePreparedStatement.SQLITE_NULL)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BindValues(stmt as PreparedSQLStatement, oRecord as BKS_ActiveRecord.Base, aroField() as BKS_ActiveRecord.P.FieldInfo) As Dictionary
		  var dictFieldValue as new Dictionary
		  
		  for i as integer = 0 to aroField.Ubound
		    var oField as BKS_ActiveRecord.P.FieldInfo = aroField(i)
		    
		    var iDbType as integer = oField.iDbType
		    
		    var pi as Introspection.PropertyInfo = oField.piFieldProperty
		    
		    var v as Variant = pi.Value(oRecord)
		    
		    select case db
		    case nil
		      'empty. This just let's it compile if someone turns off all the constants
		      
		      #if BKS_ActiveRecordConfig.kIncludeMySQLCommunityServer
		    case isa MySQLCommunityServer
		      select case aroField(i).enFieldType
		      case DbType.DInteger
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONG
		      case DbType.DSmallInt
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_SHORT
		      case DbType.DDouble
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		      case DbType.DDate
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_DATE
		      case DbType.DTimestamp
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_TIMESTAMP
		      case DbType.DBoolean
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_TINY
		      case DbType.DBlob
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_BLOB
		      case DbType.DText
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_STRING
		      case DbType.DInt64
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONGLONG
		      case DbType.DFloat
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		      case DbType.DCurrency
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		      case else
		        break 'unsupported type
		      end select
		      #endif
		      
		      
		      
		    end select
		    
		    #if BKS_ActiveRecordConfig.kIncludeMySQLCommunityServer
		      'Xojo thinks MySQL BigInt (Int64) is a text field.
		      if oField.piFieldProperty.PropertyType.name = "Int64" AND oField.enFieldType = DbType.DText then
		        iDbType = MySQLPreparedStatement.MYSQL_TYPE_LONGLONG
		      end if
		    #Endif
		    
		    stmt.BindType(i, iDbType)
		    
		    if oField.IsKey and v.IntegerValue<=0 then
		      'if the field is a key and it's 0 or less, then set it to NULL
		      BindNull(stmt, i)
		      stmt.Bind(i, nil)
		    elseif pi.PropertyType.Name="Date" or (pi.PropertyType.Name="Variant" and v.Type=Variant.TypeDate) then
		      
		      var dt as Date = v.DateValue
		      if dt=nil then
		        BindNull(stmt, i)
		        stmt.Bind(i, nil)
		      else
		        var dt1 as new Date
		        dt1.GMTOffset = dt.GMTOffset
		        dt1.TotalSeconds = dt.TotalSeconds
		        v = dt1 'copied for the saved value
		        
		        var dt2 as new Date
		        dt2.GMTOffset = dt.GMTOffset
		        dt2.TotalSeconds = dt.TotalSeconds
		        dt2.GMTOffset = 0
		        dt = dt2
		        
		        if oField.enFieldType=BKS_ActiveRecord.DbType.DDate then
		          stmt.Bind(i, dt.SQLDate)
		        elseif oField.enFieldType=BKS_ActiveRecord.DbType.DTimestamp then
		          stmt.Bind(i, dt.SQLDateTime)
		        else
		          stmt.Bind(i, dt.SQLDateTime)
		        end if
		      end if
		      
		    elseif pi.PropertyType.Name="Double" and v.DoubleValue = BKS_ActiveRecord.kDoubleNullSentinal then
		      BindNull(stmt, i)
		      stmt.Bind(i, nil)
		    else
		      stmt.Bind(i, v)
		    end if
		    
		    dictFieldValue.Value(pi.Name) = v
		    
		  next
		  
		  return dictFieldValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommitTransaction()
		  break //Should be called by the Database Adapter Subclass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  'Empty
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Db() As Database
		  BKS_Debug.Assert( false, "needs to be implemented in subclass" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteRecord(oRecord as BKS_ActiveRecord.Base)
		  
		  var sql as String
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  
		  oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		  
		  sql = "DELETE FROM " + oTableInfo.sTableName + _
		  " WHERE " + oTableInfo.sPrimaryKey
		  
		  #if BKS_ActiveRecordConfig.kIncludePostgreSQLDatabase
		    if db isa PostgreSQLDatabase then
		      sql = sql  + "=$1"
		    else
		      sql = sql  + "=?"
		    end if
		  #else
		    sql = sql  + "=?"
		  #Endif
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare(sql)
		  BindId(stmt, 0, oRecord.ID)
		  
		  stmt.SQLExecute
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException(db)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLastInsertID() As Int64
		  BKS_Debug.Assert( false, "needs to be implemented in subclass" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasTable(sTableName as String) As boolean
		  var rs as RecordSet
		  rs = Db.TableSchema
		  while not rs.EOF
		    if rs.IdxField(1).StringValue = sTableName then
		      return true
		    end if
		    rs.MoveNext
		  wend
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertRecord(oRecord as BKS_ActiveRecord.Base, byref dictSavedPropertyValue as Dictionary) As Int64
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  
		  var dictFieldValue as Dictionary
		  
		  oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		  
		  var arsField() as String
		  var arsPlaceholder() as String
		  var aroField() as BKS_ActiveRecord.P.FieldInfo
		  
		  for each oField as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		    if oField.bPrimaryKey then
		      continue
		    end if
		    arsField.Append(oField.sFieldName)
		    arsPlaceholder.Append("?")
		    aroField.Append(oField)
		  next
		  
		  var arsSQL() as String
		  arsSQL.append "INSERT INTO " + oTableInfo.sTableName
		  arsSQL.append "(" + Join(arsField, ",") + ")"
		  arsSQL.append " VALUES "
		  arsSQL.append "(" + Join(arsPlaceholder, ",") + ")"
		  
		  var sSQL as String = Join(arsSQL, " ")
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare( sSQL )
		  
		  dictFieldValue = BindValues(stmt, oRecord, aroField)
		  
		  stmt.SQLExecute
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException(db)
		  end if
		  
		  var iRecordID as Int64 = GetLastInsertID
		  dictFieldValue.Value( oTableInfo.piPrimaryKey.Name ) = iRecordID
		  
		  'store the newly saved property values
		  dictSavedPropertyValue = dictFieldValue
		  
		  return iRecordID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RollbackTransaction()
		  break //Should be called by the Database Adapter Subclass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectList(sTable as String, sCondition as string = "", sOrder as string = "") As RecordSet
		  var sSQL as String = "SELECT * FROM " + sTable + " "
		  if sCondition<>"" then
		    sSQL = sSQL + "WHERE " + sCondition
		  end if
		  
		  if sOrder<>"" then
		    sSQL = sSQL + " ORDER BY " + sOrder
		  end if
		  sSQL = sSQL + ";"
		  
		  return SQLSelect(sSQL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectRecord(oRecord as BKS_ActiveRecord.Base, iRecordID as integer) As RecordSet
		  var sql as String
		  var rs as RecordSet
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		  
		  sql = "SELECT * FROM " + oTableInfo.sTableName + " WHERE " + oTableInfo.sPrimaryKey + "=?"
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare(sql)
		  BindId(stmt, 0, iRecordID)
		  
		  rs = stmt.SQLSelect
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException(db)
		  end if
		  
		  return rs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SQLExecute(sql as String)
		  db.SQLExecute( sql )
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException( db, sql )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(sql as String) As RecordSet
		  var rs as RecordSet = db.SQLSelect( sql )
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException( db, sql )
		  end if
		  return rs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRecord(oRecord as BKS_ActiveRecord.Base, byref dictSavedPropertyValue as Dictionary)
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  
		  var dictFieldValue as Dictionary
		  
		  oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		  
		  var arsField() as String
		  var aroField() as BKS_ActiveRecord.P.FieldInfo
		  var oPrimaryKeyField as BKS_ActiveRecord.P.FieldInfo
		  
		  for each oField as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		    if oField.bPrimaryKey then
		      oPrimaryKeyField = oField
		      continue
		    end if
		    arsField.Append(oField.sFieldName + "=?")
		    aroField.Append(oField)
		  next
		  var arsSQL() as String
		  arsSQL.Append "UPDATE " + oTableInfo.sTableName + " SET "
		  arsSQL.Append Join(arsField, ",")
		  arsSQL.Append " WHERE " + oTableInfo.sPrimaryKey + "=?"
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare( Join(arsSQL, " ") )
		  
		  aroField.Append(oPrimaryKeyField)
		  dictFieldValue = BindValues(stmt, oRecord, aroField)
		  
		  stmt.SQLExecute
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException(db)
		  end if
		  
		  'store the newly saved property values
		  dictSavedPropertyValue = dictFieldValue
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
End Class
#tag EndClass
