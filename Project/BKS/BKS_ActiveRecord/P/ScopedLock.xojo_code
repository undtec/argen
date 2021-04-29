#tag Class
Protected Class ScopedLock
	#tag Method, Flags = &h0
		Sub Constructor(cs as CriticalSection)
		  if cs is nil then
		    raise new ActiveRecordException("Lock is set to Nil")
		  end if
		  m_cs = cs
		  m_cs.Enter
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  m_cs.Leave
		End Sub
	#tag EndMethod


	#tag Note, Name = Overview
		The Constructor for this class accepts a CriticalSection and immediately calls the Enter method.
		The Destructor calls Leave.
		
		You can use this class to hold a lock for the duration of the object's life. For example, if you
		create it at the beginning of a method than the lock will be held until the method is complete.
		The advantage of this is that the object will be destroyed regardless of how the method ends,
		via a return statement or an exception or whatever.
	#tag EndNote


	#tag Property, Flags = &h21
		Private m_cs As CriticalSection
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
	#tag EndViewBehavior
End Class
#tag EndClass
