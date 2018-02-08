#!/bin/bash -e

cd $(dirname $0)


#cp build-squid/squid-common*.deb squid-common.deb
#cp build-squid/squid_*.deb squid.deb

#docker build -t registry-cache:latest .
#docker login registry.datadrivendiscovery.org
docker build -t registry.datadrivendiscovery.org/aweng/docker-registry-cache .
#will be taken care by .gitlab-ci.yml
#docker push registry.datadrivendiscovery.org/aweng/docker-registry-cache
