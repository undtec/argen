#!/bin/sh

error_exit()
{
	echo "build-appstore.sh: ${1:-"Unknown Error"}" 1>&2
	exit 1
}

#source the build settings
. ./Scripts/build-settings

if [ -z "${MACAPPSTORE_OUTPUT}" ]; then
	error_exit "MACAPPSTORE_OUTPUT not set"
fi

#---===== Sign app and create package ====----

if ! [ -d "${MACAPPSTORE_OUTPUT}/${MACAPPNAME}" ]; then
	error_exit "Could not find the application bundle"
fi

install_name_tool -id "@executable_path/rbframework.dylib" \
	"${MACAPPSTORE_OUTPUT}/${MACAPPNAME}/Contents/MacOS/rbframework.dylib" ||
	error_exit "Could not run install_name_tool"

#sign the executable
codesign -f -s "${MACCERTIFICATE}" "${MACAPPSTORE_OUTPUT}/${MACAPPNAME}" \
	|| error_exit "Could not sign the application bundle"

#build the installer package
productbuild --component "${MACAPPSTORE_OUTPUT}/${MACAPPNAME}" /Applications \
	--sign "${MACINSTALLERCERTIFICATE}" "${MACAPPSTORE_OUTPUT}/${IMAGE_NAME}.pkg" \
	|| error_exit "Could not create installer package"