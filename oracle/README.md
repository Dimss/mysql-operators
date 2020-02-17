# DBaaS - MySQL Operator in multi tenant mode mode

### Deploy Oracle MySQL Operator

Deploy 
```bash

# Create NS
oc create -f ns.yaml
# Create ServiceAccount
oc create -f operator-sa.yaml
# Create ClusterRole for Operator
oc create -f operator-cluster-role.yaml
# Create ClusterRole for MySQL Agent
oc create -f mysql-agent-cluster-role.yaml
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
oc delete -f mysql-agent-cluster-role.yaml
oc delete -f operator-cluster-role-bindings.yaml
oc delete -f crds.yaml
oc delete -f ns.yaml

```

# Deploy MySQL instance in user namespace
1.Login to OCP as a regular user 
```bash
oc login ocp-url -u<USER> -p<PASS>
```
2.Create new project for MySQL cluster
```bash
oc new-project <PROJECT>
```
4.Create `mysql-agent` ServiceAccount 
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: mysql-agent
```
5.Login as system:admin and create `RoleBinding` for `mysql-agent` and `<USER>`
```bash
oc login -u system:admin
``` 
and create the RoleBindings for the `mysql-agent` and `<USER>` 
```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: mysql-agent
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: mysql-agent
subjects:
  - kind: ServiceAccount
    name: mysql-agent
    namespace: <PROJECT>
  - kind: User
    name: <USER>
    namespace: <PROJECT>
```
6.Allow `anyuid` policy for `mysql-agent` ServiceAccount (still as system:admin) 
```bash
oc adm policy add-scc-to-user anyuid -z mysql-agent -n <PROJECT>
```
7.Login as `<USER>` and create MySQL cluster
```yaml
apiVersion: mysql.oracle.com/v1alpha1
kind: Cluster
metadata:
  name: my-app-db
spec:
  members: 1
``` 