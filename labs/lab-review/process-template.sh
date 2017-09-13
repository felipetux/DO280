#!/bin/bash

# do not add nor remove whitespace from the following command:
oc process -f eap70-mysql-persistent-s2i.json \
-v APPLICATION_NAME=bookstore \
-v HOSTNAME_HTTP=bookstore.cloudapps.lab.example.com \
-v HOSTNAME_HTTPS=secure-bookstore.cloudapps.lab.example.com \
-v SOURCE_REPOSITORY_URL=http://workstation.lab.example.com/bookstore \
-v SOURCE_REPOSITORY_REF="" \
-v CONTEXT_DIR="" \
-v DB_JNDI=java:/jboss/datasources/mysql \
-v DB_DATABASE=bookstoredb \
-v DB_USERNAME=bookstoreapp \
-v DB_PASSWORD=secret \
-v SERVICE_ACCOUNT_NAME=eap-service-account \
-v HTTPS_SECRET=eap-app-secret-member \
-v HTTPS_KEYSTORE=keystore.jks \
-v HTTPS_KEYSTORE_TYPE=jks \
-v HTTPS_NAME=jboss \
-v HTTPS_PASSWORD=mykeystorepass \
-v JGROUPS_ENCRYPT_SECRET=eap-app-secret-member \
-v VOLUME_CAPACITY=1Gi \
> processed-template.json
