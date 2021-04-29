#tag Class
Protected Class Context
	#tag Method, Flags = &h0
		Function ConnectionAdapter_Count() As Integer
		  #if TargetWeb
		    //BK 04Sept2015:  Really only needed on web apps.
		    var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		    #pragma unused lck
		  #Endif
		  
		  
		  if m_dictTypeDb=nil then
		    return 0
		  end if
		  return m_dictTypeDb.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectionAdapter_Get(ty as Introspection.TypeInfo) As DatabaseAdapter
		  'Start with this class and search the hash table in BKS_ActiveRecord for
		  'a database to use.
		  #if TargetWeb
		    //BK 04Sept2015:  Really only needed on web apps.
		    var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #Endif
		  
		  var adp as BKS_ActiveRecord.DatabaseAdapter
		  
		  if m_dictTypeDb=nil then
		    return nil
		  end if
		  
		  'start with the given type and walk up the inheritance chain
		  'looking for a databsae connection
		  while ty<>nil
		    adp = m_dictTypeDb.Lookup(ty.FullName, nil )
		    if adp<>nil then
		      exit while
		    end if
		    
		    ty = ty.BaseType
		  wend
		  
		  return adp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectionAdapter_Remove(ty as Introspection.TypeInfo)
		  'Disconnect a specific active record class from the database
		  if ty=nil then
		    raise new NilObjectException
		  end if
		  
		  if not ty.IsSubclassOf( GetTypeInfo(BKS_ActiveRecord.Base) ) then
		    raise new ActiveRecordException("Invalid type. Expected a subclass of BKS_ActiveRecord.Base")
		  end if
		  
		  var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #pragma unused lck
		  if m_dictTypeDb<>nil then
		    m_dictTypeDb.Remove(ty.FullName)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectionAdapter_Set(ty as Introspection.TypeInfo, adp as BKS_ActiveRecord.DatabaseAdapter)
		  'Connect a specific active record class and all of its subclasses to a database
		  if ty=nil or adp=nil then
		    raise new NilObjectException
		  end if
		  
		  if not ty.IsSubclassOf( GetTypeInfo(BKS_ActiveRecord.Base) ) then
		    raise new ActiveRecordException("Invalid type. Expected a subclass of BKS_ActiveRecord.Base")
		  end if
		  
		  'add the database using the full type name of the type as a key
		  'Base will use this to find the appropriate adapter.
		  var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #pragma unused lck
		  if m_dictTypeDb=nil then
		    m_dictTypeDb = new Dictionary
		  end if
		  m_dictTypeDb.Value(ty.FullName) = adp
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  'Mutexes work on Mac and Linux but not Windows.
		  'CriticalSections work on Windows but not Mac.
		  '(Verified as of 2011 R4.1)
		  #if TargetWin32
		    m_cs = new CriticalSection
		  #else
		    m_cs = new Mutex("")
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableInfo_Get(ty as Introspection.TypeInfo) As BKS_ActiveRecord.P.TableInfo
		  #if TargetWeb
		    //BK 04Sept2015:  Really only needed on web apps.
		    var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #Endif
		  
		  'check the info cache and return the mapping if it exists
		  if m_dictTypeTableInfo=nil then
		    return nil
		  end if
		  
		  return m_dictTypeTableInfo.Lookup(ty.FullName, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableInfo_List() As BKS_ActiveRecord.P.TableInfo()
		  #if TargetWeb
		    //BK 04Sept2015:  Really only needed on web apps.
		    var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #Endif
		  
		  'check the info cache and return the mapping if it exists
		  var aro() as BKS_ActiveRecord.P.TableInfo
		  if m_dictTypeTableInfo=nil then
		    return aro
		  end if
		  
		  for each sKey as String in m_dictTypeTableInfo.Keys
		    var o as BKS_ActiveRecord.P.TableInfo
		    o = m_dictTypeTableInfo.Value(sKey)
		    aro.Append(o)
		  next
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TableInfo_Set(ty as Introspection.TypeInfo, oTableInfo as BKS_ActiveRecord.P.TableInfo)
		  #if TargetWeb
		    //BK 04Sept2015:  Really only needed on web apps.
		    var lck as new BKS_ActiveRecord.P.ScopedLock(m_cs)
		  #Endif
		  
		  if m_dictTypeTableInfo=nil then
		    m_dictTypeTableInfo = new Dictionary
		  end if
		  m_dictTypeTableInfo.Value(ty.FullName) = oTableInfo
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_cs As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_dictTypeDb As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_dictTypeTableInfo As Dictionary
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
