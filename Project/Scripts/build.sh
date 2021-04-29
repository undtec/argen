#!/bin/sh

error_exit()
{
	echo "build.sh: ${1:-"Unknown Error"}" 1>&2
	exit 1
}

if ! [ "${1}" = "MacOS" -o "${1}" = "MacOSAppStore" -o "${1}" = "Windows" ]; then
	error_exit "Usage: command MacOS/Windows [debug]"
fi

if [ -z "${PROJECT_PATH}" ]; then
	error_exit "$LINENO: PROJECT_PATH not set"
fi

if ! [ -f "${PROJECT_FILE}" ]; then
	error_exit "$LINENO: PROJECT_FILE not set"
fi

if ! [ -d "Distribution" ]; then
	mkdir "Distribution" \
			|| error_exit "Could not create Distribution directory"
fi

#create a script file to package up the build
(
cat <<SCRIPT-EOF
#!/bin/bash
cd "${PROJECT_PATH}"
./Scripts/package.sh "${PROJECT_FILE}"
SCRIPT-EOF
) > Distribution/build-package.sh
chmod 755 Distribution/build-package.sh

#--- Setting Up Important Variables ---
BUILDTARGET="${1}"

#source the build settings
. ./Scripts/build-settings

if [ -z "${RESOURCES}" ]; then 
	error_exit "RESOURCES not set"
fi

if [ -z "${WIN_OUTPUT}" -o -z "${WINAPPNAME}" ]; then 
	error_exit "WIN_OUTPUT or WINAPPNAME not set"
fi

if [ -z "${MAC_OUTPUT}" -o -z "${MACAPPNAME}" ]; then 
	error_exit "MAC_OUTPUT or MACAPPNAME not set"
fi

if [ "${2}" == "debug" ]; then
  exit 0
fi

#---- MacOS build steps ----
if [ "${BUILDTARGET}" = "MacOS" -o "${BUILDTARGET}" = "MacOSAppStore" ]; then

	if [ "${BUILDTARGET}" = "MacOSAppStore" ]; then
	
		if [ -z "${MACAPPSTORE_CATEGORY}" ]; then
			error_exit "MACAPPSTORE_CATEGORY not set"
		fi
	
		HASESELLERATE=false
		HASSPARKLE=false
		MACBUNDLEPATH=${MACINTELBUNDLEPATH}
		MAC_OUTPUT=${MACAPPSTORE_OUTPUT}
	fi

	if ! [ -d "${MACBUNDLEPATH}" ]; then
		error_exit "MacOS: Could not find application at MACBUNDLEPATH(${MACBUNDLEPATH})"
	fi

	if [ ${HASHELPBOOK} == true ]; then
		#index the help file
		if ! [ -d "${RESOURCES}/${MACHELPBOOKFOLDER}" ]; then
			error_exit "MacOS #1: Could not find the help book folder"
		fi

		#set up the help file integration
		defaults write "${MACBUNDLEPATH}/Contents/Info" CFBundleHelpBookFolder -string "${MACHELPBOOKFOLDER}" \
			|| error_exit "MacOS #3: Could not set CFBundleHelpBookFolder"
		defaults write "${MACBUNDLEPATH}/Contents/Info" CFBundleHelpBookName -string "${MACHELPBOOKNAME}" \
			|| error_exit "MacOS #4: Could not set CFBundleHelpBookName"
	fi


	#copy resources into the bundle
	rsync -a --exclude=".*" "${RESOURCES}/" "${MACBUNDLEPATH}/Contents/Resources/" \
		|| error_exit "MacOS #5: Could not copy resources into bundle"
		
		
	if [ "${BUILDTARGET}" = "MacOSAppStore" ]; then		
		cp -R -f ./app.icns "${MACBUNDLEPATH}/Contents/Resources/" \
			|| error_exit "Could not copy icons into application bundle"
			
		defaults write "${MACBUNDLEPATH}/Contents/Info" CFBundleIconFile \
				-string "app.icns" \
			|| error_exit "Could not set CFBundleIconFile"
		
		#set the category
		defaults write "${MACBUNDLEPATH}/Contents/Info" LSApplicationCategoryType \
				-string "${MACAPPSTORE_CATEGORY}" \
			|| error_exit "Could not set LSApplicationCategoryType"
			
		#set the minimum system version (10.6.6 for the app store)
		defaults write "${MACBUNDLEPATH}/Contents/Info" LSMinimumSystemVersion \
				-string "10.6.6" \
			|| error_exit "Could not set LSMinimumSystemVersion"
			
		#Read the ShortVesion out of the project file
		if ! [ -f "${PROJECT_FILE}" ]; then
			error_exit "$LINENO: Could not find project file"
		fi
		
		SHORT_VERSION=`grep ShortVersion "${PROJECT_FILE}" | sed 's/ShortVersion=\(.*\)/\1/'`
		if [ -z "${SHORT_VERSION}" ]; then
			error_exit "$LINENO: Could not find version"
		fi
		
		defaults write "${MACBUNDLEPATH}/Contents/Info" CFBundleVersion \
				-string "$SHORT_VERSION" \
			|| error_exit "Could not set CFBundleVersion"
	fi
	
	#copy the Mac eSellerate File into the resources bundle
	if [ ${HASESELLERATE} == true ]; then
		cp  "${PROJECT_PATH}/EWSMacCompress.tar.gz" "${MACBUNDLEPATH}/Contents/Resources/"\
			|| error_exit "Could not copy the Mac eSellerate File into the Resources folder."
	fi

	if [ ${HASSPARKLE} == true ]; then
		#copy Sparkle framework into the Frameworks folder
		rsync -a --exclude=".*" "${FRAMEWORKS}/Sparkle.framework/" \
				"${MACBUNDLEPATH}/Contents/Frameworks/Sparkle.framework/" \
			|| error_exit "MacOS #6: Could not copy Spakle framework into bundle"
	
		#add sparkle settings to the plist
		defaults write "${MACBUNDLEPATH}/Contents/Info" SUPublicDSAKeyFile -string ${SPARKLESHA1FILENAME} \
			|| error_exit "SPARKLE #1: Could not set SUPublicDSAKeyFile"
		defaults write "${MACBUNDLEPATH}/Contents/Info" SUAllowsAutomaticUpdates -bool false \
			|| error_exit "SPARKLE #2: Could not set SUAllowsAutomaticUpdates"

		chmod 755 "${MACBUNDLEPATH}/Contents/Frameworks/Sparkle.framework/Versions/A/Sparkle" \
			|| error_exit "SPARKLE #3: Could not set permissions for Sparkle"
		#chmod 755 "${MACBUNDLEPATH}/Contents/Frameworks/Sparkle.framework/Versions/A/Resources/relaunch" \
			#|| error_exit "SPARKLE #1: Could not set permissions for Sparkle"
	fi

	plutil -convert xml1 "${MACBUNDLEPATH}/Contents/Info.plist" \
		|| error_exit "PLIST #1: Could not convert the plist"
		
	#make the Info.plist file readable by anyone but writeable only by the owner
	chmod 644 "${MACBUNDLEPATH}/Contents/Info.plist"

	#copy build to output location (create the output folder if it doesn't exit)
	if ! [ -d "${MAC_OUTPUT}" ]; then
		mkdir "${MAC_OUTPUT}" \
			|| error_exit "Could not create Mac output directory"
	fi

	rm -rf "${MAC_OUTPUT}/${MACAPPNAME}"

	cp -R "${MACBUNDLEPATH}" "${MAC_OUTPUT}/${MACAPPNAME}" \
		|| error_exit "Copy Build #1: Copy failed"
	
	if [ "${BUILDTARGET}" = "MacOSAppStore" ]; then
		#run script to sign and package for the app store
		./Scripts/build-appstore.sh \
			|| error_exit "Unable to create app store build"
	fi
fi

#---- Windows build steps ----
if [ "${BUILDTARGET}" = "Windows" ]; then

	if ! [ -d "${WINBUNDLEPATH}" ]; then
		error_exit "Windows: Could not find application at WINBUNDLEPATH(${WINBUNDLEPATH})"
	fi

	#copy resources into the folder
	rsync -a --exclude=".*" "${RESOURCES}/" "${WINBUNDLEPATH}/ARGen Resources/" \
		|| error_exit "${LINENO}: Could not copy resources into bundle"

	#copy build to output location (create the output folder if it doesn't exit)
	if ! [ -d "${WIN_OUTPUT}" ]; then
		mkdir "${WIN_OUTPUT}" \
			|| error_exit "Could not create Windows output directory"
	fi
	
	#copy installer script into distribution folder
	if [ -f "${WININSTALLERSCRIPT}" ]; then
		cp "${WININSTALLERSCRIPT}" Distribution/.
	fi

	if [ -d "${WIN_OUTPUT}" ]; then
		#clear out the old build
		rm -rf "${WIN_OUTPUT}/ARGen Resources"
		rm -rf "${WIN_OUTPUT}/${WINAPPNAME}.exe"
		rm -rf "${WIN_OUTPUT}/${WINAPPNAME} Libs"
	fi
	
	#copy the Windows eSellerate File into the resources bundle
	if [ ${HASESELLERATE} == true ]; then
		cp  "${PROJECT_PATH}/eWebCompress.cab" "${WINBUNDLEPATH}/ARGen Resources/"\
			|| error_exit "Could not copy the Windows eSellerate File into the Resources folder."
	fi

    #copy LimeLM File into the Libs folder
    #/Volumes/Raptor/Bob's Projects/Subversion/BKS_ActiveRecord/ARGen/LimeLM/TurboActivate.dll
    cp  /Volumes/Raptor/Bob\'s\ Projects/Subversion/BKS_ActiveRecord/ARGen/LimeLM.dll/TurboActivate.dll "${WINBUNDLEPATH}/ARGen Libs/"\
			|| error_exit "Could not copy the TurboActivate.dll into the Libs folder."
			
			
	cp "${WINBUNDLEPATH}/${WINAPPNAME}.exe" "${WIN_OUTPUT}" \
	|| error_exit "$LINENO: Copy failed"
	cp -R "${WINBUNDLEPATH}/${WINAPPNAME} Libs" "${WIN_OUTPUT}" \
	|| error_exit "$LINENO: Copy failed"
	cp -R "${WINBUNDLEPATH}/ARGen Resources" "${WIN_OUTPUT}" \
	|| error_exit "$LINENO: Copy failed"
fi
