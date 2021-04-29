#tag Module
Protected Module BKS_DateExtends
	#tag Method, Flags = &h0
		Function AddDays(Extends dt As Date, DayCount As Integer) As Date
		  const kSecondsPerDay = 86400.0
		  
		  var dtResult as new Date
		  dtResult.TotalSeconds = dt.TotalSeconds + DayCount * kSecondsPerDay
		  return dtResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextDay(Extends dt As Date) As Date
		  return dt.AddDays(1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextMonth(Extends dt As Date) As Date
		  var NextMonth As New Date
		  
		  NextMonth.TotalSeconds=dt.TotalSeconds
		  
		  If NextMonth.Month=12 Then
		    NextMonth.Month=1
		    NextMonth.Year=NextMonth.Year+1
		  Else
		    NextMonth.Month=NextMonth.Month+1
		  End If
		  
		  Return NextMonth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPreviousDay(Extends dt As Date) As Date
		  return dt.AddDays(-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPreviousMonth(Extends dt As Date) As Date
		  var NextMonth As New Date
		  
		  NextMonth.TotalSeconds=dt.TotalSeconds
		  
		  If NextMonth.Month=1 Then
		    NextMonth.Month=12
		    NextMonth.Year=NextMonth.Year-1
		  Else
		    NextMonth.Month=NextMonth.Month-1
		  End If
		  
		  Return NextMonth
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
