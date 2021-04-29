#tag Class
Protected Class ProjectData
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Function CustomTemplate() As ARProject.CustomizationTemplate
		  if moCustomization = nil then
		    moCustomization = new ARProject.CustomizationTemplate
		    
		  end
		  
		  return moCustomization
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableByName(sName as String) As ARProject.TableData
		  // Return a table data by name
		  for each toTable as ARProject.TableData in aroTables
		    if toTable.sTableName = sName then
		      return toTable
		      
		    end
		    
		  next toTable
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		aroTables() As ARProject.TableData
	#tag EndProperty

	#tag Property, Flags = &h0
		bAddAuditTrail As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bAddDBUpdateModule As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bGMTOffsetZero As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bLocalizeLabels As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bUseMBSSQLAdapter As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bVerifyClassEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moCustomization As ARProject.CustomizationTemplate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msNameSpace As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sAppBundleID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sAppCompany As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sAppName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if msNameSpace = "" then
			    msNameSpace = TPSettings.Get("DefaultNamespace", "DataFile")
			  end if
			  
			  return msNameSpace
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  msNamespace = value
			End Set
		#tag EndSetter
		sNamespace As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bAddAuditTrail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bAddDBUpdateModule"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bGMTOffsetZero"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="sAppBundleID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sAppName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sAppCompany"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sNamespace"
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
		#tag ViewProperty
			Name="bVerifyClassEnabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bLocalizeLabels"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bUseMBSSQLAdapter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
