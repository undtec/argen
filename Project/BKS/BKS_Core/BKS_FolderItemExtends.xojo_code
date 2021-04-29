#tag Module
Protected Module BKS_FolderItemExtends
	#tag Method, Flags = &h0
		Function Data(extends f as FolderItem) As String
		  var tis as TextInputStream = TextInputStream.Open(f)
		  if tis=nil then
		    break
		    return ""
		  end if
		  var sData as String = tis.ReadAll
		  
		  return sData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseExceptionOnError(extends f as FolderItem)
		  var rc as integer = f.LastErrorCode
		  
		  if rc = FolderItem.NoError then
		    return
		  end if
		  
		  var ex as new RuntimeException
		  
		  select case rc
		  case FolderItem.DestDoesNotExistError
		    ex.Message = "Destination does not exist"
		  case FolderItem.FileNotFound
		    ex.Message = "File not found"
		  case FolderItem.AccessDenied, -5000
		    ex.Message = "Access denied"
		  case FolderItem.NotEnoughMemory
		    ex.Message = "Not enough memory to complete operation"
		  case FolderItem.FileInUse
		    ex.Message = "File in use"
		  case FolderItem.InvalidName
		    ex.Message = "Invalid file name"
		  end select
		  
		  raise ex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowOnDisk(extends f as FolderItem)
		  if not f.Exists then
		    return
		  end if
		  
		  #if TargetMacOS then
		    Declare Function selectFile Lib "AppKit" selector "selectFile:inFileViewerRootedAtPath:"(obj As Ptr, fPath As CFStringRef, rootFullPath As CFStringRef) As Boolean
		    Declare Function objc_getClass Lib "Cocoa"(name As CString) As Ptr
		    Declare Function sharedWorkspace Lib "AppKit" selector "sharedWorkspace"(obj As Ptr) As Ptr
		    var swrkspace As Ptr = sharedWorkspace(objc_getClass("NSWorkspace"))
		    Call selectFile(swrkspace, f.NativePath, "")
		    
		  #elseif TargetWin32 then
		    var o as new Shell
		    o.Execute( "explorer.exe", "/select," + f.ShellPath )
		    
		  #endif
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
End Module
#tag EndModule
