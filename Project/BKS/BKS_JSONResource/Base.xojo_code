#tag Class
Protected Class Base
	#tag Method, Flags = &h21
		Private Sub constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromJSON(oItem as JSONItem)
		  #Pragma NilObjectChecking false
		  #Pragma DisableBoundsChecking  false
		  if not oItem.HasName(self.GetName) then
		    raise new RuntimeException
		  end if
		  var o as JSONItem = oItem.Value(self.GetName)
		  
		  for each oProperty as Introspection.PropertyInfo in Introspection.GetType(self).GetProperties
		    if oProperty.IsComputed then Continue
		    if oProperty.IsShared then Continue
		    var oPropertyType as Introspection.TypeInfo = oProperty.PropertyType
		    // var sName as String = oProperty.Name
		    
		    select case true
		    case oPropertyType.IsPrimitive, oPropertyType.Name = "Date"
		      FromJSONPrimitive(o, oProperty, oPropertyType)
		      
		    case oPropertyType.IsEnum
		      FromJSONEnum(o, oProperty, oPropertyType)
		      
		    case oPropertyType.Name = "Picture"
		      FromJSONPicture(o, oProperty)
		      
		    case oPropertyType.Name = "JSONItem"
		      FromJSON_JSONItem(o, oProperty)
		      
		    case oPropertyType.IsArray
		      FromJSONArray(o, oProperty)
		      
		    case oPropertyType.IsClass
		      if oPropertyType.BaseType <> nil then
		        // Classes, but only subclasses of BKS_JSONResource.Base
		        FromJSONObject(o,oProperty)
		        
		      end if
		      
		    end select
		    
		  next
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONArray(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  #Pragma NilObjectChecking false
		  #Pragma DisableBoundsChecking  false
		  
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  // var sName as String = oProperty.Name
		  var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  
		  // Array of Primitive types Integer, String, etc
		  if oElementType.IsPrimitive  or oElementType.Name = "Date" then
		    FromJSONArrayPrimitive o, oProperty
		    Return
		  end if
		  
		  if oElementType.Name = "Picture" then
		    FromJSONArrayPicture o, oProperty
		    Return
		  end if
		  
		  if oElementType.Name = "JSONItem" then
		    FromJSONArrayJSONItem o, oProperty
		    Return
		  end if
		  
		  //Is an array of JSON Resources
		  if oElementType.IsSubclassOf (GetTypeInfo(BKS_JSONResource.Base)) then
		    FromJSONArrayObject o, oProperty
		    Return
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONArrayJSONItem(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  #Pragma BreakOnExceptions false
		  // var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  // var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  var aroJSONArray as JSONItem = o.Value(sName)
		  var aroObjects() as Object = oProperty.Value(self)
		  
		  for i as Integer = aroObjects.Ubound DownTo 0
		    aroObjects.Remove(i)
		  next
		  
		  for i as integer = 0 to aroJSONArray.Count - 1
		    var sData as String
		    try
		      sData = aroJSONArray.Value(i)
		    catch ex as JSONException
		      //Do nothing
		    end try
		    
		    if sData = "" then
		      aroObjects.Append nil
		      Continue
		    end if
		    sData = DecodeBase64(sData)
		    try
		      aroObjects.Append new JSONItem(sData)
		    catch ex as JSONException
		      //Do Nothing
		    end try
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONArrayObject(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  #Pragma BreakOnExceptions false
		  #Pragma NilObjectChecking false
		  #Pragma DisableBoundsChecking  false
		  
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  var aroJSONArray as JSONItem = o.Value(sName)
		  var aroObjects() as Object = oProperty.Value(self)
		  
		  for i as Integer = aroObjects.Ubound DownTo 0
		    aroObjects.Remove(i)
		  next
		  
		  
		  var aroConstructors() As Introspection.ConstructorInfo = oElementType.GetConstructors()
		  if aroConstructors.Ubound = -1 then Return
		  
		  if aroJSONArray.IsArray = false then Return
		  for i as integer = 0 to aroJSONArray.Count - 1
		    var oItem as JSONItem
		    try
		      #Pragma BreakOnExceptions false //For some reason putting at the top doesn't work.
		      oItem = aroJSONArray.Value(i)
		    catch ex as RuntimeException
		      aroObjects.Append nil
		      Continue
		    end try
		    var oObj as BKS_JSONResource.Base = aroConstructors( 0 ).Invoke()
		    if oObj = nil then Continue
		    oObj.FromJSON oItem
		    aroObjects.Append oObj
		    
		  next
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONArrayPicture(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  // var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  // var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  var aroJSONArray as JSONItem = o.Value(sName)
		  var aroObjects() as Object = oProperty.Value(self)
		  
		  for i as Integer = aroObjects.Ubound DownTo 0
		    aroObjects.Remove(i)
		  next
		  
		  for i as integer = 0 to aroJSONArray.Count - 1
		    var sData as String
		    try
		      sData = aroJSONArray.Value(i)
		    catch
		      //Do nothing
		    end try
		    
		    if sData = "" then
		      aroObjects.Append nil
		      Continue
		    end if
		    sData = DecodeBase64(sData)
		    try
		      aroObjects.Append Picture.FromData(sData)
		    catch ex as RuntimeException
		      //Do Nothing
		    end try
		    
		  next
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONArrayPrimitive(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  var aroJSONArray as JSONItem = o.Value(sName)
		  
		  
		  // var v as Variant = oProperty.Value(self)
		  // var iTemp as integer = oProperty.Value(self).ArrayElementType
		  
		  select case oProperty.Value(self).ArrayElementType
		    
		  case Variant.TypeInteger
		    var ariInteger() as Integer
		    oProperty.Value(self) = ariInteger
		    
		    if aroJSONArray.IsArray = false then Return
		    
		    for i as integer = 0 to aroJSONArray.Count - 1
		      ariInteger.Append aroJSONArray.Value(i)
		    next
		  case Variant.TypeInt64
		    var ariInteger() as Int64
		    oProperty.Value(self) = ariInteger
		    
		    if aroJSONArray.IsArray = false then Return
		    
		    for i as integer = 0 to aroJSONArray.Count - 1
		      ariInteger.Append aroJSONArray.Value(i)
		    next
		  case Variant.TypeDouble
		    var ardDouble() as Double
		    oProperty.Value(self) = ardDouble
		    if aroJSONArray.IsArray = false then Return
		    for i as integer = 0 to aroJSONArray.Count - 1
		      ardDouble.Append aroJSONArray.Value(i)
		    next
		    
		  case Variant.TypeBoolean
		    var arbBool() as Boolean
		    oProperty.Value(self) = arbBool
		    if aroJSONArray.IsArray = false then Return
		    for i as integer = 0 to aroJSONArray.Count - 1
		      arbBool.Append aroJSONArray.Value(i)
		    next
		    
		  case Variant.TypeCurrency
		    var arbCurrency() as Currency
		    oProperty.Value(self) = arbCurrency
		    if aroJSONArray.IsArray = false then Return
		    for i as integer = 0 to aroJSONArray.Count - 1
		      arbCurrency.Append aroJSONArray.Value(i)
		    next
		    
		  case Variant.TypeString
		    var arsString() as String
		    oProperty.Value(self) = arsString
		    if aroJSONArray.IsArray = false then Return
		    for i as integer = 0 to aroJSONArray.Count - 1
		      arsString.Append aroJSONArray.Value(i)
		    next
		    
		  case Variant.TypeColor
		    var arcColor() as Color
		    oProperty.Value(self) = arcColor
		    if aroJSONArray.IsArray = false then Return
		    for i as integer = 0 to aroJSONArray.Count - 1
		      var sColor as String = aroJSONArray.Value(i)
		      if sColor = "" then Continue
		      var vColor as Variant = sColor
		      arcColor.Append vColor.ColorValue
		      
		    next
		    
		    
		  case Variant.TypeDate
		    var arDates() as Date
		    
		    if oElementType.Name <> "Date" then Return
		    oProperty.Value(self) = arDates
		    
		    if aroJSONArray.IsArray = false then Return
		    
		    for i as integer = 0 to aroJSONArray.Count - 1
		      var sDate as String = aroJSONArray.Value(i)
		      if sDate = "" then
		        arDates.Append nil
		        Continue
		      end if
		      var dt as new date
		      dt.SQLDateTime = sDate
		      arDates.Append dt
		      
		    next
		    
		  case Variant.TypeObject
		    if oElementType.Name <> "Date" then Return
		    
		    var arDates() as Date
		    oProperty.Value(self) = arDates
		    
		    if aroJSONArray.IsArray = false then Return
		    
		    for i as integer = 0 to aroJSONArray.Count - 1
		      var sDate as String = aroJSONArray.Value(i)
		      if sDate = "" then
		        arDates.Append nil
		        Continue
		      end if
		      var dt as new date
		      dt.SQLDateTime = sDate
		      arDates.Append dt
		      
		    next
		    
		    
		  case else
		    break //I added the common ones, if you need more add them.
		    
		  end Select
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONEnum(o as JSONItem, oProperty as Introspection.PropertyInfo, oPropertyType as Introspection.TypeInfo)
		  var sName as String = oProperty.Name
		  oProperty.Value(self) = o.Lookup(sName, 0)
		  
		  #pragma unused oPropertyType
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONObject(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  #Pragma BreakOnExceptions false
		  #Pragma NilObjectChecking false
		  #Pragma DisableBoundsChecking  false
		  
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  
		  oProperty.Value(self) = nil
		  if not o.HasName(sName) then Return
		  var oNewJSONObject as JSONItem
		  
		  try
		    oNewJSONObject =  o.Value(sName)
		  catch ex as RuntimeException
		    Return
		  end try
		  
		  
		  var aroConstructors() As Introspection.ConstructorInfo = oPropertyType.GetConstructors()
		  if aroConstructors.Ubound = -1 then Return
		  
		  var oObj as BKS_JSONResource.Base = aroConstructors( 0 ).Invoke()
		  if oObj = nil then Return
		  oProperty.Value(self) = oObj
		  oObj.FromJSON oNewJSONObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONPicture(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  oProperty.Value(self) = nil
		  var sName as String = oProperty.Name
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  
		  var sData as String =  o.Lookup(sName, "")
		  if sData = "" then Return
		  sData = DecodeBase64(sData)
		  try
		    oProperty.Value(self)  = Picture.FromData(sData)
		  catch ex as RuntimeException
		    //Do Nothing
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSONPrimitive(o as JSONItem, oProperty as Introspection.PropertyInfo, oPropertyType as Introspection.TypeInfo)
		  var sName as String = oProperty.Name
		  
		  var v as Variant = oProperty.Value(self)
		  
		  if not o.HasName(sName) then
		    ' break
		    // var i as integer
		    Return
		  end if
		  
		  
		  select case v.Type
		    
		  case Variant.TypeInteger,Variant.TypeDouble,Variant.TypeCurrency, Variant.TypeInt64
		    oProperty.Value(self) = o.Lookup(sName, 0)
		    
		  case Variant.TypeBoolean
		    oProperty.Value(self) = o.Lookup(sName, False)
		    
		  case Variant.TypeString
		    oProperty.Value(self) = o.Lookup(sName, "")
		    
		  case Variant.TypeColor
		    var sColor as String = o.Lookup(sName, "")
		    if sColor <> "" then
		      var vColor as Variant = sColor
		      oProperty.Value(self)  = vColor.ColorValue
		    end
		    
		  case Variant.TypeDate
		    oProperty.Value(self) = nil
		    var sDate as String = o.Lookup(sName, "")
		    if sDate <> "" then
		      var dt as new Date
		      dt.SQLDateTime = sDate
		      oProperty.Value(self) = dt
		    end if
		    
		    
		  case else
		    if v = nil AND oPropertyType.Name = "Date" Then
		      oProperty.Value(self) = nil
		      var sDate as String = o.Lookup(sName, "")
		      if sDate <> "" then
		        var dt as new Date
		        dt.SQLDateTime = sDate
		        oProperty.Value(self) = dt
		      end if
		    else
		      break //I added the common ones, if you need more add them.
		    end if
		    
		    
		  end Select
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FromJSON_JSONItem(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  oProperty.Value(self) = nil
		  var sName as String = oProperty.Name
		  
		  if o.HasName(sName) = false then
		    break
		    Return
		  end if
		  
		  var sData as String =  o.Lookup(sName, "")
		  if sData = "" then Return
		  sData = DecodeBase64(sData)
		  try
		    oProperty.Value(self) = new JSONItem(sData)
		  catch ex as RuntimeException
		    //Do Nothing
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetName() As String
		  return BKS_JSONResource.Base.JSONResourceName(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function JSONResourceName(oJSONResource as BKS_JSONResource.Base) As String
		  var t as Introspection.TypeInfo
		  t=Introspection.GetType(oJSONResource)
		  Return t.name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJSON() As JSONItem
		  var o as new JSONItem
		  
		  for each oProperty as Introspection.PropertyInfo in Introspection.GetType(self).GetProperties
		    // var sName as String = oProperty.Name
		    if oProperty.IsComputed then Continue
		    if oProperty.IsShared then Continue
		    
		    var oPropertyType as Introspection.TypeInfo = oProperty.PropertyType
		    
		    select case true
		    case oPropertyType.IsPrimitive, oPropertyType.Name = "Date"
		      ToJSONPrimitive(o, oProperty, oPropertyType)
		      
		    case oPropertyType.IsEnum
		      ToJSONEnum(o, oProperty, oPropertyType)
		      
		    case oPropertyType.Name = "Picture"
		      ToJSONPicture(o, oProperty)
		      
		    case oPropertyType.Name = "JSONItem"
		      ToJSON_JSONItem(o, oProperty)
		      
		    case oPropertyType.IsArray
		      ToJSONArray(o, oProperty)
		      
		    case oPropertyType.IsClass
		      if oPropertyType.BaseType <> nil then
		        // Classes, but only subclasses of BKS_JSONResource.Base
		        ToJSONObject(o,oProperty)
		        
		      end if
		      
		    end select
		    
		  next
		  
		  
		  var oItem as new JSONItem
		  oItem.Value(self.GetName) = o
		  return oItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONArray(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  // var sName as String = oProperty.Name
		  var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  
		  //Array of Primitive types Integer, String, etc
		  if oElementType.IsPrimitive  or oElementType.Name = "Date" then
		    ToJSONArrayPrimitive o, oProperty
		    Return
		  end if
		  
		  if oElementType.Name = "Picture" then
		    ToJSONArrayPicture o, oProperty
		    Return
		  end if
		  
		  if oElementType.Name = "JSONItem" then
		    ToJSONArrayJSONItem o, oProperty
		    Return
		  end if
		  
		  
		  //Is an array of JSON Resources
		  if oElementType.IsSubclassOf (GetTypeInfo(BKS_JSONResource.Base)) then
		    ToJSONArrayObject o, oProperty
		    Return
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONArrayJSONItem(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  // var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  
		  var oJSONArray as new JSONItem
		  var aroObj() as Object = oProperty.Value(self)
		  
		  
		  for each obj as Object in aroObj
		    if obj = nil then
		      oJSONArray.append ""
		      Continue
		    end if
		    var oJSON as JSONItem = JSONItem(obj)
		    oJSONArray.append EncodeBase64(oJSON.ToString, 0)
		  next
		  o.Value(sName) = oJSONArray
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONArrayObject(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  // var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  
		  var oJSONArray as new JSONItem
		  
		  var aroObj() as Object = oProperty.Value(self)
		  for each obj as Object in aroObj
		    if obj = nil then
		      oJSONArray.Append ""
		      Continue
		    end if
		    
		    var oObj as BKS_JSONResource.Base = BKS_JSONResource.Base(obj)
		    oJSONArray.Append oObj.ToJSON
		  next
		  o.Value(sName) = oJSONArray
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONArrayPicture(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  // var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  
		  var oJSONArray as new JSONItem
		  var aroObj() as Object = oProperty.Value(self)
		  
		  
		  for each obj as Object in aroObj
		    if obj = nil then
		      oJSONArray.append ""
		      Continue
		    end if
		    var pic as Picture = Picture(obj)
		    oJSONArray.append EncodeBase64(pic.GetData(Picture.FormatPNG), 0)
		  next
		  o.Value(sName) = oJSONArray
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONArrayPrimitive(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  #Pragma BreakOnExceptions false
		  #Pragma NilObjectChecking false
		  #Pragma DisableBoundsChecking  false
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  var oElementType as Introspection.TypeInfo = oPropertyType.GetElementType
		  
		  var oJSONArray as new JSONItem
		  
		  var v as Variant = oProperty.Value(self)
		  
		  // var iTemp as integer = oProperty.Value(self).ArrayElementType
		  
		  select case oProperty.Value(self).ArrayElementType
		    
		  case Variant.TypeInteger
		    var ariInteger() as Integer = v
		    for each i as Integer in ariInteger
		      oJSONArray.Append i
		    next
		    
		  case Variant.TypeInt64
		    var ariInteger() as Int64 = v
		    for each i as Integer in ariInteger
		      oJSONArray.Append i
		    next
		  case Variant.TypeDouble
		    var ardDouble() as Double = v
		    for each d as Double in ardDouble
		      oJSONArray.Append d
		    next
		    
		  case Variant.TypeBoolean
		    var arbBool() as Boolean = v
		    for each b as Boolean in arbBool
		      oJSONArray.Append b
		    next
		    
		  case Variant.TypeCurrency
		    var arbCurrency() as Currency = v
		    for each cur as Currency in arbCurrency
		      oJSONArray.Append cur
		    next
		    
		  case Variant.TypeString
		    var arsString() as String = v
		    for each s as String in arsString
		      oJSONArray.Append s
		    next
		    
		  case Variant.TypeColor
		    var arcColor() as Color = v
		    for each c as Color in arcColor
		      oJSONArray.Append str(c)
		    next
		    
		  case Variant.TypeDate
		    var arDates() as Date = v
		    for each dt as Date in arDates
		      if dt <> nil then
		        oJSONArray.Append dt.SQLDateTime
		      else
		        oJSONArray.Append ""
		      end if
		      
		    next
		    
		  case  Variant.TypeObject
		    if oElementType.Name = "Date" then
		      
		      try
		        var aroObj() as Object = v
		        for each obj as Object in aroObj
		          var vDate as Variant = obj
		          
		          if vDate <> nil then
		            oJSONArray.Append vDate.DateValue.SQLDateTime
		          else
		            oJSONArray.Append ""
		          end if
		          
		        next
		        Goto EXIT_PROC
		      catch ex as TypeMismatchException
		        
		      end try
		      
		      try
		        var arDates() as Date = v
		        for each dt as Date in arDates
		          if dt <> nil then
		            oJSONArray.Append dt.SQLDateTime
		          else
		            oJSONArray.Append ""
		          end if
		        next
		      catch ex as TypeMismatchException
		        Goto EXIT_PROC
		      end try
		      
		    end if
		    
		    
		  case else
		    break //I added the common ones, if you need more add them.
		    
		  end Select
		  
		  EXIT_PROC:
		  o.Value(sName) = oJSONArray
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONEnum(o as JSONItem, oProperty as Introspection.PropertyInfo, oPropertyType as Introspection.TypeInfo)
		  var sName as String = oProperty.Name
		  var vValue as Variant = oProperty.Value(self)
		  
		  o.Value(sName) = vValue
		  
		  #pragma unused oPropertyType
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONObject(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  var oPropertyType  As Introspection.TypeInfo = oProperty.PropertyType
		  var sName as String = oProperty.Name
		  
		  
		  if Not oPropertyType.IsSubclassOf (GetTypeInfo(BKS_JSONResource.Base)) then Return
		  var v as Variant = oProperty.Value(self)
		  var oObj as BKS_JSONResource.Base = BKS_JSONResource.Base(v)
		  
		  if oObj <> nil then
		    o.Value(sName) = oObj.ToJSON
		  else
		    o.Value(sName) = ""
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONPicture(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  var sName as String = oProperty.Name
		  var pic as Picture = Picture(oProperty.Value(self))
		  
		  var sPictureData as String
		  
		  if pic <> nil then
		    sPictureData = EncodeBase64(pic.GetData(Picture.FormatPNG), 0)
		  end if
		  
		  
		  o.Value(sName) = sPictureData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSONPrimitive(o as JSONItem, oProperty as Introspection.PropertyInfo, oPropertyType as Introspection.TypeInfo)
		  var sName as String = oProperty.Name
		  
		  var vValue as Variant = oProperty.Value(self)
		  
		  var iType as integer = vValue.Type
		  if iType = 0 and oPropertyType.Name = "Date" then
		    iType = Variant.TypeDate
		  end if
		  
		  select case iType
		  case Variant.TypeInteger
		    o.Value(sName) = vValue.IntegerValue
		  case Variant.TypeInt64
		    o.Value(sName) = vValue.Int64Value
		    
		  case Variant.TypeDouble
		    o.Value(sName) = vValue.DoubleValue
		    
		  case Variant.TypeBoolean
		    o.Value(sName) = vValue.BooleanValue
		    
		  case Variant.TypeCurrency
		    o.Value(sName) = vValue.CurrencyValue
		    
		  case Variant.TypeString
		    o.Value(sName) = vValue.StringValue
		    
		  case Variant.TypeColor
		    o.Value(sName) = str(vValue.ColorValue)
		    
		  case Variant.TypeDate
		    if vValue.DateValue <> nil then
		      o.Value(sName) =vValue.DateValue.SQLDateTime
		    else
		      o.Value(sName) = ""
		    end if
		    
		  case else
		    break //I added the common ones, if you need more add them.
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToJSON_JSONItem(o as JSONItem, oProperty as Introspection.PropertyInfo)
		  var sName as String = oProperty.Name
		  var oObject as JSONItem = JSONItem(oProperty.Value(self))
		  
		  var sData as String = oObject.ToString
		  
		  if oObject <> nil then
		    sData = EncodeBase64(sData, 0)
		  end if
		  
		  
		  o.Value(sName) = sData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Return self.ToJSON.ToString
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
End Class
#tag EndClass
