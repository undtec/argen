#tag Class
Protected Class CustomizationMethod
Inherits BKS_JSONResource.Base
	#tag Method, Flags = &h0
		Sub Constructor()
		  me.eScope = ARProject.ItemScope.ScopePrivate
		  me.sName = "Untitled"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetItemSource(txnMethod as XMLNode) As XMLNode
		  var txnSource as XMLNode = txnMethod.OwnerDocument.CreateElement("ItemSource")
		  
		  var txnEnc as XMLNode = txnMethod.OwnerDocument.CreateElement("TextEncoding")
		  txnEnc.AppendChild(txnMethod.OwnerDocument.CreateTextNode("134217984"))
		  txnSource.AppendChild(txnEnc)
		  
		  var tsSubOrFunc as String = if(sReturnType.Trim = "", "Sub", "Function")
		  
		  var tsSignature as String = tsSubOrFunc + " " + me.sName + "(" + me.sParameters + ")"
		  if me.sReturnType.Trim <> "" then
		    tsSignature = tsSignature + " As " + me.sReturnType
		    
		  end
		  
		  var txnSig as XMLNode = txnMethod.OwnerDocument.CreateElement("SourceLine")
		  txnSig.AppendChild(txnMethod.OwnerDocument.CreateTextNode(tsSignature))
		  txnSource.AppendChild(txnSig)
		  
		  // Split to lines
		  sBody = ReplaceLineEndings(sBody, EndOfLine.UNIX)
		  var arsLines() as String = sBody.Split(EndOfLine.UNIX)
		  
		  // Ensure always at least one empty line
		  if arsLines.Ubound < 0 then
		    arsLines.Append("")
		    
		  end
		  
		  // Turn into XML
		  for i as Integer = 0 to arsLines.Ubound
		    var txnLine as XMLNode = txnMethod.OwnerDocument.CreateElement("SourceLine")
		    txnLine.AppendChild(txnMethod.OwnerDocument.CreateTextNode(arsLines(i)))
		    txnSource.AppendChild(txnLine)
		    
		  next i
		  
		  var txnEnd as XMLNode = txnMethod.OwnerDocument.CreateElement("SourceLine")
		  txnEnd.AppendChild(txnMethod.OwnerDocument.CreateTextNode("End " + tsSubOrFunc))
		  txnSource.AppendChild(txnEnd)
		  
		  return txnSource
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bShared As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		eScope As ARProject.ItemScope
	#tag EndProperty

	#tag Property, Flags = &h0
		sBody As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sParameters As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sReturnType As String
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
		#tag ViewProperty
			Name="bShared"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
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
			Name="eScope"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ARProject.ItemScope"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - ScopeGlobal"
				"2 - ScopePublic"
				"3 - ScopeProtected"
				"4 - ScopePrivate"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="sBody"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sParameters"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sReturnType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
