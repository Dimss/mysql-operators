#!/usr/bin/env bash
set -xe
MYSQL_HOST=${CLUSTER_NAME}
# By default Oracle operator will create MySQL root password
MYSQL_USER=root
# Get MySQL root password from K8S secret ${MYSQL_CR_NAME}-root-password
MYSQL_PASS=$(oc get secret ${CLUSTER_NAME}-root-password -ojsonpath="{.data.password}" | base64 -d)
# Create a new DB
mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} -e "CREATE DATABASE ${CLUSTER_NAME};"
# List all DBs
mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} -e "SHOW DATABASES;"