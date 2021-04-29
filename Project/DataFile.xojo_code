#tag Module
Protected Module DataFile
	#tag Method, Flags = &h1
		Protected Sub CloseDB()
		  if DB <> nil then
		    DB.Close
		    DB = nil
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub OpenDB()
		  var tfDB as FolderItem = App.DataFolder.Child(kDBName)
		  var toDB as new SQLiteDatabase
		  toDB.DatabaseFile = tfDB
		  
		  if tfDB.Exists = false then
		    // Create
		    call toDB.CreateDatabaseFile
		    toDB.SQLExecuteRaiseOnError(kSchema)
		    
		  else
		    // Connect
		    call toDB.Connect
		    
		  end
		  
		  //Important to tell ActiveRecord what the connection is!
		  BKS_ActiveRecord.Connect(toDB)
		  
		  'Perform any db updates that are needed before registering
		  DBUpdates.UpdateDB(toDB)
		  
		  //Register the tables with ActiveRecord
		  Register(toDB)
		  
		  DataFile.DB = toDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Register(db as SQLiteDatabase)
		  BKS_ActiveRecord.Table(db, "t_Project", GetTypeInfo(DataFile.t_Project))
		  BKS_ActiveRecord.Table(db, "t_ProjectData", GetTypeInfo(DataFile.t_ProjectData))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLizeText(Extends sText as String) As String
		  var sReturn as String
		  
		  ' Change all single apostrophes to double apostrophes.
		  sReturn = ReplaceAll(sText, "'", "''")
		  
		  ' Return the new String with apostrophe's around it already
		  Return "'" + sReturn + "'"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DB As SQLiteDatabase
	#tag EndProperty


	#tag Constant, Name = kDBName, Type = String, Dynamic = False, Default = \"Projects.sqlite", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSchema, Type = String, Dynamic = False, Default = \"DROP TABLE IF EXISTS t_DBVersion;\nCREATE TABLE t_DBVersion  (\n   DBVersion_ID INTEGER PRIMARY KEY AUTOINCREMENT\x2C\n   DBDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP\x2C\n   DBVersionNumber INTEGER\n);\n\nDROP TABLE IF EXISTS t_Project;\nCREATE TABLE t_Project (\n\t Project_ID INTEGER PRIMARY KEY AUTOINCREMENT\x2C\n\t ProjectData_ID INTEGER REFERENCES t_ProjectData(ProjectData_ID)\x2C\n\t ProjectName TEXT\x2C\n\t ProjectType INTEGER\x2C\n\t ProjectAPI INTEGER\x2C\n\t DatabaseEngine INTEGER\x2C\n\t DatabasePath TEXT\x2C\n\t DatabaseHost TEXT\x2C\n\t DatabasePort INTEGER\x2C\n\t DatabaseUsername TEXT\x2C\n\t DatabaseName TEXT\x2C\n\t DatabaseEncrypted BOOLEAN\x2C\n\t SSLConfigJSON TEXT\n);\n\nDROP TABLE IF EXISTS t_ProjectData;\nCREATE TABLE t_ProjectData (\n\tProjectData_ID INTEGER PRIMARY KEY AUTOINCREMENT\x2C\n\tProjectData BLOB\n);", Scope = Private
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
