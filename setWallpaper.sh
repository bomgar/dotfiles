#!/bin/bash

set -x -e -u -o pipefail

index=${1:-0}

file=$(tempfile)
curl --fail --output $file.xml "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=$index&n=1&mkt=de-DE"

echo "Stored xml: $file.xml"
urlbase=$(xmlstarlet sel -t -v "/images/image/urlBase" $file.xml)

echo "URL base: $urlbase"

curl -o $file.jpg --fail "https://bing.com/${urlbase}_UHD.jpg"
echo "Stored wallpaper: $file.jpg"

feh --bg-max $file.jpg

