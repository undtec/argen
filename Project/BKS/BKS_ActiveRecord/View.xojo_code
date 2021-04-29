#tag Class
Protected Class View
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
		Function ID() As integer
		  //PROGRAMMER NOTE!
		  //You are here because you've tried to use the ID of a VIEW
		  //There is no ID in a view in ActiveRecord (or at least one that you can do anything with).
		  //Check your stack and see where you came from.
		  break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReadRecord(rs as RecordSet)
		  'Read current record out of rs into properties
		  var oTableInfo as BKS_ActiveRecord.P.TableInfo
		  
		  oTableInfo = GetTableInfo( Introspection.GetType(self) )
		  
		  ReadRecord( rs, oTableInfo )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadRecord(rs as RecordSet, oTableInfo as BKS_ActiveRecord.P.TableInfo)
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
		        #pragma BreakOnExceptions False
		        Try
		          dt.SQLDateTime = v.StringValue
		        Catch e as UnsupportedFormatException
		          dt.SQLDateTime = "2000-01-01 00:00:00.000"
		        End Try
		        vProperty=dt
		      end if
		      
		    else
		      vProperty= oField.Value
		    end if
		    
		    pi.Value(self) = vProperty
		    dictFieldValue.Value(pi.Name) = vProperty
		    
		  next
		End Sub
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
