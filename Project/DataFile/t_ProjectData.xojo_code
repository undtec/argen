#tag Class
Protected Class t_ProjectData
Inherits DataFile.ActiveRecordBase
	#tag Event
		Sub BeforeSave()
		  // Save data, oh definitely want an exception if something's going wrong.
		  sProjectData = moData.ToString
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function FindByID(id as Integer) As DataFile.T_ProjectData
		  var s as String
		  s = "Select * from T_ProjectData WHERE ProjectData_ID = " + str(id)
		  
		  var rs as RecordSet = DB.SQLSelectRaiseOnError(s)
		  
		  if rs.RecordCount = 0 then return nil
		  
		  var oRecord as new DataFile.T_ProjectData
		  oRecord.ReadRecord(rs)
		  return oRecord
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub iProjectData_ID()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub iProject_ID()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsModified() As boolean
		  // Refresh the project data
		  if oData <> nil then
		    sProjectData = oData.ToString
		    
		  end
		  
		  return super.IsModified
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as String = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.T_ProjectData()
		  var aro() as DataFile.T_ProjectData
		  var ars() as String
		  
		  
		  ars.append "select * From T_ProjectData "
		  if sCriteria.Trim <> "" then
		    ars.append "WHERE " + sCriteria
		  end if
		  
		  if sOrder.trim <> "" then
		    ars.append " ORDER BY " + sOrder
		  else
		    ars.append "ORDER BY ProjectName"
		  end if
		  
		  if iOffset > -1 then
		    ars.append " LIMIT " + str(BKS_ActiveRecordConfig.kMaxReturn) + " Offset " + str(iOffset)
		  end if
		  
		  var s as String = ars.JoinSQL
		  var rs as recordset = DB.SQLSelectRaiseOnError(s)
		  
		  while rs.eof = false
		    var oRecord as new DataFile.T_ProjectData
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(sCriteria as String = "") As Integer
		  var ars() as String
		  ars.append "select count(*) as iCnt From T_ProjectData "
		  if sCriteria<>"" then
		    ars.append "WHERE " + sCriteria
		  end if
		  var s as String = ars.JoinSQL
		  return db.SQLSelectRaiseOnError(s).Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		iProjectData_ID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moData As ARProject.ProjectData
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if moData = nil then
			    // Object needs to be created
			    moData = new ARProject.ProjectData
			    
			    // Object needs to be read
			    if sProjectData <> "" then
			      moData.FromJSON(new JSONItem(sProjectData))
			      
			    end
			    
			  end
			  
			  // Return cache
			  return moData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  moData = value
			End Set
		#tag EndSetter
		oData As ARProject.ProjectData
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private sProjectData As String
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
			Name="iProjectData_ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
