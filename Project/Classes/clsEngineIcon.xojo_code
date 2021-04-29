#tag Class
Protected Class clsEngineIcon
	#tag Method, Flags = &h0
		Sub Draw(g as Graphics)
		  // Clip
		  var gClip as Graphics = g.Clip(me.Left, me.Top, me.Width, me.Height)
		  
		  var tptOffset as new REALbasic.Point
		  
		  // Set ident
		  var tcBackground, tcText as Color
		  var tsIdent as String
		  
		  select case me.Engine
		  case DBEngine.CubeSQL
		    tsIdent = "Cb"
		    tcBackground = &c0145ae
		    tcText = &cffffff
		    
		    tptOffset.X = 1
		    
		  case DBEngine.MSSQL
		    tsIdent = "Ms"
		    tcBackground = &cffc107
		    tcText = &c212529
		    
		    tptOffset.X = 1
		    
		  case DBEngine.MySQL
		    tsIdent = "My"
		    tcBackground = &c7518b6
		    tcText = &cffffff
		    
		    tptOffset.X = 1
		    
		  case DBEngine.ODBC
		    tsIdent = "Oc"
		    tcBackground = &cdc3545
		    tcText = &cffffff
		    
		    tptOffset.X = 1
		    tptOffset.Y = 1
		    
		  case DBEngine.Postgres
		    tsIdent = "Pg"
		    tcBackground = &c28a745
		    tcText = &cffffff
		    
		  case DBEngine.SQLite
		    tsIdent = "Sq"
		    tcBackground = &c007bff
		    tcText = &cffffff
		    
		  end select
		  
		  if me.Selected = true then
		    // Draw white selection
		    gClip.ForeColor = &cffffff
		    gClip.FillOval(0, 0, gClip.Width, gClip.Height)
		    
		    gClip.ForeColor = tcBackground
		    gClip.FillOval(1, 1, gClip.Width - 2, gClip.Height - 2)
		    
		  else
		    // Draw full circle
		    gClip.ForeColor = tcBackground
		    gClip.FillOval(0, 0, gClip.Width, gClip.Height)
		    
		  end
		  
		  gClip.TextSize = 16
		  
		  var tdHeight as Double = gClip.StringHeight(tsIdent, me.Width)
		  var tdWidth as Double = gClip.StringWidth(tsIdent)
		  
		  var tdTop as Integer  = ((me.Height + tdHeight) / 2) - 4
		  var tdLeft as Integer = ((me.Width  - tdWidth ) / 2)
		  
		  #if TargetWindows then
		    tptOffset.Y = tptOffset.Y - 1
		    
		  #endif
		  
		  gClip.ForeColor = tcText
		  gClip.DrawString(tsIdent, tdLeft + tptOffset.X, tdTop + tptOffset.Y)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Engine As DBEngine
	#tag EndProperty

	#tag Property, Flags = &h0
		Height As Integer
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

	#tag Property, Flags = &h0
		Width As Integer
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
			Name="Top"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Engine"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="DBEngine"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - CubeSQL"
				"2 - MSSQL"
				"3 - MySQL"
				"4 - ODBC"
				"5 - Postgres"
				"6 - SQLite"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
	#tag EndViewBehavior
End Class
#tag EndClass
