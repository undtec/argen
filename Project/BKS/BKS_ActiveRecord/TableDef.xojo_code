#tag Class
Protected Class TableDef
	#tag Method, Flags = &h0
		Sub Constructor(sTableName as String, sPrimaryKey as string, aroField() as BKS_ActiveRecord.FieldDef)
		  self.sTableName = sTableName
		  self.sPrimaryKey = sPrimaryKey
		  self.aroField = aroField
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroField() As BKS_ActiveRecord.FieldDef
	#tag EndProperty

	#tag Property, Flags = &h0
		sPrimaryKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTableName As String
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
			Name="sPrimaryKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTableName"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
	#tag EndViewBehavior
End Class
#tag EndClass
