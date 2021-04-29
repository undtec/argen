#tag Class
Protected Class BKS_Thread
Inherits Thread
	#tag Event
		Sub Run()
		  PushEvent kStart
		  
		  try
		    RaiseEvent Run
		    
		  catch ex as RuntimeException
		    exKilledMessage = ex
		    
		    PushEvent kKilled
		    
		  end
		  
		  PushEvent kFinished
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  mLock = New CriticalSection
		  mTimer = new Timer
		  AddHandler mTimer.action, WeakAddressOf DispatchEvents
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DispatchEvents(sender as timer)
		  #pragma unused sender
		  
		  While True
		    var sEvent as String
		    var dUI as dictionary
		    
		    mLock.Enter
		    
		    If arsEvents.UBound >= 0 Then
		      sEvent = arsEvents( 0 )
		      arsEvents.Remove( 0 )
		      RaiseEvent HandleEvent sEvent
		    End If
		    
		    If arUIUpdates.Ubound >= 0 then
		      dUI = arUIUpdates(0)
		      arUIUpdates.Remove 0
		      RaiseEvent UIUpdate dUI
		    end
		    
		    if arsEvents.Ubound = -1 and arUIUpdates.Ubound = -1 then
		      mLock.Leave
		      exit
		    end
		    
		    mLock.Leave
		    
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PushEvent(sEvent as String)
		  mLock.Enter
		  
		  arsEvents.Append sEvent
		  
		  mTimer.Period = 0
		  mTimer.Mode = Timer.ModeSingle
		  
		  mLock.Leave
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PushUIUpdate(d as dictionary)
		  mLock.Enter
		  
		  arUIUpdates.Append d
		  
		  mTimer.Period = 0
		  mTimer.Mode = Timer.ModeSingle
		  
		  mLock.Leave
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateUI(d as dictionary)
		  PushUIUpdate d
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HandleEvent(sEvent As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Run()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UIUpdate(d as Dictionary)
	#tag EndHook


	#tag Property, Flags = &h21
		Private arsEvents() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private arUIUpdates() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		exKilledMessage As RuntimeException
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Timer
	#tag EndProperty


	#tag Constant, Name = kFinished, Type = String, Dynamic = False, Default = \"Finished", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKilled, Type = String, Dynamic = False, Default = \"Killed", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStart, Type = String, Dynamic = False, Default = \"Start", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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
	#tag EndViewBehavior
End Class
#tag EndClass
