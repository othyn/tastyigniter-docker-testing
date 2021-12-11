#!/bin/sh

# Traverse into the downloaded directory so an installation can be run
cd tastyigniter

# Start the *annoyingly* interactive installation
# I'm testing my new PR for unattended TastyIgniter installation ;)
php artisan igniter:install-unattended \
    --with-demo-data \
    --site-name="TastyIgniter" \
    --site-url="http://localhost/" \
    --admin-email="admin@domain.tld" \
    --admin-name="Chef Admin" \
    --admin-username="admin" \
    --admin-password="123456" \
    --mysql-host="ti-docker-testing-database" \
    --mysql-port="3306" \
    --mysql-database="tasty" \
    --mysql-username="tasty" \
    --mysql-password="tasty" \
    --mysql-table-prefix="ti_"
