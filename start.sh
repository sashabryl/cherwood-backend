#!/usr/bin/env bash
# exit on error
set -o errexit

gunicorn cherwood_shop.wsgi:application

celery -A cherwood_shop worker -l info
celery -A cherwood_shop beat -l info