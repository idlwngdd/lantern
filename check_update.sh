#!/bin/bash

dir="$(cd `dirname $0`; pwd)"
echo "Workdir: $dir"

version=`curl -s https://api.github.com/repos/getlantern/lantern-binaries/commits \
    | grep '"message": "' \
    | grep 'Lantern [0-9\.]\+' \
    | head -1 \
    | sed 's/.*\(Lantern [0-9\.]*\).*/\1/g'`
echo "Get latest version: $version"

if [[ -z $version ]]; then
    echo "2333"
fi
return

if [ ! -f "$dir/version" ]; then
    touch "$dir/version"
fi

oldver=`cat "$dir/version"`

if [ "$oldver" = "$version" ]; then
    echo 'Version not change.'
    exit 0
fi

echo 'Version change.'

tag=`echo $version | sed 's/Lantern //g'`
echo "Latest tag: $tag"

if [ `git tag | grep $tag | wc -l` = 0 ]; then
    echo "New tag: $tag"
    git tag "$tag"
else
    echo "Tag: $tag exist"
fi

sed -i "1c # Docker 运行 $version，科学上网" README.MD
echo $version > "$dir/version"
git add .
git commit -m "Travis CI auto update $version ()." &




