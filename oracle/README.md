# DBaaS - MySQL Operator in multi tenant mode mode

### Deploy Oracle MySQL Operator

Deploy
```bash

# Create NS
oc create -f ns.yaml
# Create ServiceAccount
oc create -f operator-sa.yaml
# Create ClusterRole
oc create -f operator-cluster-role.yaml
# Create ClusterRoleBindings
oc create -f operator-cluster-role-bindings.yaml
# Deploy CRD
oc create -f crds.yaml
# Deploy Operator
oc create -f operator-deployment.yaml

```

Clean up
```bash

oc delete -f operator-deployment.yaml
oc delete -f operator-sa.yaml
oc delete -f operator-cluster-role.yaml
oc delete -f operator-cluster-role-bindings.yaml
oc delete -f crds.yaml
oc delete -f ns.yaml

```
