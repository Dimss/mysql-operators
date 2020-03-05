#!/usr/bin/env bash
set -x
MYSQL_HOST=${MYSQL_CR_NAME}
# By default Oracle operator will create MySQL root password
MYSQL_USER=root
# Get MySQL root password from K8S secret ${MYSQL_CR_NAME}-root-password
MYSQL_PASS=$(oc get secret ${MYSQL_CR_NAME}-root-password -ojsonpath="{.data.password}" | base64 -d)
# Create a new DB
mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} -e "CREATE DATABASE ${MYSQL_CR_NAME};"
# List all DBs
mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} -e "SHOW DATABASES;"