#!/bin/sh

isExists=`ls -a /usr/bin/ | grep python3`
if [ "$isExists" != "python3" ];then
    cd /home/buhuai/ansibles
    cp roles/python/files/Python-3.6.6.tgz /usr/local/
    cd /usr/local/
    tar -zxvf Python-3.6.6.tgz
    cd Python-3.6.6
    ./configure --prefix=/usr/local/python3
    make && make install
    ln -s -f /usr/local/python3/bin/python3.6 /usr/bin/python3
    ln -s -f /usr/local/python3/bin/pip3 /usr/bin/pip3

    python3 --version

else
    echo "python3 has been installed"
fi

isExists=`ls -a /usr/bin/ | grep virtualenv`
if [ "$isExists" != "virtualenv" ]; then
    pip3 install virtualenv
    ln -s /usr/local/python3/bin/virtualenv /usr/bin/virtualenv

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
else
    echo "virtualenv has been installed"
fi