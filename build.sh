#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

chmod -R 755 /vol/web/
chgrp -R www-data /vol/web/
chmod -R g+w  /vol/web/
