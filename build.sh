#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

mkdir -p /vol/web/media

adduser --disabled-password --no-create-home django-user

chown -R django-user:django-user /vol/
chmod -R 755 /vol/web/
chgrp -R www-data /vol/web/
chmod -R g+w  /vol/web/
