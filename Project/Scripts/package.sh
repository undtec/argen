#!/bin/bash

PROJECT_FILE="${1}"

if [ -z "${PROJECT_FILE}" -o ! -f "${PROJECT_FILE}" ]; then
	echo "package.sh: missing project file" 1>&2
	exit 1
fi

SHORT_VERSION=`grep ShortVersion "${PROJECT_FILE}" | sed 's/ShortVersion=\(.*\)/\1/'`
if [ -z "${SHORT_VERSION}" ]; then
	echo "package.sh: Could not find version in project file"
	exit 1
fi

./Scripts/create-appcast.sh ${SHORT_VERSION} > Distribution/appcast.xml
