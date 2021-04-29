#tag Class
Protected Class FieldOpt
	#tag Method, Flags = &h0
		Sub Constructor(sFieldName as String)
		  m_sFieldName = sFieldName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldName() As String
		  return m_sFieldName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ForeignKey() As BKS_ActiveRecord.FieldOpt
		  m_bForeignKey = true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ignored() As BKS_ActiveRecord.FieldOpt
		  m_bIgnored = true
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsForeignKey() As Boolean
		  return m_bForeignKey
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsIgnored() As Boolean
		  return m_bIgnored
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_bForeignKey As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_bIgnored As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_sFieldName As String
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
