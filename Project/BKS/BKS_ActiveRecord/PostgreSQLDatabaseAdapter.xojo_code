#tag Class
Protected Class PostgreSQLDatabaseAdapter
Inherits BKS_ActiveRecord.DatabaseAdapter
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  if m_iTransactionCt=0 then
		    try
		      m_db.Commit 'commit the auto transaction
		    catch ex as RuntimeException
		      'ignore this one
		    end try
		  end if
		  
		  if m_iTransactionCt=0 then
		    SQLExecute( "START TRANSACTION" )
		  end if
		  m_iTransactionCt = m_iTransactionCt + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BindValues(stmt as PreparedSQLStatement, oRecord as BKS_ActiveRecord.Base, aroField() as BKS_ActiveRecord.P.FieldInfo) As Dictionary
		  var dictFieldValue as new Dictionary
		  
		  for i as integer = 0 to aroField.Ubound
		    var oField as BKS_ActiveRecord.P.FieldInfo = aroField(i)
		    var pi as Introspection.PropertyInfo = oField.piFieldProperty
		    var v as Variant = pi.Value(oRecord)
		    
		    stmt.Bind(i, v)
		    
		    dictFieldValue.Value(pi.Name) = v
		    
		  next
		  
		  return dictFieldValue
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
		  'If you are not connecting to PostgreSQL and do not have the PostgreSQLPlugin plugin delete this class (PostgreSQLDatabaseAdapter)
		  #if BKS_ActiveRecordConfig.kIncludePostgreSQLDatabase
		    var db as PostgreSQLDatabase = PostgreSQLDatabase(oDb)
		    if db=nil then
		      raise new RuntimeException
		    end if
		    m_db = db
		  #else
		    #pragma unused oDB
		    raise new UnsupportedOperationException
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Db() As Database
		  return m_db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLastInsertID() As Int64
		  var rs as RecordSet
		  rs = SQLSelect("SELECT LASTVAL();")
		  return rs.IdxField(1).Int64Value
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
		    arsPlaceholder.Append("$" + str(arsPlaceholder.Ubound + 2) )
		    aroField.Append(oField)
		  next
		  
		  var sql as String
		  sql = "INSERT INTO " + oTableInfo.sTableName
		  sql = sql + "(" + Join(arsField, ",") + ")"
		  sql = sql + " VALUES "
		  sql = sql + "(" + Join(arsPlaceholder, ",") + ") RETURNING " + oTableInfo.sPrimaryKey
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare(sql)
		  
		  dictFieldValue = BindValues(stmt, oRecord, aroField)
		  
		  var rs as Recordset = stmt.SQLSelect
		  if db.Error then
		    raise new BKS_ActiveRecord.DatabaseException(db)
		  end if
		  
		  var iRecordID as Int64 = rs.IdxField(1).Int64Value
		  dictFieldValue.Value( oTableInfo.piPrimaryKey.Name ) = iRecordID
		  
		  'store the newly saved property values
		  dictSavedPropertyValue = dictFieldValue
		  
		  return iRecordID
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
		    arsField.Append(oField.sFieldName + "=$" + str(arsField.ubound + 2) )
		    aroField.Append(oField)
		  next
		  
		  var sql as String
		  sql = "UPDATE " + oTableInfo.sTableName + " SET "
		  sql = sql + Join(arsField, ",")
		  sql = sql + " WHERE " + oTableInfo.sPrimaryKey + "=$" + str(arsField.ubound + 2)
		  
		  var stmt as PreparedSQLStatement
		  stmt = db.Prepare(sql)
		  
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


	#tag Note, Name = Note
		If you are not connecting to PostgreSQL and do not have the PostgreSQLPlugin plugin delete this class (PostgreSQLDatabaseAdapter)
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
