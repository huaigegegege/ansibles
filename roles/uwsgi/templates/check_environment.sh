#!/bin/sh

source /data/env/pyweb/bin/activate
nginx -t
pkill -9 uwsgi
pkill -9 nginx
uwsgi -x /data/wwwroot/devops/devops.xml
nginx
netstat -ntlp