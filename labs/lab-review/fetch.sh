#!/bin/bash

# OSE 3 containerized services images
# Needs version because the private repo do not have ":latest" tags
for image in \
	openshift3/ose-haproxy-router openshift3/ose-deployer \
        openshift3/ose-pod openshift3/ose-docker-registry 
do docker pull $image:v3.4.0.39; done

# OSE 3 runtime images
for image in \
	openshift3/php-55-rhel7 openshift3/mysql-55-rhel7 \
  openshift3/registry-console:3.3 jboss-eap-7/eap70-openshift:1.4
do docker pull $image; done

