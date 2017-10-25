#!/bin/bash

dir="$(cd `dirname $0`; pwd)"
echo "Workdir: $dir"

version=`curl -s https://api.github.com/repos/getlantern/lantern-binaries/commits | grep '"message": "'| grep 'Lantern\s\d\.\d\.\d\s('| head -1 | sed 's/.*\(Lantern [0-9\.]*\).*/\1/g'`
echo "Get latest version: $version"

if [ ! -f "$dir/version" ]; then
    touch "$dir/version"
fi

oldver=`cat "$dir/version"`

if [ "$oldver" = "$version" ]; then
    echo 'Version not change.'
else
    echo 'Version change.'

    tag=`echo $version | sed 's/Lantern //g'`
    echo "Latest tag: $tag"

    if [ ! -n `git tag | grep $tag` ]; then
        echo "New tag: $tag"
        git tag "$tag"
    else
        echo "Tag: $tag exist"
    fi
fi

echo $version > "$dir/version"
git add .
git commit -m "Travis CI auto update $version ()." &




