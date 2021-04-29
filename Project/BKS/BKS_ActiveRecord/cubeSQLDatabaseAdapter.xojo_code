#tag Class
Protected Class cubeSQLDatabaseAdapter
Inherits BKS_ActiveRecord.DatabaseAdapter
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  'If you are not connecting to CubeSQLServer and do not have the CubeSQLServer plugin delete this class (cubeSQLDatabaseAdapter)
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    if m_iTransactionCt=0 and not db.AutoCommit then
		      try
		        m_db.Commit 'commit the auto transaction
		      catch ex as RuntimeException
		        'ignore this one
		      end try
		    end if
		    
		    if m_iTransactionCt=0 then
		      SQLExecute( "BEGIN" )
		    end if
		    m_iTransactionCt = m_iTransactionCt + 1
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BindValues(oStmt as Object, oRecord as BKS_ActiveRecord.Base, aroField() as BKS_ActiveRecord.P.FieldInfo) As Dictionary
		  // Overriding the parent class ...
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var stmt as cubeSQLVM = cubeSQLVM(oStmt)
		    var dictFieldValue as new Dictionary
		    
		    for i as integer = 0 to aroField.Ubound
		      var oField as BKS_ActiveRecord.P.FieldInfo = aroField(i)
		      var pi as Introspection.PropertyInfo = oField.piFieldProperty
		      var v as Variant = pi.Value(oRecord)
		      
		      var iDbType as integer
		      select case aroField(i).enFieldType
		      case DbType.DInteger
		        iDbType = REALSQLPreparedStatement.SQLITE_INTEGER
		      case DbType.DSmallInt
		        iDbType = REALSQLPreparedStatement.SQLITE_INTEGER
		      case DbType.DDouble
		        iDbType = REALSQLPreparedStatement.SQLITE_DOUBLE
		      case DbType.DDate
		        iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		      case DbType.DTime
		        iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		      case DbType.DTimestamp
		        iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		      case DbType.DBoolean
		        iDbType = REALSQLPreparedStatement.SQLITE_BOOLEAN
		      case DbType.DBlob
		        iDbType = REALSQLPreparedStatement.SQLITE_BLOB
		      case DbType.DText
		        iDbType = REALSQLPreparedStatement.SQLITE_TEXT
		      case DbType.DInt64
		        iDbType = REALSQLPreparedStatement.SQLITE_INT64
		      case DbType.DFloat
		        iDbType = REALSQLPreparedStatement.SQLITE_DOUBLE
		      case DBType.DCurrency
		        iDbType = REALSQLPreparedStatement.SQLITE_INT64
		      case else
		        break 'unsupported type
		      end select
		      
		      
		      if oField.IsKey and v.IntegerValue<=0 then
		        'if the field is a key and it's 0 or less, then set it to NULL
		        iDBType = REALSQLPreparedStatement.SQLITE_NULL
		      elseif pi.PropertyType.Name="Date" or _
		        (pi.PropertyType.Name="Variant" and v.Type=Variant.TypeDate) then
		        var dt as Date = v.DateValue
		        if dt=nil then
		          iDBType = REALSQLPreparedStatement.SQLITE_NULL
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
		            iDBType = REALSQLPreparedStatement.SQLITE_TEXT
		          elseif oField.enFieldType=BKS_ActiveRecord.DbType.DTimestamp then
		            iDBType = REALSQLPreparedStatement.SQLITE_TEXT
		          else
		            iDBType = REALSQLPreparedStatement.SQLITE_TEXT
		          end if
		        end if
		      elseif pi.PropertyType.Name="Double" and _
		        v.DoubleValue = BKS_ActiveRecord.kDoubleNullSentinal then
		        iDBType = REALSQLPreparedStatement.SQLITE_NULL
		      else
		        // stmt.Bind(i, v)
		      end if
		      dictFieldValue.Value(pi.Name) = v
		      
		      select case iDbType
		      case REALSQLPreparedStatement.SQLITE_INTEGER
		        stmt.BindInt(i + 1, v.IntegerValue)
		        
		      case REALSQLPreparedStatement.SQLITE_DOUBLE
		        stmt.BindDouble(i + 1, v.DoubleValue)
		        
		      case REALSQLPreparedStatement.SQLITE_TEXT
		        stmt.BindText(i + 1, v.StringValue)
		        
		      case REALSQLPreparedStatement.SQLITE_BOOLEAN
		        stmt.BindInt(i + 1, v.IntegerValue)
		        
		      case REALSQLPreparedStatement.SQLITE_BLOB
		        stmt.BindBlob(i + 1, v)
		        
		      case REALSQLPreparedStatement.SQLITE_INT64
		        stmt.BindInt64(i + 1, v.Int64Value)
		        
		      end select
		    next
		    
		    return dictFieldValue
		  #endif
		  #pragma unused aroField
		  #pragma unused oStmt
		  #pragma unused oRecord
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommitTransaction()
		  m_iTransactionCt = m_iTransactionCt - 1
		  if m_iTransactionCt=0 then
		    Db.Commit
		    if db.Error then
		      var ex as new BKS_ActiveRecord.DatabaseException(db, "Commit")
		      db.Rollback
		      raise ex
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oDb as Object)
		  #pragma unused oDb
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(oDb)
		    if db=nil then
		      raise new RuntimeException
		    end if
		    m_db = db
		  #else
		    var ex as new UnsupportedOperationException
		    ex.Message = "CubeSQL is not enabled"
		    raise ex
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Db() As Database
		  return m_db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteRecord(oRecord as BKS_ActiveRecord.Base)
		  #pragma unused oRecord
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    var sql as String
		    var oTableInfo as BKS_ActiveRecord.P.TableInfo
		    
		    oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		    
		    sql = "DELETE FROM " + oTableInfo.sTableName + _
		    " WHERE " + oTableInfo.sPrimaryKey + "=?1"
		    
		    var stmt as CubeSQLVM
		    stmt = db.VMPrepare(sql)
		    stmt.BindInt64(1, oRecord.ID)
		    
		    stmt.VMExecute
		    if db.Error then
		      raise new BKS_ActiveRecord.DatabaseException(db)
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLastInsertID() As Int64
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    return db.LastRowID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertRecord(oRecord as BKS_ActiveRecord.Base, byref dictSavedPropertyValue as Dictionary) As Int64
		  // Overriding the parent class ...
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    var oTableInfo as BKS_ActiveRecord.P.TableInfo
		    
		    var dictFieldValue as Dictionary
		    
		    oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		    
		    var arsField() as String
		    var arsPlaceholder() as String
		    var aroField() as BKS_ActiveRecord.P.FieldInfo
		    
		    var i as integer
		    for each oField as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		      if oField.bPrimaryKey then
		        continue
		      end if
		      arsField.Append(oField.sFieldName)
		      
		      i = i + 1
		      arsPlaceholder.Append("?" + str(i))
		      aroField.Append(oField)
		    next
		    var sql as String
		    sql = "INSERT INTO " + oTableInfo.sTableName
		    sql = sql + "(" + Join(arsField, ",") + ")"
		    sql = sql + " VALUES "
		    sql = sql + "(" + Join(arsPlaceholder, ",") + ")"
		    
		    var stmt as CubeSQLVM
		    stmt = db.VMPrepare(sql)
		    
		    dictFieldValue = BindValues(stmt, oRecord, aroField)
		    
		    stmt.VMExecute
		    if db.Error then
		      raise new BKS_ActiveRecord.DatabaseException(db)
		    end if
		    
		    var iRecordID as Int64 = GetLastInsertID
		    dictFieldValue.Value( oTableInfo.piPrimaryKey.Name ) = iRecordID
		    
		    'store the newly saved property values
		    dictSavedPropertyValue = dictFieldValue
		    
		    return iRecordID
		  #endif
		  #pragma unused oRecord
		  #pragma unused dictSavedPropertyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RollbackTransaction()
		  m_iTransactionCt = m_iTransactionCt - 1
		  if m_iTransactionCt=0 then
		    Db.Rollback
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectRecord(oRecord as BKS_ActiveRecord.Base, iRecordID as Int64) As RecordSet
		  // Overriding the parent class ...
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    var sql as String
		    var rs as RecordSet
		    var oTableInfo as BKS_ActiveRecord.P.TableInfo
		    oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		    
		    sql = "SELECT * FROM " + oTableInfo.sTableName + _
		    " WHERE " + oTableInfo.sPrimaryKey + "=?1"
		    
		    var stmt as CubeSQLVM
		    stmt = db.VMPrepare(sql)
		    // stmt.BindType(0, REALSQLPreparedStatement.SQLITE_INT64)
		    stmt.BindInt64(1, iRecordID)
		    
		    rs = stmt.VMSelect
		    if db.Error then
		      raise new BKS_ActiveRecord.DatabaseException(db)
		    end if
		    
		    return rs
		  #endif
		  #pragma unused oRecord
		  #pragma unused iRecordID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRecord(oRecord as BKS_ActiveRecord.Base, byref dictSavedPropertyValue as Dictionary)
		  // Overriding the parent class ...
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase
		    var db as CubeSQLServer = CubeSQLServer(m_db)
		    var oTableInfo as BKS_ActiveRecord.P.TableInfo
		    
		    var dictFieldValue as Dictionary
		    
		    oTableInfo = GetTableInfo( Introspection.GetType(oRecord) )
		    
		    var arsField() as String
		    var aroField() as BKS_ActiveRecord.P.FieldInfo
		    var oPrimaryKeyField as BKS_ActiveRecord.P.FieldInfo
		    
		    var i as integer
		    
		    for each oField as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		      if oField.bPrimaryKey then
		        oPrimaryKeyField = oField
		        continue
		      end if
		      i = i + 1
		      arsField.Append(oField.sFieldName + "=?" + str(i))
		      aroField.Append(oField)
		      
		    next
		    var sql as String
		    sql = "UPDATE " + oTableInfo.sTableName + " SET "
		    sql = sql + Join(arsField, ",")
		    sql = sql + " WHERE " + oTableInfo.sPrimaryKey + "=?"
		    
		    var stmt as CubeSQLVM
		    stmt = db.VMPrepare(sql)
		    
		    aroField.Append(oPrimaryKeyField)
		    dictFieldValue = me.BindValues(stmt, oRecord, aroField)
		    
		    stmt.VMExecute
		    if db.Error then
		      raise new BKS_ActiveRecord.DatabaseException(db)
		    end if
		    
		    'store the newly saved property values
		    dictSavedPropertyValue = dictFieldValue
		  #endif
		  #pragma unused oRecord
		  #pragma unused dictSavedPropertyValue
		End Sub
	#tag EndMethod


	#tag Note, Name = CubeSQLServer
		If you are not connecting to CubeSQLServer and 
		do not have the CubeSQLServer plugin delete this class (cubeSQLDatabaseAdapter)
	#tag EndNote


	#tag Property, Flags = &h21
		Private m_db As Database
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_iTransactionCt As Integer
	#tag EndProperty


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
