#!/usr/bin/env bash

sudo service postgresql restart
./reset-data.sh
./manage.py runserver
