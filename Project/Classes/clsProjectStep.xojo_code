#tag Class
Protected Class clsProjectStep
	#tag Method, Flags = &h0
		Sub Draw(g as Graphics)
		  // Clip
		  var gClip as Graphics = g.Clip(me.Left, me.Top, 32, 32)
		  
		  var tpIcon as new Picture(64, 64, 32)
		  tpIcon.Graphics.ForeColor = if(me.Selected, &cffffff, TextColor)
		  tpIcon.Graphics.FillRect(0, 0, 64, 64)
		  
		  select case me.eStep
		  case clsProjectStep.ProjStep.Project
		    tpIcon.ApplyMask(picMaskProject)
		    
		  case clsProjectStep.ProjStep.ClassGen
		    tpIcon.ApplyMask(picMaskClass)
		    
		  case clsProjectStep.ProjStep.UIGen
		    tpIcon.ApplyMask(picMaskUI)
		    
		  case clsProjectStep.ProjStep.Relationships
		    tpIcon.ApplyMask(picMaskRelations)
		    
		  case clsProjectStep.ProjStep.Customize
		    tpIcon.ApplyMask(picMaskCustomize)
		    
		  case clsProjectStep.ProjStep.Extras
		    tpIcon.ApplyMask(picMaskExtras)
		    
		  case clsProjectStep.ProjStep.Review
		    tpIcon.ApplyMask(picMaskReview)
		    
		  case else
		    // No icon!
		    tpIcon = new Picture(64, 64)
		    
		  end select
		  
		  gClip.DrawPicture(tpIcon, 0, 0, 32, 32, 0, 0, 64, 64)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		eStep As clsProjectStep.ProjStep
	#tag EndProperty

	#tag Property, Flags = &h0
		Left As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Selected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Top As Integer
	#tag EndProperty


	#tag Enum, Name = ProjStep, Type = Integer, Flags = &h0
		Unknown
		  Project
		  ClassGen
		  UIGen
		  Relationships
		  Customize
		  Extras
		Review
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
			Name="Selected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eStep"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="clsProjectStep.ProjStep"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Project"
				"2 - ClassGen"
				"3 - UIGen"
				"4 - Relationships"
				"5 - Customize"
				"6 - Extras"
				"7 - Review"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
