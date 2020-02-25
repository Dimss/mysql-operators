#!/usr/bin/env bash
oc login -usystem:admin
oc delete -f clusterrole.yaml
oc create -f clusterrole.yaml

oc login -uuser22 -popenshift
oc delete -f rolebindings.yaml
oc create -f rolebindings.yaml
