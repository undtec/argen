#tag Class
Protected Class ClassPropertyInfo
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h21
		Private Function ColumnName(rs as RecordSet) As String
		  var iIndex as integer = -1
		  'Oracle FieldSchema it is Column_Name
		  for i as Integer = 0 to rs.FieldCount - 1
		    select case rs.IdxField(i+1).Name
		    case "ColumnName","Column_Name"
		      iIndex = i + 1
		    end select
		  next
		  
		  if iIndex > -1 then
		    Return rs.IdxField(iIndex).StringValue
		  else
		    Return "unknown"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Require RecordSet
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(DummyInstance as Boolean)
		  // Only for use in the Popup Menu
		  self.Constructor
		  #pragma unused DummyInstance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rs as RecordSet)
		  self.Constructor
		  var iNameIndex as integer = -1
		  var iTypeIndex as Integer = -1
		  var iIsPrimaryIndex as Integer = -1
		  
		  for i as Integer = 0 to rs.FieldCount - 1
		    select case rs.IdxField(i+1).Name.Lowercase
		    case "columnname","column_name"
		      iNameIndex = i + 1
		    case "fieldtype","data_type"
		      iTypeIndex = i + 1
		    case "IsPrimary",""
		      iIsPrimaryIndex = i + 1
		    end select
		  next
		  
		  sColumnName = ColumnName(rs)
		  iDBFieldSchemaType = DBSchemaFieldType(rs)
		  SetFieldType
		  
		  if Field_IsPrimary(rs) then
		    sPrimaryKeyField = sColumnName
		    bIsPrimary = true
		    
		  end
		  
		  // Set defaults
		  sLabelText = sColumnName
		  
		  // Will perform the first true item
		  select case true
		  case bIsPrimary
		    eUIType = UIType.ControlLabel
		    
		  case (eFieldType = FieldType.FieldBoolean)
		    eUIType = UIType.ControlCheckbox
		    
		  case else
		    // No preferred default, use TextField
		    eUIType = UIType.ControlTextField
		    
		  end select
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DBSchemaFieldType(rs as RecordSet) As Integer
		  var iIndex as integer = -1
		  'Oracle FieldSchema it is Data_Type
		  for i as Integer = 0 to rs.FieldCount - 1
		    select case rs.IdxField(i+1).Name
		    case "FieldType","Data_Type"
		      iIndex = i + 1
		    end select
		  next
		  
		  if iIndex > -1 then
		    Return rs.IdxField(iIndex).IntegerValue
		  else
		    Return 0
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Function DefaultInitControlProperty() As String
		  var s as String
		  select case iControlType
		  case 0
		    'Do Nothing
		    
		  case kControlTextbox,kControlLabel,kControlTextArea,kControlPasswordField
		    s = "Text"
		    
		  case kControlPopup,kControlListbox
		    s = "SetID"
		    
		  case kControlCheckbox
		    s = "Value"
		    
		  case else
		    break
		  end select
		  if s <> "" Then
		    s = sControlName + "." + s
		  end if
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayDBFieldSchemaFieldType() As String
		  var sType as String
		  select case iDBFieldSchemaType
		  case 1
		    sType = "Byte"
		  case 2
		    sType = "SmallInt"
		  case 3
		    sType = "Integer"
		  case 4
		    sType = "Char"
		  case 5
		    sType = "Text"
		  case 6
		    sType = "Float"
		  case 7
		    sType = "Double"
		  case 8
		    sType = "Date"
		  case 9 
		    sType = "Time"
		  case 10
		    sType = "Timestamp"
		  case 11
		    sType = "Currency"
		  case 12
		    sType = "Boolean"
		  case 13
		    sType = "Decimal"
		  case 14
		    sType = "Binary"
		  case 15, 16
		    sType = "BLOB"
		  case 17
		    sType = "MacPICT"
		  case 18
		    sType = "String"
		  case 19
		    sType = "Int64"
		  case else
		    break
		    sType = "Unknown"
		  end select
		  
		  Return sType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncodeLabelText() As String
		  var s as String = sLabelText
		  s = s.ReplaceAll("<","&lt;")
		  s = s.ReplaceAll(">","&gt;")
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Field_IsPrimary(rs as RecordSet) As Boolean
		  
		  'Oracle FieldSchema does not have this info so, calling rs.Field("IsPrimary") throws an exception
		  for i as Integer = 0 to rs.FieldCount - 1
		    select case rs.IdxField(i+1).Name
		    case "IsPrimary"
		      Return rs.IdxField(i+1).BooleanValue
		    end select
		  next
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetControlName() As String
		  var bControlPrefix as Boolean = TPSettings.Get("kUIPrefixes", true)
		  var sControlPrefix, sControlSuffix as String
		  
		  select case me.eUIType
		  case UIType.ControlCheckbox
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kCheckbox", "chk")
		    else
		      sControlSuffix = TPSettings.Get("kCheckboxSuffix", "Checkbox")
		    end if
		    
		  case UIType.ControlLabel
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kLabel", "lbl")
		    else
		      sControlSuffix = TPSettings.Get("kLabelSuffix", "Label")
		    end if
		    
		  case UIType.ControlListbox
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kListbox", "lb")
		    else
		      sControlSuffix = TPSettings.Get("kListboxSuffix", "List")
		    end if
		    
		  case UIType.ControlPopupMenu
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kPopup", "pm")
		    else
		      sControlSuffix = TPSettings.Get("kPopupSuffix", "Popup")
		    end if
		    
		  case UIType.ControlTextArea
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kTextArea", "lb")
		    else
		      sControlSuffix = TPSettings.Get("kTextAreaSuffix", "TextArea")
		    end if
		    
		  case UIType.ControlPassword
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kPasswordField", "txt")
		    else
		      sControlSuffix = TPSettings.Get("kPasswordFieldSuffix", "Password")
		    end if
		    
		  case UIType.ControlTextField
		    if bControlPrefix then
		      sControlPrefix = TPSettings.Get("kTextField", "txt")
		    else
		      sControlSuffix = TPSettings.Get("kTextFieldSuffix", "TextField")
		    end if
		    
		  end select
		  
		  return sControlPrefix + sColumnName + sControlSuffix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPropertyName() As String
		  var bUsePrefixes as Boolean = TPSettings.Get("kClassPrefixes", true)
		  var bUseSuffixes as Boolean = TPSettings.Get("kClassSuffixes", false)
		  
		  var sPrefix, sSuffix as String
		  
		  select case eFieldType
		  case ARProject.FieldType.FieldDate
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kDateTime", "dt")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kDateTimeSuffix", "_dt")
		    end
		  case ARProject.FieldType.FieldString
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kString", "s")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kStringSuffix", "_s")
		    end
		  case ARProject.FieldType.FieldDouble
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kDouble", "d")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kDoubleSuffix", "_d")
		    end
		  case ARProject.FieldType.FieldBoolean
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kBoolean", "b")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kBooleanSuffix", "_b")
		    end
		  case ARProject.FieldType.FieldInteger, _
		    ARProject.FieldType.FieldInt64
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kInteger", "i")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kIntegerSuffix", "_i")
		    end
		  case ARProject.FieldType.FieldCurrency
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kCurrency", "c")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kCurrencySuffix", "_c")
		    end
		  case ARProject.FieldType.Unknown
		    if bUsePrefixes then
		      sPrefix = TPSettings.Get("kString", "s")
		    end
		    if bUseSuffixes then
		      sSuffix = TPSettings.Get("kStringSuffix", "_s")
		    end
		  case else
		    break
		  end select
		  
		  return sPrefix + sColumnName + sSuffix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPropertyType(teProjectType as ProjectType, iProjectAPI as Integer) As String
		  select case eFieldType
		  case ARProject.FieldType.FieldDate
		    if teProjectType = ProjectType.iOS then
		      return "Xojo.Core.Date"
		      
		    else
		      if iProjectAPI = 1 then
		        return "Date"
		        
		      elseif iProjectAPI = 2 then
		        return "DateTime"
		        
		      end
		      
		    end
		    
		  case ARProject.FieldType.FieldString, _
		    ARProject.FieldType.Unknown
		    if teProjectType = ProjectType.iOS then
		      return "Text"
		      
		    else
		      return "String"
		      
		    end
		    
		  case ARProject.FieldType.FieldBoolean
		    return "Boolean"
		    
		  case ARProject.FieldType.FieldDouble
		    return "Double"
		    
		  case ARProject.FieldType.FieldInteger
		    return "Integer"
		    
		  case ARProject.FieldType.FieldInt64
		    return "Int64"
		    
		  case ARProject.FieldType.FieldCurrency
		    return "Currency"
		    
		  case ARProject.FieldType.Unknown
		    return "Unknown"
		    
		  case else
		    break
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFieldType()
		  select case iDBFieldSchemaType
		  case 8, 9, 10
		    eFieldType = FieldType.FieldDate
		    
		  case 4, 5, 14, 15, 18, 16 
		    eFieldType = FieldType.FieldString
		    
		  case 6, 7, 13
		    eFieldType = FieldType.FieldDouble
		    
		  case 12, 1
		    eFieldType = FieldType.FieldBoolean
		    
		  case 19, 3, 2
		    eFieldType = FieldType.FieldInteger
		    
		  case 19
		    eFieldType = FieldType.FieldInt64
		    
		  case 11
		    eFieldType = FieldType.FieldCurrency
		    
		  case 255
		    // Unknown
		    
		  case else
		    // New
		    break
		    
		  end select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bIncludeInListbox As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		bInitialSortField As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bIsPrimary As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bMustBeUnique As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		eFieldType As ARProject.FieldType
	#tag EndProperty

	#tag Property, Flags = &h0
		eUIType As ARProject.UIType
	#tag EndProperty

	#tag Property, Flags = &h0
		iDBFieldSchemaType As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sColumnName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sLabelText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sPrimaryKeyField As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="bIncludeInListbox"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bInitialSortField"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bIsPrimary"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bMustBeUnique"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="iDBFieldSchemaType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="eFieldType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ARProject.FieldType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - FieldBoolean"
				"2 - FieldCurrency"
				"3 - FieldDate"
				"4 - FieldDouble"
				"5 - FieldInt64"
				"6 - FieldInteger"
				"7 - FieldString"
			#tag EndEnumValues
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
			Name="sColumnName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sPrimaryKeyField"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="eUIType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ARProject.UIType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - None"
				"2 - ControlButton"
				"3 - ControlCheckbox"
				"4 - ControlContainer"
				"5 - ControlLabel"
				"6 - ControlListbox"
				"7 - ControlPassword"
				"8 - ControlPopupMenu"
				"9 - ControlTextArea"
				"10 - ControlTextField"
				"11 - DisplayContainer"
				"12 - DisplayWindow"
				"13 - DisplayWebDialog"
				"14 - DisplayWebPage"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="sLabelText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
