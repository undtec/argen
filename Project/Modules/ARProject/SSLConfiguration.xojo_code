#tag Class
Protected Class SSLConfiguration
Inherits BKS_JSONResource.Base
	#tag Property, Flags = &h0
		fAuthority As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		fAuthorityDirectory As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		fKey As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		fSSLCertificate As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		iPostgresSSLMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sCipher As String = "DHE-RSA-AES256-SHA"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="sCipher"
			Visible=false
			Group="Behavior"
			InitialValue="DHE-RSA-AES256-SHA"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iPostgresSSLMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
