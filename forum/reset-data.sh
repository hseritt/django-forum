#!/usr/bin/env bash

function reset_db {
	echo " Removing database ..."
    rm -rf db.sqlite3
    echo " Done."
}

function migrate {
    ./manage.py makemigrations
    ./manage.py migrate
}

function create_admin_user {
	echo " Creating superuser 'admin' ..."
    ./manage.py createsuperuser --username admin --email admin@localhost --noinput
    echo " Done."
}

function reset_data {
	echo "Resetting data ..."
	reset_db;
	migrate;
	create_admin_user;
	python scripts/setadminpw.py;
	echo "Done."
}


reset_data;
