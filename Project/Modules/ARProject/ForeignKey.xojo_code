#tag Class
Protected Class ForeignKey
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub CloneFrom(oSource as ARProject.ForeignKey)
		  me.bManualEntry = oSource.bManualEntry
		  me.bMarkedForDelete = oSource.bMarkedForDelete
		  me.bMarkedForInsert = oSource.bMarkedForInsert
		  me.iObjectType = oSource.iObjectType
		  me.msName = "" // sName is computed
		  me.sColumn = oSource.sColumn
		  me.sForeignColumn = oSource.sForeignColumn
		  me.sForeignTable = oSource.sForeignTable
		  me.sTable = oSource.sTable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Default Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rs as RecordSet)
		  'Name = rs.field("constraint_name").StringValue
		  sTable = rs.Field("table_name").StringValue
		  sColumn = rs.Field("column_name").StringValue
		  sForeignTable = rs.Field("foreign_table_name").StringValue
		  sForeignColumn = rs.Field("foreign_column_name").StringValue
		  sName = sTable + "." + sColumn + " = " + sForeignTable + "." + sForeignColumn
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fk as String)
		  sName = replaceAll(fk," -> "," = ")
		  
		  var data(), table1(), table2() as String
		  
		  data = Split(fk, " -> ")
		  table1 = Split(data(0),".")
		  table2 = Split(data(1),".")
		  
		  sTable = table1(0)
		  sColumn = table1(1)
		  sForeignTable = table2(0)
		  sForeignColumn = Table2(1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sName as String, entry As xojo.Core.Dictionary)
		  sTable = entry.Value("Table")
		  sColumn = entry.Value("Column")
		  sForeignTable = entry.Value("ForeignTable")
		  sForeignColumn = entry.Value("ForeignColumn")
		  sName = sTable + "." + sColumn + " = " + sForeignTable + "." + sForeignColumn
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateName()
		  sName = sTable + "." + sColumn + " = " + sForeignTable + "." + sForeignColumn
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayObjectType() As String
		  select case iObjectType
		  case 1
		    Return "Single"
		  case 2
		    Return "Array"
		  case else 'oops
		    iObjectType = 1
		    Return "Single"
		  end Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bManualEntry As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bMarkedForDelete As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bMarkedForInsert As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bSelected As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		iObjectType As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private msName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sColumn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sForeignColumn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sForeignTable As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if msName = "" then
			    me.CreateName
			  end
			  return msName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  msName = value
			End Set
		#tag EndSetter
		sName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		sTable As String
	#tag EndProperty


	#tag Constant, Name = kArray, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSingle, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="bManualEntry"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bMarkedForDelete"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bMarkedForInsert"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bSelected"
			Visible=false
			Group="Behavior"
			InitialValue="true"
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
			Name="iObjectType"
			Visible=false
			Group="Behavior"
			InitialValue="1"
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
			Name="sColumn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sForeignColumn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sForeignTable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sTable"
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
	#tag EndViewBehavior
End Class
#tag EndClass
