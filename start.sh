#!/usr/bin/env bash
# exit on error
set -o errexit

celery -A cherwood_shop worker -l info --detach

celery -A cherwood_shop beat -l info --detach

gunicorn cherwood_shop.wsgi:application
