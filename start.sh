#!/usr/bin/env bash
# exit on error
set -o errexit

gunicorn cherwood_shop.wsgi:application --timeout 90
