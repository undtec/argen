#tag Class
Protected Class CustomizationTemplate
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub Validate()
		  redim arsErrors(-1)
		  
		  // Collect all the names
		  var tarsNames() as String
		  
		  for each toConst as ARProject.CustomizationConstant in aroConstants
		    tarsNames.Append(toConst.sName)
		    
		  next toConst
		  
		  for each toEvent as ARProject.CustomizationEvent in aroEvents
		    tarsNames.Append(toEvent.sName)
		    
		  next toEvent
		  
		  for each toMethod as ARProject.CustomizationMethod in aroMethods
		    tarsNames.Append(toMethod.sName)
		    
		  next toMethod
		  
		  for each toProperty as ARProject.CustomizationProperty in aroProperties
		    tarsNames.Append(toProperty.sName)
		    
		  next toProperty
		  
		  // Pattern ignores space for the more detailed space check error message
		  var rxValidate as new RegEx
		  rxValidate.SearchPattern = kIllegalIDECharacterRx
		  
		  // Name check
		  for each tsName as String in tarsNames
		    // Space check
		    if tsName.InStr(" ") > 0 then
		      arsErrors.Append("Customization Template - """ + tsName + """ cannot have a space in the name.")
		      
		    end
		    
		    // Illegal chars check
		    var rxmValidate as RegExMatch = rxValidate.Search(tsName)
		    while rxmValidate <> nil
		      arsErrors.Append("Customization Template - " + tsName + " has a illegal character in then name: " + _
		      rxmValidate.SubExpressionString(1))
		      
		      rxmValidate = rxValidate.Search
		      
		    wend
		    
		  next tsName
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroConstants() As ARProject.CustomizationConstant
	#tag EndProperty

	#tag Property, Flags = &h0
		aroEvents() As ARProject.CustomizationEvent
	#tag EndProperty

	#tag Property, Flags = &h0
		aroMethods() As ARProject.CustomizationMethod
	#tag EndProperty

	#tag Property, Flags = &h0
		aroProperties() As ARProject.CustomizationProperty
	#tag EndProperty

	#tag Property, Flags = &h0
		arsErrors() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedConstants As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedEvents As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedMethods As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedProperties As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedSharedMethods As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bExpandedSharedProperties As Boolean
	#tag EndProperty


	#tag Enum, Name = BlockType, Type = Integer, Flags = &h0
		Unknown
		  Constant
		  EventDefinition
		  ClassMethod
		  ClassProperty
		  SharedMethod
		SharedProperty
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
			Name="bExpandedConstants"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bExpandedEvents"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bExpandedMethods"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bExpandedProperties"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bExpandedSharedMethods"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bExpandedSharedProperties"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
