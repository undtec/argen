#tag Module
Protected Module TurboActivate
	#tag Method, Flags = &h1
		Protected Function Activate() As integer
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Activates the product on this computer. You must call
		  ' CheckAndSavePKey() with a valid product key or have used
		  ' the TurboActivate wizard sometime before calling this
		  ' function.
		  
		  Declare Function Activate Lib kTurboActivate () As Int32
		  
		  Dim rc As Int32 = Activate()
		  
		  return rc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Activate(ExtraData As String)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Activates the product on this computer. You must call
		  ' CheckAndSavePKey() with a valid product key or have used
		  ' the TurboActivate wizard sometime before calling this
		  ' function.
		  
		  #if TargetWindows
		    Declare Function ActivateEx Lib kTurboActivate (ByRef options As ACTIVATE_OPTIONS_W) As Int32
		    
		    Dim options As ACTIVATE_OPTIONS_W
		    options.nLength = 8
		    options.sExtraData = ExtraData
		  #else
		    Declare Function ActivateEx Lib kTurboActivate (ByRef options As ACTIVATE_OPTIONS) As Int32
		    
		    Dim options As ACTIVATE_OPTIONS
		    options.nLength = 8
		    options.sExtraData = ExtraData
		  #endif
		  
		  Dim ret As Int32 = ActivateEx(options)
		  
		  Select Case ret
		  Case 2 ' TA_E_PKEY
		    Raise new PkeyInvalidException
		  Case 4 ' TA_E_INET
		    Raise new InternetException
		  Case 5 ' TA_E_INUSE
		    Raise new PkeyMaxUsedException
		  Case 6 ' TA_E_REVOKED
		    Raise new PkeyRevokedException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Case 13 ' TA_E_EXPIRED
		    Raise new DateTimeException
		  Case 17 ' TA_E_IN_VM
		    Raise new VirtualMachineException
		  Case 18 ' TA_E_EDATA_LONG
		    Raise new ExtraDataTooLongException
		  Case 19 ' TA_E_INVALID_ARGS
		    Raise new InvalidArgsException
		  Case 20 ' TA_E_KEY_FOR_TURBOFLOAT
		    Raise new TurboFloatKeyException
		  Case 0 ' success
		    Return
		  Else
		    Raise new TurboActivateException("Failed to activate.")
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActivateFromFile(f as FolderItem) As Boolean
		  #If DebugBuild
		    #if TargetMacOS then
		      const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #endif
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  dim rc as integer
		  
		  #if TargetWindows
		    declare function ActivateFromFile lib kTurboActivate (filename as WString) as integer
		    rc = ActivateFromFile(f.NativePath)
		  #else
		    declare function ActivateFromFile lib kTurboActivate (filename as CString) as integer
		    rc = ActivateFromFile(f.NativePath)
		  #endif
		  
		  
		  select case rc
		  case 2 ' TA_E_PKEY
		    raise new PkeyInvalidException
		    
		  case 8 ' TA_E_PDETS
		    raise new ProductDetailsException
		    
		  case 11 ' TA_E_COM
		    raise new COMException
		    
		  case 13 ' TA_E_EXPIRED
		    raise new DateTimeException
		    
		  case 17 ' TA_E_IN_VM
		    raise new VirtualMachineException
		    
		  case 0 ' success
		    return true
		    
		  else
		    raise new TurboActivateException("Failed to activate.")
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActivationRequestToFile(f as FolderItem) As Integer
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  dim rc as integer
		  
		  #if TargetWindows
		    declare function ActivationRequestToFile lib kTurboActivate ( filename as WString) as integer
		    rc = ActivationRequestToFile(f.NativePath)
		  #else
		    declare function ActivationRequestToFile lib kTurboActivate ( filename as CString) as integer
		    rc = ActivationRequestToFile(f.NativePath)
		  #endif
		  
		  
		  return rc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckAndSavePKey(productKey As String, flags As UInt32) As integer
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks and saves the product key.
		  ' Returns: True if the product key is valid, false if it's not
		  
		  #if TargetWindows
		    Declare Function CheckAndSavePKey Lib kTurboActivate (ByVal productKey As WString, ByVal flags As UInt32) As Int32
		  #else
		    Declare Function CheckAndSavePKey Lib kTurboActivate (ByVal productKey As CString, ByVal flags As UInt32) As Int32
		  #endif
		  
		  Dim rc As Int32 = CheckAndSavePKey(productKey, flags)
		  
		  return rc
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Deactivate(Optional eraseProductKey As Boolean = false)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Deactivates the product on this computer.
		  
		  Declare Function Deactivate Lib kTurboActivate (erasePkey As Byte) As Int32
		  
		  Dim ret As Int32 = Deactivate(CType(eraseProductKey, Byte))
		  
		  Select Case ret
		  case TA_OK
		    // Good result
		  Case 2 ' TA_E_PKEY
		    Raise New PkeyInvalidException
		  Case 3 ' TA_E_ACTIVATE
		    Raise new NotActivatedException
		  Case 4 ' TA_E_INET
		    Raise new InternetException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Else
		    Raise new TurboActivateException("Failed to deactivate.")
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeactivationRequestToFile(filename As String, eraseProductKey As Boolean)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Get the "deactivation request" file for offline deactivation.
		  
		  #if TargetWindows
		    Declare Function DeactivationRequestToFile Lib kTurboActivate (ByVal filename As WString, erasePkey As Byte) As Int32
		  #else
		    Declare Function DeactivationRequestToFile Lib kTurboActivate (ByVal filename As CString, erasePkey As Byte) As Int32
		  #endif
		  
		  Dim ret As Int32 = DeactivationRequestToFile(filename, CType(eraseProductKey, Byte))
		  
		  Select Case ret
		  Case 2 ' TA_E_PKEY
		    Raise new PkeyInvalidException
		  Case 3 ' TA_E_ACTIVATE
		    Raise new NotActivatedException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Case 0 ' success
		    Return
		  Else
		    Raise new TurboActivateException("Failed to deactivate.")
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ExtendTrial(trialExtension As String)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Extends the trial using a trial extension created in LimeLM.
		  
		  #if TargetWindows
		    Declare Function ExtendTrial Lib kTurboActivate (ByVal trialExtension As WString) As Int32
		  #else
		    Declare Function ExtendTrial Lib kTurboActivate (ByVal trialExtension As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = ExtendTrial(trialExtension)
		  
		  Select Case ret
		  Case 4 ' TA_E_INET
		    Raise new InternetException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 12 ' TA_E_TRIAL_EUSED
		    Raise new TrialExtUsedException
		  Case 13 ' TA_E_TRIAL_EEXP
		    Raise new TrialExtExpiredException
		  Case 0 ' success
		    Return
		  Else
		    Raise new TurboActivateException("Failed to extend trial.")
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetCurrentProduct() As String
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Gets the "current product" previously set by SetCurrentProduct(string).
		  ' Returns: string version GUID.
		  
		  Declare Function GetCurrentProduct Lib kTurboActivate (lpValueStr As Ptr, cchValue As Integer) As Int32
		  
		  Dim mb As MemoryBlock
		  Dim len As Int32
		  
		  len = GetCurrentProduct(nil, 0)
		  
		  #if TargetWindows
		    mb = new MemoryBlock(2 * len)
		  #else
		    mb = new MemoryBlock(len)
		  #endif
		  
		  Dim ret As Int32 = GetCurrentProduct(mb, len)
		  
		  Select Case ret
		  Case 0 ' success
		    #if TargetWindows
		      Return mb.WString(0)
		    #else
		      Return mb.CString(0)
		    #endif
		  Else
		    Raise new TurboActivateException("Failed to get the current product. Make sure you've loaded the product details file using PDetsFromPath().")
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetExtraData() As String
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Gets the extra data value you passed in when activating.
		  
		  Declare Function GetExtraData Lib kTurboActivate (lpValueStr As Ptr, cchValue As Integer) As Int32
		  
		  Dim mb As MemoryBlock
		  Dim len As Int32  = GetExtraData(nil, 0)
		  
		  #if TargetWindows
		    mb = new MemoryBlock(2 * len)
		  #else
		    mb = new MemoryBlock(len)
		  #endif
		  
		  Dim ret As Int32 = GetExtraData(mb, len)
		  
		  Select Case ret
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 0 ' success
		    #if TargetWindows
		      Return mb.WString(0)
		    #else
		      Return mb.CString(0)
		    #endif
		  Else
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFeatureValue(featureName As String) As String
		  ' Gets the value of a feature.
		  ' Returns: Returns the feature value if it exists, otherwise it throws an exception.
		  
		  Dim value As String = GetFeatureValue(featureName, "")
		  
		  If value = "" Then
		    // We don't need an exception for this
		    // Raise new TurboActivateException("Failed to get feature value. The feature doesn't exist.")
		  End If
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFeatureValue(featureName As String, defaultValue As String) As String
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Gets the value of a feature.
		  ' Returns: Returns the feature value if it exists, otherwise it returns the default value.
		  
		  Dim mb As MemoryBlock
		  Dim len As Int32
		  
		  #if TargetWindows
		    Declare Function GetFeatureValue Lib kTurboActivate (ByVal featureName As WString, lpValueStr As Ptr, cchValue As Integer) As Int32
		    
		    len = GetFeatureValue(featureName, nil, 0)
		    mb = new MemoryBlock(2 * len)
		  #else
		    Declare Function GetFeatureValue Lib kTurboActivate (ByVal featureName As CString, lpValueStr As Ptr, cchValue As Integer) As Int32
		    
		    len = GetFeatureValue(featureName, nil, 0)
		    mb = new MemoryBlock(len)
		  #endif
		  
		  Dim ret As Int32 = GetFeatureValue(featureName, mb, len)
		  
		  Select Case ret
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 0 ' success
		    #if TargetWindows
		      Return mb.WString(0)
		    #else
		      Return mb.CString(0)
		    #endif
		  Else
		    Return defaultValue
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPKey() As String
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Gets the stored product key. NOTE: if you want to check 
		  ' if a product key is valid simply call IsProductKeyValid()
		  ' Returns: The product key if it exists, otherwise an exception is thrown.
		  
		  Declare Function GetPKey Lib kTurboActivate (lpValueStr As Ptr, cchValue As Integer) As Int32
		  
		  Dim mb As MemoryBlock
		  
		  
		  ' this makes the assumption that the PKey is 34+NULL characters long.
		  ' This may or may not be true in the future.
		  #if TargetWindows
		    ' Wide char on Windows == byte * 2
		    mb = new MemoryBlock(70)
		  #else
		    mb = new MemoryBlock(35)
		  #endif
		  
		  Dim ret As Int32 = GetPKey(mb, 35)
		  
		  Select Case ret
		  Case 2 ' TA_E_PKEY
		    Raise new PkeyInvalidException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 0 ' success
		    #if TargetWindows
		      Return mb.WString(0)
		    #else
		      Return mb.CString(0)
		    #endif
		  Else
		    Raise new TurboActivateException("Failed to get the product key.")
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HumanMessage(iCode as Integer) As String
		  // These error messages are etracted from TurboActivate.h
		  // Detailed descriptions of the codes can be found there
		  select case iCode
		  case 0
		    return "No error."
		    
		  case TA_FAIL
		    return "Failure."
		    
		  case TA_E_PKEY
		    return "Invalid product key."
		    
		  case TA_E_ACTIVATE
		    return "The product needs to be activated."
		    
		  case TA_E_INET, TA_E_INET_DELAYED, TA_E_INET_TIMEOUT
		    // TA_E_INET_DELAYED = 21
		    // TA_IsGenuineEx() previously had a TA_E_INET error, and instead
		    // of hammering the end-user's network, TA_IsGenuineEx() is waiting
		    // 5 hours before rechecking on the network.
		    
		    // TA_E_INET_TIMEOUT = 35
		    return "Could not connect to server."
		    
		  case TA_E_INUSE
		    return "The product key has already been activated with the maximum number of computers."
		    
		  case TA_E_REVOKED
		    return "The product key has been revoked."
		    
		  case TA_E_GUID
		    // TurboActivate.Deprecated.h
		    return "GUID Mismatch Error"
		    
		  case TA_E_PDETS
		    return "The product details file ""TurboActivate.dat"" failed to load."
		    
		  case TA_E_TRIAL
		    return "The trial data has been corrupted, using the oldest date possible."
		    
		  case TA_E_REACTIVATE
		    // TurboActivate.Deprecated.h
		    // Note: As of TurboActivate 3.3 this is no longer used.
		    return "GUID Mismatch Error"
		    
		  case TA_E_COM
		    return "Re-enable Windows Management Instrumentation (WMI) service. " + _
		    "Contact your system admin for more information."
		    
		  case TA_E_TRIAL_EUSED
		    return "The trial extension has already been used."
		    
		  case TA_E_EXPIRED
		    // This is the same error code if the system time has been tampered with
		    return "The activation has expired."
		    
		  case TA_E_PERMISSION
		    return "Insufficient system permission."
		    
		  case TA_E_INVALID_FLAGS, TA_E_INVALID_ARGS
		    return "The arguments passed to the function are invalid."
		    
		  case TA_E_IN_VM, TA_E_IN_SANDBOX
		    return "This product cannot be activated in a Virtual Machine."
		    
		  case TA_E_EDATA_LONG
		    return "The ""extra data"" field was too long."
		    
		  case TA_E_KEY_FOR_TURBOFLOAT
		    return "The product key used is for TurboFloat not TurboActivate."
		    
		  case TA_E_FEATURES_CHANGED
		    // This is a success code and should not be presented to the user!
		    return "Features have changed"
		    
		  case TA_E_NO_MORE_DEACTIVATIONS
		    return "No more deactivations are allowed for the product key. " + _
		    "This product is still activated on this computer."
		    
		  case TA_E_ACCOUNT_CANCELED
		    return "Can't activate because the LimeLM account is cancelled."
		    
		  case TA_E_ALREADY_ACTIVATED
		    return "The software is already activated. " + _
		    "To use a new product key, then first deactivate the software."
		    
		  case TA_E_INVALID_HANDLE
		    return "The handle is not valid."
		    
		  case TA_E_ENABLE_NETWORK_ADAPTERS
		    // There are network adapters on the system that are disabled and
		    // TurboActivate couldn't read their hardware properties (even after trying
		    // and failing to enable the adapters automatically). Enable the network adapters,
		    // re-run the function, and TurboActivate will be able to "remember" the adapters
		    // even if the adapters are disabled in the future.
		    return "There are network adapters on the system that are disabled. " + _
		    "Please enable all network adapters to activate the software. " + _
		    "The network adapters do not need an active Internet connections."
		    
		  case TA_E_ALREADY_VERIFIED_TRIAL
		    return "The trial is already a verified trial."
		    
		  case TA_E_TRIAL_EXPIRED
		    return "The verified trial has expired."
		    
		  case TA_E_MUST_SPECIFY_TRIAL_TYPE
		    return " You must specify the trial type (TA_UNVERIFIED_TRIAL or TA_VERIFIED_TRIAL)."
		    
		  case TA_E_MUST_USE_TRIAL
		    return "You must call TA_UseTrial() before you can get the number of trial days remaining."
		    
		  case TA_E_NO_MORE_TRIALS_ALLOWED
		    // In the LimeLM account either the trial days is set to 0, OR the account is set
		    // to not auto-upgrade and thus no more verified trials can be made.
		    break
		    return "No more verified trials can be made."
		    
		  case TA_E_BROKEN_WMI
		    return "The WMI repository on the computer is broken. " + _
		    "To fix the WMI repository see the instructions here: " + _
		    "https://wyday.com/limelm/help/faq/#fix-broken-wmi"
		    
		  case TA_E_INET_TLS
		    return "The secure connection to the activation servers failed due to a TLS or certificate error."
		    
		  end select
		  
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsActivated() As Boolean
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks whether the computer has been activated.
		  ' Returns: True if the computer is activated. False otherwise.
		  
		  #if TargetWindows
		    Declare Function IsActivated Lib kTurboActivate (ByVal versionGUID As WString) As Int32
		  #else
		    Declare Function IsActivated Lib kTurboActivate (ByVal versionGUID As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsActivated(VersionGUID)
		  
		  Select Case ret
		  Case 7 ' TA_E_GUID
		    Raise new GUIDMismatchException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Case 17 ' TA_E_IN_VM
		    Raise new VirtualMachineException
		  Case 0 ' is activated
		    Return True
		  End Select
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsDateValid(date_time As String, flags As UInt32) As Boolean
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks if the string in the form "YYYY-MM-DD HH:mm:ss" is a valid
		  ' date/time. The date must be in UTC time and "24-hour" format. If your
		  ' date is in some other time format first convert it to UTC time before
		  ' passing it into this function.
		  
		  #if TargetWindows
		    Declare Function IsDateValid Lib kTurboActivate (ByVal date_time As WString, flags As UInt32) As Int32
		  #else
		    Declare Function IsDateValid Lib kTurboActivate (ByVal date_time As CString, flags As UInt32) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsDateValid(date_time, flags)
		  
		  Select Case ret
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 16 ' TA_E_INVALID_FLAGS
		    Raise new InvalidFlagsException
		  Case 0 ' success
		    Return True
		  Else
		    Return False
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsGenuine() As IsGenuineResult
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks whether the computer is genuinely activated by verifying with the LimeLM servers.
		  ' Returns: True if this product is genuine, false otherwise.
		  
		  #if TargetWindows
		    Declare Function IsGenuine Lib kTurboActivate (ByVal versionGUID As WString) As Int32
		  #else
		    Declare Function IsGenuine Lib kTurboActivate (ByVal versionGUID As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsGenuine(VersionGUID)
		  
		  Select Case ret
		  Case 4 ' TA_E_INET
		    Return IsGenuineResult.InternetError
		  Case 7 ' TA_E_GUID
		    Raise new GUIDMismatchException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Case 13 ' TA_E_EXPIRED
		    Raise new DateTimeException
		  Case 17 ' TA_E_IN_VM
		    Return IsGenuineResult.NotGenuineInVM
		  Case 22 ' TA_E_FEATURES_CHANGED
		    Return IsGenuineResult.GenuineFeaturesChanged
		  Case 0 ' is activated
		    Return IsGenuineResult.Genuine
		  End Select
		  
		  ' not genuine (TA_FAIL, TA_E_REVOKED, TA_E_ACTIVATE)
		  Return IsGenuineResult.NotGenuine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsGenuine(ByRef needsReactivate As Boolean) As Boolean
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks whether the computer is genuinely activated by verifying with the LimeLM servers.
		  ' Returns: True if this product is genuine, false otherwise.
		  
		  #if TargetWindows
		    Declare Function IsGenuine Lib kTurboActivate (ByVal versionGUID As WString) As Int32
		  #else
		    Declare Function IsGenuine Lib kTurboActivate (ByVal versionGUID As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsGenuine(VersionGUID)
		  
		  Select Case ret
		  Case 3 ' TA_E_ACTIVATE
		    Raise new NotActivatedException
		  Case 4 ' TA_E_INET
		    Raise new InternetException
		  Case 7 ' TA_E_GUID
		    Raise new GUIDMismatchException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 11 ' TA_E_COM
		    Raise new COMException
		  Case 13 ' TA_E_EXPIRED
		    Raise new DateTimeException
		  Case 17 ' TA_E_IN_VM
		    Raise new VirtualMachineException
		  Case 22 ' TA_E_FEATURES_CHANGED
		  Case 0 ' is activated
		    needsReactivate = False
		    Return True
		  End Select
		  
		  ' not genuine (TA_FAIL, TA_E_REVOKED)
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsGenuine(daysBetweenChecks As UInt32, graceDaysOnInetErr As UInt32, Optional skipOffline As Boolean = false, Optional offlineShowInetErr As Boolean = false) As IsGenuineResult
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks whether the computer is genuinely activated by verifying with the LimeLM servers.
		  
		  Dim options As GENUINE_OPTIONS
		  options.nLength = 16
		  options.nDaysBetweenChecks = daysBetweenChecks
		  options.nGraceDaysOnInetErr = graceDaysOnInetErr
		  options.flags = 0
		  
		  If skipOffline Then
		    options.flags = TA_SKIP_OFFLINE
		    
		    If offlineShowInetErr Then
		      options.flags = options.flags Or TA_OFFLINE_SHOW_INET_ERR
		    End If
		  End If
		  
		  #if TargetWindows
		    Declare Function IsGenuineEx Lib kTurboActivate (ByVal versionGUID As WString, ByRef options As GENUINE_OPTIONS) As Int32
		  #else
		    Declare Function IsGenuineEx Lib kTurboActivate (ByVal versionGUID As CString, ByRef options As GENUINE_OPTIONS) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsGenuineEx(VersionGUID, options)
		  
		  select case ret
		  case TA_OK
		    // OK RESULT
		    return IsGenuineResult.Genuine
		    
		  case TA_FAIL, TA_E_REVOKED, TA_E_ACTIVATE
		    return IsGenuineResult.NotGenuine
		    
		  case TA_E_INET, TA_E_INET_DELAYED, TA_E_INET_TIMEOUT
		    // OK RESULT
		    return IsGenuineResult.InternetError
		    
		  case TA_E_IN_VM
		    Return IsGenuineResult.NotGenuineInVM
		    
		  case TA_E_INVALID_ARGS
		    raise new TurboActivate.InvalidArgsException
		    
		  case TA_E_FEATURES_CHANGED
		    // OK RESULT
		    return IsGenuineResult.GenuineFeaturesChanged
		    
		  case else
		    raise new TurboActivate.TurboActivateException(ret)
		    
		  end select
		  
		  return IsGenuineResult.NotGenuine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsProductKeyValid() As Boolean
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Checks if the product key installed for this product is valid.
		  ' This does NOT check if the product key is activated or genuine.
		  ' Use IsActivated() and IsGenuine(ref bool) instead.
		  ' Returns: True if the product key is valid.
		  
		  #if TargetWindows
		    Declare Function IsProductKeyValid Lib kTurboActivate (ByVal versionGUID As WString) As Int32
		  #else
		    Declare Function IsProductKeyValid Lib kTurboActivate (ByVal versionGUID As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = IsProductKeyValid(VersionGUID)
		  
		  Select Case ret
		  Case 7 ' TA_E_GUID
		    Raise new GUIDMismatchException
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 0 ' is activated
		    Return True
		  End Select
		  
		  ' not valid
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadTAFiles()
		  dim fDat as FolderItem = SpecialFolder.Resources.Child("TurboActivate.dat")
		  if (fDat = nil) or (fDat.Exists = false) then
		    MsgBox("Unable to load a required resource 'TurboActivate.dat'")
		    Quit
		    return
		    
		  end
		  
		  TurboActivate.PDetsFromPath(fDat.NativePath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PDetsFromPath(filename As String)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  // Protects agains the loaded twice error
		  if mbLoadedDAT = true then return
		  
		  ' Loads the "TurboActivate.dat" file from a path rather
		  ' than loading it from the same dir as TurboActivate.dll
		  ' on Windows or the app that uses
		  ' libTurboActivate.dylib / libTurboActivate.so on Mac / Linux.
		  
		  #if TargetWindows
		    Declare Function PDetsFromPath Lib kTurboActivate (ByVal filename As WString) As Int32
		  #else
		    Declare Function PDetsFromPath Lib kTurboActivate (ByVal filename As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = PDetsFromPath(filename)
		  
		  select case ret
		  case TA_OK
		    mbLoadedDAT = true
		    
		  case TA_E_PDETS
		    raise new ProductDetailsException
		    
		  else
		    raise new LibraryLoadedException
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetCurrentProduct(vGuid As String)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' This functions allows you to use licensing for multiple products within
		  ' the same running process. First load all the TurboActivate.dat files for
		  ' all your products using the PDetsFromPath(string) function. Then, to
		  ' use any of the licensing functions for a product you need to for any
		  ' particular product, you must first call SetCurrentProduct(string) to
		  ' "switch" to the product.
		  
		  
		  #if TargetWindows
		    Declare Function SetCurrentProduct Lib kTurboActivate (ByVal versionGuid As WString) As Int32
		  #else
		    Declare Function SetCurrentProduct Lib kTurboActivate (ByVal versionGuid As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = SetCurrentProduct(vGuid)
		  
		  Select Case ret
		  Case 0 ' success
		    Return
		  Else
		    Raise new TurboActivateException("Failed to set the current product. Make sure you've loaded the product details file using PDetsFromPath().")
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetCustomProxy(proxy As String)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Sets the custom proxy to be used by functions that connect to the internet.
		  
		  #if TargetWindows
		    Declare Function SetCustomProxy Lib kTurboActivate (ByVal proxy As WString) As Int32
		  #else
		    Declare Function SetCustomProxy Lib kTurboActivate (ByVal proxy As CString) As Int32
		  #endif
		  
		  Dim ret As Int32 = SetCustomProxy(proxy)
		  
		  If Not Ret = 0 Then
		    Raise new TurboActivateException("Failed to set the custom proxy.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrialDaysRemaining() As Integer
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Get the number of trial days remaining.
		  ' You must call UseTrial() at least once in
		  ' the past before calling this function.
		  
		  #if TargetWindows
		    Declare Function TrialDaysRemaining Lib kTurboActivate (ByVal versionGUID As WString, ByRef DaysRemaining As UInt32) As Int32
		  #else
		    Declare Function TrialDaysRemaining Lib kTurboActivate (ByVal versionGUID As CString, ByRef DaysRemaining As UInt32) As Int32
		  #endif
		  
		  Dim daysRemain As UInt32 = 0
		  Dim ret As Int32 = TrialDaysRemaining(VersionGUID, daysRemain)
		  
		  select case ret
		  case TA_OK
		    // Good result
		    
		  case TA_FAIL
		    raise new TrialExpiredException
		    
		  case TA_E_GUID
		    raise new GUIDMismatchException
		    
		  case TA_E_PDETS
		    raise new ProductDetailsException
		    
		  case TA_E_PKEY
		    raise new PkeyInvalidException
		    
		  case else
		    raise new TurboActivateException(ret)
		    
		  end select
		  
		  Return daysRemain
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UseTrial(Optional flags As UInt32 = TA_USER)
		  #If DebugBuild
		    #If TargetMacOS Then
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      #If Target32Bit
		        Const kTurboActivate = kTurboActivateDebug
		      #Else
		        Const kTurboActivate = kTurboActivateDebug64Bit
		      #EndIf
		    #EndIf
		  #Else
		    #If Target32Bit
		      Const kTurboActivate = kTurboActivateRelease
		    #Else
		      Const kTurboActivate = kTurboActivateRelease64Bit
		    #EndIf
		  #endif
		  
		  ' Begins the trial the first time it's called.
		  ' Calling it again will validate the trial data
		  ' hasn't been tampered with.
		  
		  Declare Function UseTrial Lib kTurboActivate (ByVal flags As UInt32) As Int32
		  
		  Dim ret As Int32 = UseTrial(flags)
		  
		  Select Case ret
		  Case 8 ' TA_E_PDETS
		    Raise new ProductDetailsException
		  Case 0 ' success
		    Return
		  Case 15 ' TA_E_PERMISSION
		    Raise new PermissionException
		  Case 16 ' TA_E_INVALID_FLAGS
		    Raise new InvalidFlagsException
		  Case 17 ' TA_E_IN_VM
		    Raise new VirtualMachineException
		  Case 30 ' TA_E_TRIAL_EXPIRED
		    raise new TurboActivate.TrialExpiredException
		  Else
		    Raise new TurboActivateException("Failed to save the trial data.")
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mbLoadedDAT As Boolean
	#tag EndProperty


	#tag Constant, Name = kTurboActivateDebug, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/../Frameworks/libTurboActivate.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"DebugARGen Libs/x86/TurboActivate.dll"
	#tag EndConstant

	#tag Constant, Name = kTurboActivateDebug64Bit, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/../Frameworks/libTurboActivate.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"DebugARGen Libs/x64/TurboActivate.dll"
	#tag EndConstant

	#tag Constant, Name = kTurboActivateRelease, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/../Frameworks/libTurboActivate.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"ARGen Libs/x86/TurboActivate.dll"
	#tag EndConstant

	#tag Constant, Name = kTurboActivateRelease64Bit, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/../Frameworks/libTurboActivate.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"ARGen Libs/x64/TurboActivate.dll"
	#tag EndConstant

	#tag Constant, Name = TA_DISALLOW_VM, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_ACCOUNT_CANCELED, Type = Double, Dynamic = False, Default = \"25", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_ACTIVATE, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_ALREADY_ACTIVATED, Type = Double, Dynamic = False, Default = \"26", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_ALREADY_VERIFIED_TRIAL, Type = Double, Dynamic = False, Default = \"29", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_BROKEN_WMI, Type = Double, Dynamic = False, Default = \"34", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_COM, Type = Double, Dynamic = False, Default = \"11", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_EDATA_LONG, Type = Double, Dynamic = False, Default = \"18", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_ENABLE_NETWORK_ADAPTERS, Type = Double, Dynamic = False, Default = \"28", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_EXPIRED, Type = Double, Dynamic = False, Default = \"13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_FEATURES_CHANGED, Type = Double, Dynamic = False, Default = \"22", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_GUID, Type = Double, Dynamic = False, Default = \"7", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INET, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INET_DELAYED, Type = Double, Dynamic = False, Default = \"21", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INET_TIMEOUT, Type = Double, Dynamic = False, Default = \"35", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INET_TLS, Type = Double, Dynamic = False, Default = \"36", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INUSE, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INVALID_ARGS, Type = Double, Dynamic = False, Default = \"19", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INVALID_FLAGS, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_INVALID_HANDLE, Type = Double, Dynamic = False, Default = \"27", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_IN_SANDBOX, Type = Double, Dynamic = False, Default = \"34", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_IN_VM, Type = Double, Dynamic = False, Default = \"17", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_KEY_FOR_TURBOFLOAT, Type = Double, Dynamic = False, Default = \"20", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_MAX_ACTIVATIONS, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_MUST_SPECIFY_TRIAL_TYPE, Type = Double, Dynamic = False, Default = \"31", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_MUST_USE_TRIAL, Type = Double, Dynamic = False, Default = \"32", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_NO_MORE_DEACTIVATIONS, Type = Double, Dynamic = False, Default = \"24", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_NO_MORE_TRIALS_ALLOWED, Type = Double, Dynamic = False, Default = \"33", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_PDETS, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_PERMISSION, Type = Double, Dynamic = False, Default = \"15", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_PKEY, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_REACTIVATE, Type = Double, Dynamic = False, Default = \"10", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_REVOKED, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_TRIAL, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_TRIAL_EUSED, Type = Double, Dynamic = False, Default = \"12", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_E_TRIAL_EXPIRED, Type = Double, Dynamic = False, Default = \"30", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_FAIL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_HAS_NOT_EXPIRED, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_OFFLINE_SHOW_INET_ERR, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_SKIP_OFFLINE, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_SYSTEM, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_UNVERIFIED_TRIAL, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_USER, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TA_VERIFIED_TRIAL, Type = Double, Dynamic = False, Default = \"32", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VersionGUID, Type = String, Dynamic = False, Default = \"76efface5ad3bd1eb10899.19532041", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = ACTIVATE_OPTIONS, Flags = &h21
		nLength As UInt32
		sExtraData As CString
	#tag EndStructure

	#tag Structure, Name = ACTIVATE_OPTIONS_W, Flags = &h21
		nLength As UInt32
		sExtraData As WString
	#tag EndStructure

	#tag Structure, Name = GENUINE_OPTIONS, Flags = &h21
		nLength As UInt32
		  flags As UInt32
		  nDaysBetweenChecks As UInt32
		nGraceDaysOnInetErr As UInt32
	#tag EndStructure


	#tag Enum, Name = IsGenuineResult, Flags = &h1
		Genuine
		  GenuineFeaturesChanged
		  NotGenuine
		  NotGenuineInVM
		InternetError
	#tag EndEnum


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
