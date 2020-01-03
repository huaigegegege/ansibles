#!/bin/sh 

cd /data/repo

source /data/env/pyweb/bin/activate

pip install -r requirements.txt

\cp -rfb report/urls.py /data/wwwroot/devops/devops
\cp -rfb static/* /data/wwwroot/devops/static
\cp -rfb templates/* /data/wwwroot/devops/templates
\cp -rfb  app/* /data/wwwroot/devops/app/

python manage.py makemigrations
python manage.py migrate

nginx -s reload