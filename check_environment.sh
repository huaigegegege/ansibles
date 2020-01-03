#!/bin/sh

if [ ! -d "/data/env/pyweb" ]; then
    cd /data/env
    virtualenv --python=/usr/bin/python3 pyweb
    source /data/env/pyweb/bin/activate

    pip3 install django
    pip3 install uwsgi
    pip3 install django-bootstrap3

    ln -s /usr/local/python3/bin/uwsgi /usr/bin/uwsgi

    cd /data/wwwroot
    django-admin.py startproject devops
    cd devops
    python3 manage.py startapp app
    mkdir static
    mkdir templates
fi
source /data/env/pyweb/bin/activate
nginx -t
pkill -9 uwsgi
pkill -9 nginx
uwsgi -x /data/wwwroot/devops/devops.xml
nginx
netstat -ntlp