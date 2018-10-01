#!/bin/sh
set -e

cd /var/www/usr/plugins

mkdir -p GistEcho 
wget https://gist.githubusercontent.com/legendlee/4187609/raw/fe859e9b2fb98a600cf91203b5f5fe9ac06c7ceb/GistEcho.php \
    -O GistEcho/GistEcho.php

git clone https://github.com/MoePlayer/APlayer-Typecho.git Meting