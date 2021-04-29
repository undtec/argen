#tag Class
Protected Class BKS_StopWatch
	#tag Method, Flags = &h0
		Sub Constructor()
		  m_sName = "StopWatch"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sName as String)
		  m_sName = sName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  m_dusElapsed = 0
		  m_iCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  BKS_Debug.Assert(not m_bRunning, "StopWatch: Already running")
		  
		  m_bRunning = true
		  m_dusStart = Microseconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  BKS_Debug.Assert(m_bRunning, "StopWatch: Not running")
		  
		  m_bRunning = false
		  var t as double = Microseconds - m_dusStart
		  m_dusElapsed = m_dusElapsed + t
		  
		  m_iCount = m_iCount + 1
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_iCount
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_dusElapsed / 1000.0
			End Get
		#tag EndGetter
		ElapsedTime As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  var sAvg as String
			  if Count>0 then
			    sAvg = ", Avg: " + Str(ElapsedTime/Count)
			  end if
			  
			  return Name + " (" + Str(Count) + "): " + Str(ElapsedTime) + sAvg
			End Get
		#tag EndGetter
		FullText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_bRunning
			End Get
		#tag EndGetter
		IsRunning As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_bRunning As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_dusElapsed As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_dusStart As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_iCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_sName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return m_sName
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Name + ": " + Str(ElapsedTime)
			End Get
		#tag EndGetter
		Text As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElapsedTime"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
