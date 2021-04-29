#tag Class
Protected Class TableData
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub AppendForeignKey(oFKey as ARProject.ForeignKey)
		  var i as integer = aroForeignKey.IndexOf(oFKey)
		  
		  if i <> -1 then
		    //Already exists
		    break
		    return
		  end
		  
		  aroForeignKey.Append oFKey
		  
		  SortForeignKeys
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrimaryKeyField() As ARProject.ClassPropertyInfo
		  for each toProp as ARProject.ClassPropertyInfo in aroFields
		    if toProp.bIsPrimary then
		      return toProp
		      
		    end
		    
		  next toProp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyByName(sName as String) As ARProject.ClassPropertyInfo
		  // Return a property info by name
		  for each oProperty as ARProject.ClassPropertyInfo in aroFields
		    if oProperty.sColumnName = sName then
		      return oProperty
		      
		    end
		    
		  next oProperty
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveForeignKey(oFKey as ARProject.ForeignKey)
		  for i as integer = 0 to aroForeignKey.Ubound
		    var oListKey as ARProject.ForeignKey = aroForeignKey(i)
		    
		    //Refresh the names
		    oListKey.CreateName
		    oFKey.CreateName
		    
		    if oListKey.sName = oFKey.sName then
		      aroForeignKey.remove(i)
		      exit
		    end
		  next
		  
		  SortForeignKeys
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortFields()
		  'per Bob/Carol don't sort
		  'var ars() as String
		  '
		  'for each oField as ARProject.ClassPropertyInfo in aroFields
		  'ars.Append oField.sColumnName
		  'next
		  '
		  'ars.Sort
		  '
		  '
		  'var aroSort() as ARProject.ClassPropertyInfo
		  '
		  'for each sFieldName as String in ars
		  'for each oField as ARProject.ClassPropertyInfo in aroFields
		  'if oField.sColumnName.Lowercase = sFieldName.Lowercase then
		  'aroSort.Append oField
		  'exit for
		  'end if
		  'next
		  'next
		  '
		  'aroFields =  aroSort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortForeignKeys()
		  var ars() as String
		  
		  for each oField as ARProject.ForeignKey in aroForeignKey
		    ars.Append oField.sName
		  next
		  
		  ars.Sort
		  
		  
		  var aroSort() as ARProject.ForeignKey
		  
		  for each sName as String in ars
		    for each oField as ARProject.ForeignKey in aroForeignKey
		      if oField.sName.Lowercase = sName.Lowercase then
		        aroSort.Append oField
		        exit for
		      end if
		    next
		  next
		  
		  aroForeignKey =  aroSort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Validate(tbPKReqiuresInt as Boolean)
		  redim arsErrors(-1)
		  
		  // Pattern ignores space for the more detailed space check error message
		  var rxValidate as new RegEx
		  rxValidate.SearchPattern = kIllegalIDECharacterRx
		  
		  // Space check
		  if sTableName.InStr(" ") > 0 then
		    arsErrors.Append("""" + sTableName + """ cannot have a space in the name.")
		    
		  end
		  
		  // Illegal chars check
		  var rxmValidate as RegExMatch = rxValidate.Search(sTableName)
		  while rxmValidate <> nil
		    arsErrors.Append(sTableName + " has a illegal character in then name: " + _
		    rxmValidate.SubExpressionString(1))
		    
		    rxmValidate = rxValidate.Search
		    
		  wend
		  
		  var bHasPK as Boolean
		  for each oProperty as ARProject.ClassPropertyInfo in aroFields
		    // Primary Key
		    if oProperty.bIsPrimary then
		      bHasPK = true
		      
		      // Web 2.0 Primary Key not string check
		      if bHasUI and tbPKReqiuresInt then
		        if oProperty.eFieldType <> FieldType.FieldInteger and oProperty.eFieldType <> FieldType.FieldInt64 then
		          arsErrors.Append(sTableName + kErrWeb2PK)
		          
		        end
		        
		      end
		      
		    end
		    
		    // Space check
		    if oProperty.GetPropertyName.InStr(" ") > 0 then
		      arsErrors.Append("""" + sTableName + "." + oProperty.sColumnName + _
		      """ cannot have a space in the name.")
		      
		    end
		    
		    // Illegal chars check
		    rxmValidate = rxValidate.Search(oProperty.GetPropertyName)
		    while rxmValidate <> nil
		      arsErrors.Append(sTableName + "." + oProperty.sColumnName + _
		      " has a illegal character in then name: " + rxmValidate.SubExpressionString(1))
		      
		      rxmValidate = rxValidate.Search
		      
		    wend
		    
		  next
		  
		  if bHasPK = false and me.bView = false then
		    arsErrors.Insert(0, sTableName + " does not have a Primary Key.")
		    
		  elseif bHasPK = false and me.bView = true and bHasUI and tbPKReqiuresInt = true then
		    arsErrors.Insert(0, sTableName + kErrWeb2PK)
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroFields() As ARProject.ClassPropertyInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		aroForeignKey() As ARProject.ForeignKey
	#tag EndProperty

	#tag Property, Flags = &h0
		arsErrors() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bGenerateAutoObjects As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bHasUI As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bSelected As boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		bView As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		sTableName As String
	#tag EndProperty


	#tag Constant, Name = kErrWeb2PK, Type = String, Dynamic = False, Default = \" Primary Key is not an Integer. Web 2.0 requires an Integer Primary Key.", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="bHasUI"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bSelected"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bView"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
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
			Name="sTableName"
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
			Name="bGenerateAutoObjects"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
