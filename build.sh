#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

celery -A cherwood_shop worker -l info

celery -A cherwood_shop beat -l info

celery -A cherwood_shop flower --address=0.0.0.0
