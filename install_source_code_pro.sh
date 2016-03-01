#!/bin/bash
echo "-checking SourceCodePro installation"
find ~/.fonts -name "*SourceCodePro*" | grep -q '.' || {
    echo "--SourceCodePro not installed, installing"
    FONT_NAME="SourceCodePro"
    URL="https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip"

    mkdir /tmp/adobefont
    cd /tmp/adobefont
    wget ${URL} -O ${FONT_NAME}.zip
    unzip -o -j ${FONT_NAME}.zip
    mkdir -p ~/.fonts
    cp *.otf.woff ~/.fonts
    fc-cache -f -v
}
