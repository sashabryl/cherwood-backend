#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

celery -A cherwood_shop worker -l info --detach

celery -A cherwood_shop beat -l info --detach
