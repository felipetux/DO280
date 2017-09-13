#!/bin/bash

echo \
    '{"kind":"ServiceAccount","apiVersion":"v1","metadata":{"name":"router"}}' \
    | oc create -f -
    
oc get scc privileged -o yaml > scc_privileged.yaml
 
sed -i '
/users:/ a \
- system:serviceaccount:default:router
' scc_privileged.yaml

oc replace scc privileged -f scc_privileged.yaml

