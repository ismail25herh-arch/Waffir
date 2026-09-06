#!/bin/sh
set -eu

: "${APP_KEY:?APP_KEY must be set in the Render environment}"
: "${JWT_SECRET:?JWT_SECRET must be set in the Render environment}"
: "${DATABASE_URL:?DATABASE_URL must be set by the Render PostgreSQL database}"

php artisan config:clear
php artisan migrate --force
php artisan config:cache

exec "$@"
