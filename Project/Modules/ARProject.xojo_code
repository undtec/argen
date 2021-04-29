#tag Module
Protected Module ARProject
	#tag Method, Flags = &h0
		Function HasUI(extends taroTables() as ARProject.TableData) As Boolean
		  for each toTable as ARProject.TableData in taroTables
		    if toTable.bHasUI = true then return true
		    
		  next toTable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(extends teValue as ARProject.UIType) As String
		  select case teValue
		  case ARProject.UIType.None
		    return "None"
		    
		  case ARProject.UIType.ControlCheckbox
		    return "Checkbox"
		    
		  case ARProject.UIType.ControlLabel
		    return "Label"
		    
		  case ARProject.UIType.ControlPassword
		    return "Password"
		    
		  case ARProject.UIType.ControlPopupMenu
		    return "PopupMenu"
		    
		  case ARProject.UIType.ControlListbox
		    return "Listbox"
		    
		  case ARProject.UIType.ControlTextArea
		    return "TextArea"
		    
		  case ARProject.UIType.ControlTextField
		    return "TextField"
		    
		  case else
		    return "Unknown"
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueProperty(extends teUI as ARProject.UIType, iAPI as Integer) As String
		  if iAPI = 1 then
		    select case teUI
		    case ARProject.UIType.None
		      return ""
		      
		    case ARProject.UIType.ControlCheckbox
		      return "Value"
		      
		    case ARProject.UIType.ControlLabel
		      return "Text"
		      
		    case ARProject.UIType.ControlPassword
		      return "Text"
		      
		    case ARProject.UIType.ControlPopupMenu
		      return "ListIndex"
		      
		    case ARProject.UIType.ControlListbox
		      return "ListIndex"
		      
		    case ARProject.UIType.ControlTextArea
		      return "Text"
		      
		    case ARProject.UIType.ControlTextField
		      return "Text"
		      
		    case else
		      return ""
		      
		    end select
		    
		  elseif iAPI = 2 then
		    select case teUI
		    case ARProject.UIType.None
		      return ""
		      
		    case ARProject.UIType.ControlCheckbox
		      return "Value"
		      
		    case ARProject.UIType.ControlLabel
		      return "Value"
		      
		    case ARProject.UIType.ControlPassword
		      return "Value"
		      
		    case ARProject.UIType.ControlPopupMenu
		      return "SelectedRowIndex"
		      
		    case ARProject.UIType.ControlListbox
		      return "SelectedRowIndex"
		      
		    case ARProject.UIType.ControlTextArea
		      return "Value"
		      
		    case ARProject.UIType.ControlTextField
		      return "Value"
		      
		    case else
		      return ""
		      
		    end select
		    
		  end
		End Function
	#tag EndMethod


	#tag Constant, Name = kIllegalIDECharacterRx, Type = String, Dynamic = False, Default = \"([^A-Za-z0-9\\s\\_\\x80-\\xFF])", Scope = Private
	#tag EndConstant


	#tag Enum, Name = FieldType, Type = Integer, Flags = &h0
		Unknown
		  FieldBoolean
		  FieldCurrency
		  FieldDate
		  FieldDouble
		  FieldInt64
		  FieldInteger
		FieldString
	#tag EndEnum

	#tag Enum, Name = ItemScope, Type = Integer, Flags = &h0
		Unknown
		  ScopeGlobal
		  ScopePublic
		  ScopeProtected
		ScopePrivate
	#tag EndEnum

	#tag Enum, Name = UIType, Type = Integer, Flags = &h0
		Unknown
		  None
		  ControlButton
		  ControlCheckbox
		  ControlContainer
		  ControlLabel
		  ControlListbox
		  ControlPassword
		  ControlPopupMenu
		  ControlTextArea
		  ControlTextField
		  DisplayContainer
		  DisplayWindow
		  DisplayWebDialog
		DisplayWebPage
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
	#tag EndViewBehavior
End Module
#tag EndModule
