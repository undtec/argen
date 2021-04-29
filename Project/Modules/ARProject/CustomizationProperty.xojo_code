#tag Class
Protected Class CustomizationProperty
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub Constructor()
		  me.eScope = ARProject.ItemScope.ScopePrivate
		  me.sName = "Untitled"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemDeclaration() As String
		  var arsDeclaration() as String
		  
		  arsDeclaration.Append(me.sName)
		  arsDeclaration.Append("As")
		  arsDeclaration.Append(me.sDataType)
		  
		  if me.sDefaultValue <> "" then
		    arsDeclaration.Append("=")
		    
		    var tsDefVal as String = me.sDefaultValue
		    
		    if me.sDataType = "String" then
		      tsDefVal = """" + tsDefVal + """"
		      
		    end
		    
		    arsDeclaration.Append(tsDefVal)
		    
		  end
		  
		  return Join(arsDeclaration, " ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SourceDefinition() As String
		  if me.bShared = true then
		    return "Shared " + me.ItemDeclaration
		    
		  else
		    return me.ItemDeclaration
		    
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bShared As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		eScope As ARProject.ItemScope
	#tag EndProperty

	#tag Property, Flags = &h0
		sDataType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sDefaultValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sName As String
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
		#tag ViewProperty
			Name="bShared"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="sDataType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sDefaultValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
