#tag Class
Protected Class FieldDef
	#tag Method, Flags = &h0
		Sub Constructor(sFieldName as String, enFieldType as BKS_ActiveRecord.DbType, bPrimaryKey as boolean, bForeignKey as boolean)
		  self.sFieldName = sFieldName
		  self.enFieldType = enFieldType
		  self.IsPrimaryKey = bPrimaryKey
		  self.IsForeignKey = bForeignKey
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		enFieldType As BKS_ActiveRecord.DbType
	#tag EndProperty

	#tag Property, Flags = &h0
		IsForeignKey As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IsPrimaryKey As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="enFieldType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="BKS_ActiveRecord.DbType"
			EditorType="Enum"
			#tag EnumValues
				"0 - DInteger"
				"1 - DSmallInt"
				"2 - DDouble"
				"3 - DDate"
				"4 - DTime"
				"5 - DTimestamp"
				"6 - DBoolean"
				"7 - DBlob"
				"8 - DText"
				"9 - DInt64"
				"10 - DFloat"
				"11 - DCurrency"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsForeignKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPrimaryKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
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
			Name="sFieldName"
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
