#!/bin/bash
#

rsync -av --exclude ".git" --exclude "/app/.meteor/local" --exclude "/app/node_modules" /app /home/meteorapp/
cd /home/meteorapp/app

meteor npm set registry https://registry.npm.taobao.org
meteor npm set disturl https://npm.taobao.org/dist
meteor npm set phantomjs_cdnurl http://cdn.npm.taobao.org/dist/phantomjs
meteor npm cache clean
meteor npm install

exec "$@"
