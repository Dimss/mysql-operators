#!/usr/bin/env bash
MYSQL_CLUSTER_NAME=my-app-db
MYSQL_HOST=${MYSQL_CLUSTER_NAME}
MYSQL_USER=root
MYSQL_PASS=$(oc get secret my-app-db-root-password  -o yaml  | grep "password:" | awk '{print $2}' | base64 -d)
mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p ${MYSQL_PASS} -e init.sql