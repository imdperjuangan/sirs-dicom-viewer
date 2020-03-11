#!/bin/bash
git fetch --tags
VERSION=$(git describe --always --tag)
echo "{" > platform/viewer/public/version.json
echo -e "   \"data\": {" >> platform/viewer/public/version.json
echo "        \"name\": \"DICOM Viewer\"," >> platform/viewer/public/version.json
echo "        \"version\": \"$VERSION\"" >> platform/viewer/public/version.json
echo "   }" >> platform/viewer/public/version.json
echo "}" >> platform/viewer/public/version.json
