#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin IDEScriptBuildStep SetBuildNumber , AppliesTo = 0, Architecture = 0
					// Set build date version number
					PropertyValue("App.ShortVersion") = PropertyValue("App.NonReleaseVersion")
					
				End
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyResources
					AppliesTo = 0
					Architecture = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF8xLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF8yLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF9pT1MueG9qb194bWxfcHJvamVjdA==
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0VtcHR5JTIwaU9TJTIwUHJvamVjdC54b2pvX3htbF9wcm9qZWN0
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJRGVza3RvcF8xLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJRGVza3RvcF8yLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vRG9jdW1lbnRhdGlvbi9IZWxwJTIwQm9vay8=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJV2ViXzEueG9qb194bWxfcHJvamVjdA==
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJV2ViXzIueG9qb194bWxfcHJvamVjdA==
				End
			End
			Begin BuildStepList Windows
				Begin IDEScriptBuildStep SetBuildNumber , AppliesTo = 0, Architecture = 0
					// Set build date version number
					PropertyValue("App.ShortVersion") = PropertyValue("App.NonReleaseVersion")
					
				End
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyResourcesWin
					AppliesTo = 0
					Architecture = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF8xLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF8yLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0FjdGl2ZVJlY29yZF9pT1MueG9qb194bWxfcHJvamVjdA==
					FolderItem = Li4vLi4vVGVtcGxhdGVzL0VtcHR5JTIwaU9TJTIwUHJvamVjdC54b2pvX3htbF9wcm9qZWN0
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJRGVza3RvcF8xLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJRGVza3RvcF8yLnhvam9feG1sX3Byb2plY3Q=
					FolderItem = Li4vLi4vRG9jdW1lbnRhdGlvbi9IZWxwJTIwQm9vay8=
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJV2ViXzEueG9qb194bWxfcHJvamVjdA==
					FolderItem = Li4vLi4vVGVtcGxhdGVzL1VJV2ViXzIueG9qb194bWxfcHJvamVjdA==
				End
			End
#tag EndBuildAutomation
