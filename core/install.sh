#!/bin/sh

# Download TastyIgniter
composer create-project tastyigniter/tastyigniter:v3.1.2 ./tastyigniter

# Traverse into the downloaded directory so an installation can be run
cd tastyigniter

# Start the *annoyingly* interactive installation
php artisan igniter:install
