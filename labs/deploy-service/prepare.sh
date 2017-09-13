#!/bin/bash

# Run this script on workstation 

LABDIR=/home/student/DO280/labs/deploy-service/
MYSQLPOD=mysqldb

echo "login as the developer user (student)..."
oc login -u student -p student
echo "creating project service-pod..."
oc new-project service-pod
echo "creating the database pod..."
oc create -f $LABDIR/mysqldb-pod.json
echo "waiting for the pod to become ready..."
ready=""
reason=""
while [ "$ready" != "1/1" -a "$reason" != "Running" ]; do
    ready=$(oc get pods | grep $MYSQLPOD | awk '{print $2}')
    running=$(oc get pods | grep $MYSQLPOD | awk '{print $3}')
    # Needs some error handling
    sleep 1
done
echo "Forwarding database port.."
oc port-forward -p $MYSQLPOD 13306:3306 &
pf=$!
sleep 3
# Does student has sudo without password?
#echo "Installing mysql client..."
#sudo yum -y install mysql
echo "Populating the database..."
mysql -h 127.0.0.1 -P13306 -uose -popenshift quotes < $LABDIR/quote.sql
echo "Terminating database port forward..."
kill $pf
# To check the database:
#oc exec -p mysqldb -it -- /bin/bash -c "mysql -h 127.0.0.1 -uose -popenshift quotes"
echo "Done."

