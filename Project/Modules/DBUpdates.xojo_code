#tag Module
Protected Module DBUpdates
	#tag Method, Flags = &h21
		Private Function GetDBVersion(db as SQLiteDatabase) As Integer
		  var s as String = "SELECT Max(DBVersionNumber) AS CurrentVersionCode FROM T_DBVersion"
		  var rs as RecordSet = db.SQLSelectRaiseOnError(s)
		  
		  return rs.Field("CurrentVersionCode").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDBVersion(db as SQLiteDatabase, iVersion as Integer)
		  var s as String = "Insert INTO T_DBVersion(DBVersionNumber) Values (" + str(iVersion) + ");"
		  db.SQLExecuteRaiseOnError s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateDatabaseVersion_1(db as SQLiteDatabase)
		  //this is an example
		  #pragma unused db
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateDB(db as SQLiteDatabase)
		  var iDBVersion as Integer = GetDBVersion(db)
		  
		  // We are up to date
		  if iDBVersion >= kDBVersion then return
		  
		  db.SQLExecute("BEGIN TRANSACTION")
		  try
		    if iDBVersion < 1 then UpdateDatabaseVersion_1(db)
		    
		    SetDBVersion(db, kDBVersion)
		    
		    db.Commit
		    return
		    
		  catch ex as RuntimeException
		    db.Rollback
		    raise ex
		    
		  end try
		End Sub
	#tag EndMethod


	#tag Constant, Name = kDBVersion, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant


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
End Module
#tag EndModule
