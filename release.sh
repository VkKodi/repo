#!/bin/sh

# change location to where repo is
pushd "${0%/*}" > /dev/null

pushd vkkodi > /dev/null

rm -f xbmc-vk.svoka.com.zip


find xbmc-vk.svoka.com -name "*.pyc" | xargs -I {} rm -v "{}"
find xbmc-vk.svoka.com -name "*.pyo" | xargs -I {} rm -v "{}"
find xbmc-vk.svoka.com -name ".DS_Store" | xargs -I {} rm -rfv "{}"
find xbmc-vk.svoka.com -name ".idea" | xargs -I {} rm -rfv "{}"

zip -qr xbmc-vk.svoka.com.zip xbmc-vk.svoka.com

VER=`sed -nE 's/.*id=.*version="([^"]*).*/\1/p' xbmc-vk.svoka.com/addon.xml`

popd > /dev/null


pushd addons > /dev/null
rm -rf xbmc-vk.svoka.com.zip xbmc-vk.svoka.com
mv ../vkkodi/xbmc-vk.svoka.com.zip ./
unzip -q xbmc-vk.svoka.com.zip
python addons_xml_generator.py

rm -rf xbmc-vk.svoka.com/*
cp xbmc-vk.svoka.com.zip  xbmc-vk.svoka.com/xbmc-vk.svoka.com-$VER.zip

popd > /dev/null


# go back where you were
popd > /dev/null
