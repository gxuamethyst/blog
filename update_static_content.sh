#!/bin/sh

github_repo=https://github.com/gxuamethyst/gxuamethyst.github.io.git
target_url=https://gxuamethyst.github.io

echo "remove public dir..."
rm -rf ./public

echo "clone $github_repo to public dir..."
git clone $github_repo public

echo "remove content of public dir..."
rm -rf ./public/*

echo "generate static content by hugo..."
hugo -b $target_url

current_date=`date "+%Y-%m-%d %H:%M:%S"`

echo "commit and push to $github_repo..."
cd ./public
git checkout LICENSE README.md
git add .
git commit -m "last update, $current_date."
git push origin master

echo "opreation completed."
