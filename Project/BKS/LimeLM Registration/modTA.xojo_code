#tag Module
Protected Module modTA
	#tag Method, Flags = &h21
		Private Function FileContents(fTarget as FolderItem) As String
		  dim tis as TextInputStream = TextInputStream.Open(fTarget)
		  
		  if tis = nil then
		    break
		    return ""
		    
		  end
		  
		  dim sData as string = tis.ReadAll
		  
		  return sData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetHiddenItem(sGUID as String) As FolderItem
		  dim fTurboActivate as FolderItem
		  
		  #if TargetMacOS then
		    fTurboActivate = SecretFolder
		    
		    if fTurboActivate = nil or fTurboActivate.Exists = false then
		      break
		      return nil
		      
		    end
		    
		    fTurboActivate = fTurboActivate.Child("." + sGUID)
		    
		    if fTurboActivate = nil or fTurboActivate.Exists = false then
		      break
		      return nil
		      
		    end
		    
		  #elseif TargetWindows then
		    fTurboActivate = SecretFolder
		    
		    if fTurboActivate = nil or fTurboActivate.Exists = false then
		      break
		      return nil
		      
		    end
		    
		    fTurboActivate = fTurboActivate.Child(sGUID)
		    
		    if fTurboActivate = nil or fTurboActivate.Exists = false then
		      break
		      return nil
		      
		    end
		    
		  #endif
		  
		  return fTurboActivate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function KeyForGUID(sGUID as String) As String
		  // File name is a dotfile with the first two characters swapped.
		  dim sFileName as String = sGUID.Mid(2, 1)
		  sFileName = sFileName + sGUID.Left(1)
		  sFileName = sFileName + sGUID.Right(sGUID.Len - 2)
		  
		  dim fHiddenFile as FolderItem = GetHiddenItem(sFileName)
		  
		  if fHiddenFile = nil or fHiddenFile.Exists = false then
		    return ""
		    
		  end
		  
		  dim sContents as String = FileContents(fHiddenFile)
		  
		  if sContents.Left(6) <> "TAPFV1" then
		    // File not recognized
		    break
		    return ""
		    
		  end
		  
		  dim sKey as String = sContents.Mid(12, 34)
		  
		  return sKey
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SecretFolder() As FolderItem
		  #if TargetMacOS then
		    return SpecialFolder.ApplicationData.Child(".Apple")
		    
		  #elseif TargetWindows then
		    return SpecialFolder.SharedApplicationData.Child("ms-drivers")
		    
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
