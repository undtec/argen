#tag Class
Protected Class ExtraLibrary
	#tag Method, Flags = &h0
		Function ListIcon() As Picture
		  // select case me.eLibraryType
		  // case ProjectGenerator.ExtraLibrary.LibraryType.ARGenFunction
		  // return picCheck32
		  // 
		  // case ProjectGenerator.ExtraLibrary.LibraryType.TypeModule
		  // return picModule16
		  // 
		  // end select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bSelected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		eLibraryType As ProjectGenerator.ExtraLibrary.LibraryType
	#tag EndProperty

	#tag Property, Flags = &h0
		sLibraryDescription As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sLibraryName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sLibrarySource As String
	#tag EndProperty


	#tag Enum, Name = LibraryType, Type = Integer, Flags = &h0
		Unknown
		  ARGenFunction
		  TypeClass
		  TypeContainerControl
		  TypeFolder
		  TypeModule
		TypeThread
	#tag EndEnum


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
			Name="bSelected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eLibraryType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ProjectGenerator.ExtraLibrary.LibraryType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - ARGenFunction"
				"2 - TypeClass"
				"3 - TypeContainerControl"
				"4 - TypeFolder"
				"5 - TypeModule"
				"6 - TypeThread"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="sLibraryDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sLibraryName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sLibrarySource"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
