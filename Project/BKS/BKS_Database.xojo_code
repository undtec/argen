#tag Module
Protected Module BKS_Database
	#tag Method, Flags = &h0
		Function SQLEscape(sql as String) As String
		  return ReplaceAll( sql, "'", "''" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SQLExecuteRaiseOnError(extends db as Database, sql as String)
		  db.SQLExecute( sql )
		  if db.Error then
		    raise new BKS_Database.DatabaseException( db.ErrorMessage, sql )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelectRaiseOnError(extends db as Database, sql as String) As RecordSet
		  var rs as RecordSet = db.SQLSelect( sql )
		  if db.Error then
		    raise new BKS_Database.DatabaseException( db.ErrorMessage, sql )
		  end if
		  return rs
		End Function
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
End Module
#tag EndModule
