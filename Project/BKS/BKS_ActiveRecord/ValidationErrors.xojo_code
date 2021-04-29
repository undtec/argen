#tag Class
Protected Class ValidationErrors
	#tag Method, Flags = &h0
		Sub Append(sMessage as String)
		  m_arsError.Append( sMessage )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  redim m_arsError( -1 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Error(index as Integer) As String
		  return m_arsError(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorCount() As integer
		  return m_arsError.Ubound + 1
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_arsError() As String
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
