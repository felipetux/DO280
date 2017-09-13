#!/bin/bash

oc process openshift//eap70-mysql-persistent-s2i \
-v APPLICATION_NAME=member \
-v HOSTNAME_HTTP=member.cloudapps.lab.example.com \
-v HOSTNAME_HTTPS=secure-member.cloudapps.lab.example.com \
-v SOURCE_REPOSITORY_URL=http://workstation.lab.example.com/member \
-v SOURCE_REPOSITORY_REF="" \
-v CONTEXT_DIR="" \
-v DB_JNDI=java:jboss/datasources/memberDS \
-v DB_DATABASE=member \
-v DB_USERNAME=member \
-v DB_PASSWORD=member \
-v HTTPS_SECRET=eap-app-secret-member \
-v HTTPS_KEYSTORE=keystore.jks \
-v HTTPS_KEYSTORE_TYPE=jks \
-v HTTPS_NAME=jboss \
-v HTTPS_PASSWORD=mykeystorepass \
-v JGROUPS_ENCRYPT_SECRET=eap-app-secret-member \
> /home/student/DO280/labs/deploy-template/processedtemplate.json 
