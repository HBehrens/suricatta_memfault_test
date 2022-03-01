#!/usr/bin/env bash

if [ ! -e "swupdate" ]; then
git clone https://github.com/sbabic/swupdate.git
fi

if [ ! -e "out" ]; then
mkdir out
fi

cp swupdate.build.config swupdate/.config

cd swupdate
make
cp -f swupdate ../out/
