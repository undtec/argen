#tag Class
Protected Class CustomizationConstant
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub Constructor()
		  me.eScope = ARProject.ItemScope.ScopePrivate
		  me.sName = "Untitled"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bLocalized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		eDataType As ARProject.CustomizationConstant.ConstantType
	#tag EndProperty

	#tag Property, Flags = &h0
		eScope As ARProject.ItemScope
	#tag EndProperty

	#tag Property, Flags = &h0
		sName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sValue As String
	#tag EndProperty


	#tag Enum, Name = ConstantType, Type = Integer, Flags = &h0
		Unknown
		  TypeBoolean
		  TypeColor
		  TypeNumber
		TypeString
	#tag EndEnum


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
		#tag ViewProperty
			Name="sName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bLocalized"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eDataType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ARProject.CustomizationConstant.ConstantType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - TypeBoolean"
				"2 - TypeColor"
				"3 - TypeNumber"
				"4 - TypeString"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="eScope"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ARProject.ItemScope"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - ScopeGlobal"
				"2 - ScopePublic"
				"3 - ScopeProtected"
				"4 - ScopePrivate"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="sValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
