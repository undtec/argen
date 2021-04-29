#!/bin/sh

error_exit()
{
	echo "build-dmg.sh: ${1:-"Unknown Error"}" 1>&2
	exit 1
}

if ! [ -z "${1}" ]; then
	PROJECT_FILE="${1}"
fi

#source the build settings
. ./Scripts/build-settings

if [ -z "${MAC_OUTPUT}" ]; then
	error_exit "MAC_OUTPUT not set"
fi

#Read the InfoVersion out of the project file
if ! [ -f "${PROJECT_FILE}" ]; then
	error_exit "$LINENO: Could not find project file"
fi

MOUNTED_DISK_NAME=`grep InfoVersion "${PROJECT_FILE}" | sed 's/InfoVersion=\(.*\)/\1/'`
if [ -z "${MOUNTED_DISK_NAME}" ]; then
	error_exit "$LINENO: Could not find version"
fi

#---===== Create DMG and Sign ====----

if ! [ -d "${MAC_OUTPUT}/${MACAPPNAME}" ]; then
	error_exit "Could not find the application bundle"
fi

if [ -e "${MAC_OUTPUT}/Applications" ]; then
	rm -f "${MAC_OUTPUT}/Applications"  
fi
ln -s /Applications "${MAC_OUTPUT}/Applications" \
	|| error_exit "Could not create link to Applications"

#eject the existing disk image if one is already mounted with the same name
osascript -e "tell application \"Finder\"" \
          -e "    if (exists the disk \"${MOUNTED_DISK_NAME}\") then" \
          -e "        eject disk \"${MOUNTED_DISK_NAME}\"" \
          -e "    end if" \
          -e "end tell" \
          > /dev/null \
	  || error_exit "$LINENO: Could not eject the existing DMG"

if [ -f "./${IMAGE_NAME}.sparseimage" ]; then
	#remove any sparseiamge that got leftover by a failed build
	rm -f "./${IMAGE_NAME}.sparseimage" \
		|| error_exit "Could not remove the old sparseimage"
fi

if [ -f "./${IMAGE_NAME}.dmg" ]; then
	#remove any sparseiamge that got leftover by a failed build
	rm -f "./${IMAGE_NAME}.dmg" \
		|| error_exit "Could not remove the old DMG"
fi

if [ -f "./${IMAGE_NAME}.signature.txt" ]; then
	#remove any sparseiamge that got leftover by a failed build
	rm -f "./${IMAGE_NAME}.signature.txt" \
		|| error_exit "Could not remove the old signature file"
fi

cp "./${IMAGE_NAME}_template.sparseimage" "./${IMAGE_NAME}.sparseimage" \
		|| error_exit "$LINENO: Could copy the sparseimage template"

hdiutil mount "./${IMAGE_NAME}.sparseimage" 2>/dev/null >/dev/null \
		|| error_exit "$LINENO: Could not mount the sparse image"

if ! [ -d "/Volumes/${MOUNTED_DISK_NAME}" ]; then
	error_exit "$LINENO: Could not find the volume"
fi

rm -rf "/Volumes/${MOUNTED_DISK_NAME}/${MACAPPNAME}/Contents" \
		|| error_exit "$LINENO: Could not delete old build"

rsync -a "${MAC_OUTPUT}/${MACAPPNAME}/" "/Volumes/${MOUNTED_DISK_NAME}/${MACAPPNAME}/" \
		|| error_exit "$LINENO: Could not copy into volume"

osascript -e "tell application \"Finder\"" \
          -e "    if (exists the disk \"${MOUNTED_DISK_NAME}\") then" \
          -e "        eject disk \"${MOUNTED_DISK_NAME}\"" \
          -e "    end if" \
          -e "end tell" \
          > /dev/null \
	  || error_exit "$LINENO: Could not eject the existing DMG"

hdiutil convert -quiet  -format UDBZ -o "${IMAGE_NAME}.dmg" -imagekey zlib-level=9 "./${IMAGE_NAME}.sparseimage" \
	  || error_exit "$LINENO: Could not compress the DMG"

rm -f "./${IMAGE_NAME}.sparseimage"

if [ ${HASSPARKLE} == true ]; then

	if ! [ -f "${IMAGE_NAME}.dmg" ]; then
		error_exit "$LINENO: Could not find DMG file ${IMAGE_NAME}.dmg"
	fi

	if ! [ -f "${SPARKLESHA1FILENAMEPRIVATE}" ]; then
		error_exit "$LINENO: Private key file not found ${SPARKLESHA1FILENAMEPRIVATE}"
	fi

	SHA1=`openssl dgst -sha1 -binary < "${IMAGE_NAME}.dmg" | openssl dgst -dss1 -sign "${SPARKLESHA1FILENAMEPRIVATE}" | openssl enc -base64`
	if [ -z "${SHA1}" ]; then
		error_exit "Could not sign the DMG"
	fi
	echo "${SHA1}" > "${IMAGE_NAME}.signature.txt"
fi
