#!/bin/sh 

cd {{repo_directory}}

source /data/env/pyweb/bin/activate

pip install -r requirements.txt

\cp -rfb {{git_pro_name}}/urls.py /data/wwwroot/{{live_pro_name}}/{{live_pro_name}}
\cp -rfb static/* /data/wwwroot/{{live_pro_name}}/static
\cp -rfb templates/* /data/wwwroot/{{live_pro_name}}/templates
\cp -rfb  app/* /data/wwwroot/{{live_pro_name}}/app/

python manage.py makemigrations
python manage.py migrate