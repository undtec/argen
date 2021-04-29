#tag Module
Protected Module TPSettings
	#tag Method, Flags = &h1
		Protected Sub BelaySave()
		  // Yes, captain!
		  mbBelaySave = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Get(sKey as String, vDefault as Variant) As Variant
		  if mjsSettings = nil then return vDefault
		  
		  return mjsSettings.Lookup(sKey, vDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Load()
		  mfSettings = App.DataFolder.Child("settings.json")
		  
		  if mfSettings = nil then
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Settings file was nil. Application Support folder must not exist."
		    raise ex
		    
		    return
		    
		  end
		  
		  // Handle new run
		  if mfSettings.Exists = false then
		    mjsSettings = new JSONItem
		    return
		    
		  end
		  
		  // Read the settings file
		  var sContents as String
		  try
		    var tis as TextInputStream = TextInputStream.Open(mfSettings)
		    sContents = tis.ReadAll
		    tis.Close
		    
		  catch e as IOException
		    // Re-raise it so that it can be caught
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Could not read settings file. IOException: " + e.Message
		    raise ex
		    
		    return
		    
		  end try
		  
		  // Handle empty
		  if Trim(sContents) = "" then
		    mjsSettings = new JSONItem
		    return
		    
		  end
		  
		  try
		    // Create the JSONItem
		    mjsSettings = new JSONItem(sContents)
		    mjsSettings.Compact = false
		    
		  catch e as JSONException
		    // Re-raise it so that it can be caught
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Could not parse settings file. JSONException: " + e.Message
		    raise ex
		    
		    return
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save()
		  if mfSettings = nil then
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Could not set value, settings haven't been loaded."
		    raise ex
		    
		    return
		    
		  end
		  
		  // Handle empty save
		  if mjsSettings = nil then
		    mjsSettings = new JSONItem
		    
		  end
		  
		  // Not sure, but it's okay to leave contents empty
		  var sContents as String
		  try
		    mjsSettings.Compact = false
		    sContents = mjsSettings.ToString
		    
		  catch e as JSONException
		    
		  end try
		  
		  // Write the settings file
		  try
		    var tos as TextOutputStream = TextOutputStream.Create(mfSettings)
		    tos.Write(sContents)
		    tos.Close
		    
		    // Reset belay
		    mbBelaySave = false
		    
		  catch e as IOException
		    // Re-raise it so that it can be caught
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Failed to write settings file. IOException: " + e.Message
		    raise ex
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Set(sKey as String, assigns vValue as Variant)
		  // Protect
		  if mjsSettings = nil then
		    var ex as new TPSettings.SettingsException
		    ex.Message = "Could not set value, settings haven't been loaded."
		    raise ex
		    
		    return
		    
		  end
		  
		  // Set the value
		  mjsSettings.Value(sKey) = vValue
		  
		  // Write it out
		  if not mbBelaySave then
		    Save
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mbBelaySave As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfSettings As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mjsSettings As JSONItem
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
	#tag EndViewBehavior
End Module
#tag EndModule
