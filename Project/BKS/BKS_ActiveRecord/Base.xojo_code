#tag Class
Protected Class Base
	#tag Method, Flags = &h0
		Function Clone() As Variant
		  var ty as Introspection.TypeInfo = Introspection.GetType( self )
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo = GetTableInfo( ty )
		  
		  var oSuperConstructor as Introspection.ConstructorInfo
		  var oCopyConstructor as Introspection.ConstructorInfo
		  var oDefaultConstructor as Introspection.ConstructorInfo
		  
		  'Look for three types of constructors (lowest priority first):
		  ' (1) Default constructors (i.e. no parameters)
		  ' (2) Constructors that take a parameter of which self's class is a subtype
		  ' (3) Constructors that take a parameter which matches this class type
		  '
		  'For example if there's a class call User derived like this:
		  ' BKS_ActiveRecord.Base -> clsActiveRecord -> User
		  'Then the program will look for constructors like the following:
		  ' (1) Constructor()
		  ' (2) Constructor(BKS_ActiveRecord.Base)
		  ' (3) Constructor(clsActiveRecord)
		  ' (4) Constructor(User)
		  'If it finds more than one it will use the one that's farthest down the list.
		  'The point of this is to give users a way of customizing how their objects
		  'get cloned, all they need to do is add the appropriate constructor
		  
		  for each o as Introspection.ConstructorInfo in ty.GetConstructors
		    var aroParam() as Introspection.ParameterInfo
		    aroParam = o.GetParameters
		    if aroParam.Ubound < 0 then
		      'default constructor
		      oDefaultConstructor = o
		    elseif aroParam.Ubound=0 and _
		      ty.IsSubclassOf( aroParam(0).ParameterType ) then
		      'copy constructor that takes a super class
		      if oSuperConstructor=nil then
		        oSuperConstructor = o
		      else
		        var aroCurrentParam() as Introspection.ParameterInfo
		        aroCurrentParam = oSuperConstructor.GetParameters
		        if aroParam(0).ParameterType.IsSubclassOf( aroCurrentParam(0).ParameterType ) then
		          'if the parameter type of this constructor is derived from the parameter type
		          'of the last one, then this one should have priority
		          oSuperConstructor = o
		        end if
		      end if
		    elseif aroParam.Ubound=0 and _
		      aroParam(0).ParameterType is ty then
		      'copy constructor that takes this class
		      oCopyConstructor = o
		      exit for
		    end if
		  next
		  
		  'Create an instance using the constructor we found
		  var oClone as Base
		  var vSelf as Variant = self
		  
		  if oCopyConstructor<>nil then
		    oClone = oCopyConstructor.Invoke( Array(vSelf) )
		  elseif oSuperConstructor<>nil then
		    oClone = oSuperConstructor.Invoke( Array(vSelf) )
		  elseif oDefaultConstructor<>nil then
		    oClone = oDefaultConstructor.Invoke
		  else
		    'we should always be able to find a default constructor
		    BKS_Debug.Assert( false, _
		    "Class does not have a default constructor" )
		    return nil
		  end if
		  
		  'Copy the properties into the new instance
		  for each oField as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		    var pi as Introspection.PropertyInfo = oField.piFieldProperty
		    if not (pi is oTableInfo.piPrimaryKey) then
		      'copy every saved property except the primary key
		      pi.Value(oClone) = pi.Value(self)
		    end if
		  next
		  
		  return oClone
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  'Empty
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rs as RecordSet)
		  ReadRecord(rs)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Db() As Database
		  return GetDatabaseAdapter.Db
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  if self.IsNew then
		    return
		  end if
		  
		  var adp as BKS_ActiveRecord.DatabaseAdapter = GetDatabaseAdapter
		  adp.BeginTransaction
		  
		  RaiseEvent BeforeDelete
		  
		  adp.DeleteRecord( self )
		  
		  RaiseEvent AfterDelete
		  
		  adp.CommitTransaction
		  
		  catch ex as RuntimeException
		    
		    adp.RollbackTransaction
		    
		    raise ex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetDatabaseAdapter() As DatabaseAdapter
		  return GetContext.ConnectionAdapter_Get(Introspection.GetType(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTableName() As String
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  Return oTableInfo.sTableName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ID() As Int64
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  return oTableInfo.piPrimaryKey.Value(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ID(assigns id as Int64)
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  oTableInfo.piPrimaryKey.Value(self) = id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsModified() As boolean
		  return IsRecordModified
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsNew() As boolean
		  return ID<=0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsRecordModified() As boolean
		  var bModified as boolean
		  
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  
		  for each oFieldInfo as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		    var pi as Introspection.PropertyInfo = oFieldInfo.piFieldProperty
		    var vProperty as Variant = pi.Value( self )
		    var vSavedValue as Variant
		    if m_dictSavedPropertyValue<>nil then
		      vSavedValue = m_dictSavedPropertyValue.Lookup(pi.Name, nil)
		    end if
		    
		    'cast the saved value so the type matches the property type
		    select case vProperty.Type
		    case Variant.TypeInteger
		      vSavedValue = vSavedValue.IntegerValue
		    case Variant.TypeInt64
		      vSavedValue = vSavedValue.Int64Value
		    case Variant.TypeSingle
		      vSavedValue = vSavedValue.SingleValue
		    case Variant.TypeDouble
		      vSavedValue = vSavedValue.DoubleValue
		    case Variant.TypeCurrency
		      vSavedValue = vSavedValue.CurrencyValue
		    case Variant.TypeString
		      vSavedValue = vSavedValue.StringValue
		    case Variant.TypeBoolean
		      vSavedValue =  vSavedValue.BooleanValue
		    case Variant.TypeColor
		      vSavedValue = vSavedValue.ColorValue
		    case Variant.TypeCurrency
		      vSavedValue = vSavedValue.CurrencyValue
		    end select
		    
		    if vProperty.Type=Variant.TypeString then
		      'do a case sensitive compare for Strings
		      if StrComp(vProperty.StringValue, vSavedValue.StringValue, 0)<>0 then
		        bModified = true
		        exit for
		      end if
		    else
		      'use the default comparison operator for everything else
		      if vProperty<>vSavedValue then
		        bModified = true
		        exit for
		      end if
		    end if
		    
		  next
		  
		  return bModified
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load(iRecordID as Int64) As boolean
		  'Load record with the given ID. Return true if the record is found.
		  var rs as RecordSet
		  
		  var ada as BKS_ActiveRecord.DatabaseAdapter = GetDatabaseAdapter
		  
		  #if BKS_ActiveRecordConfig.kIncludeCubeDatabase then
		    if ada isa BKS_ActiveRecord.cubeSQLDatabaseAdapter then
		      rs = BKS_ActiveRecord.cubeSQLDatabaseAdapter(ada).SelectRecord(self, iRecordID)
		      if rs.EOF then
		        return false
		      end if
		      
		      ReadRecord( rs )
		      
		      return true
		    end
		  #Endif
		  
		  rs = ada.SelectRecord( self, iRecordID )
		  if rs.EOF then
		    return false
		  end if
		  
		  ReadRecord( rs )
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(rhs as BKS_ActiveRecord.Base) As integer
		  if rhs is nil then
		    return 1
		  end if
		  
		  'the two records are equal if they are actually the same object or
		  'if they're the same type and have the same ID (except if they're new).
		  if rhs is self or _
		    ( Introspection.GetType(self)=Introspection.GetType(rhs) and _
		    rhs.ID=ID and not IsNew ) then
		    return 0
		  end if
		  
		  'this ordering is arbitrary. Equality is really the case we're after.
		  if ID<rhs.ID then
		    return -1
		  else
		    return 1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReadRecord(rs as RecordSet)
		  'Read current record out of rs into properties
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  
		  ReadRecord( rs, oTableInfo, m_dictSavedPropertyValue )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadRecord(rs as RecordSet, oTableInfo as BKS_ActiveRecord.P.TableInfo, byref dictSavedPropertyValue as Dictionary)
		  'Read current record out of rs into properties
		  var dictFieldValue as new Dictionary
		  
		  for each oFieldInfo as BKS_ActiveRecord.P.FieldInfo in oTableInfo.aroField
		    var oField as DatabaseField = rs.Field( oFieldInfo.sFieldName )
		    var pi as Introspection.PropertyInfo = oFieldInfo.piFieldProperty
		    
		    if oField is nil then
		      BKS_Debug.Assert( false, _
		      "A field needed to populate this record wasn't provided: " + _
		      oFieldInfo.sFieldName )
		      continue
		    end if
		    
		    var vProperty as Variant
		    
		    if pi.PropertyType.Name = "Double" then
		      if oField.Value=nil then
		        vProperty = BKS_ActiveRecord.kDoubleNullSentinal
		      else
		        vProperty = oField.Value
		      end if
		    elseif pi.PropertyType.Name = "String" then
		      var s as String = oField.StringValue
		      if Encoding(s) is nil then
		        s = DefineEncoding(s, Encodings.UTF8)
		      end if
		      vProperty = s
		    elseif pi.PropertyType.IsPrimitive then
		      vProperty = oField.Value
		    elseif pi.PropertyType = GetTypeInfo(Date) then
		      
		      var v as Variant = oField.Value
		      if v = nil or v = "" then
		        vProperty=nil
		      else
		        var dt as new Date
		        dt.SQLDateTime = v.StringValue
		        vProperty=dt
		      end if
		      
		    else
		      vProperty= oField.Value
		    end if
		    
		    pi.Value(self) = vProperty
		    dictFieldValue.Value(pi.Name) = vProperty
		    
		  next
		  
		  dictSavedPropertyValue = dictFieldValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  var adp as BKS_ActiveRecord.DatabaseAdapter = GetDatabaseAdapter
		  adp.BeginTransaction
		  
		  RaiseEvent BeforeSave
		  
		  if IsNew then
		    RaiseEvent BeforeCreate
		    
		    ID = adp.InsertRecord( self, m_dictSavedPropertyValue )
		    
		    RaiseEvent AfterSave
		    RaiseEvent AfterCreate
		  else
		    RaiseEvent BeforeUpdate
		    
		    if IsRecordModified then
		      adp.UpdateRecord(self, m_dictSavedPropertyValue)
		    end if
		    
		    RaiseEvent AfterSave
		    RaiseEvent AfterUpdate
		  end if
		  
		  adp.CommitTransaction
		  
		  exception ex as RuntimeException
		    
		    adp.RollbackTransaction
		    
		    raise ex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Validate(oError as BKS_ActiveRecord.ValidationErrors) As boolean
		  RaiseEvent Validate( oError )
		  return ( oError.ErrorCount = 0 )
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AfterCreate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AfterDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AfterSave()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AfterUpdate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeCreate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeDelete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeSave()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BeforeUpdate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Validate(oErrors as BKS_ActiveRecord.ValidationErrors)
	#tag EndHook


	#tag Property, Flags = &h21
		Private m_dictSavedPropertyValue As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
