#!/bin/bash
name='registry-cache'

if [[ "$1" == "" ]]; then
	echo "Usage: $0 ssl_directory cache_directory"
	exit 1
fi

SSL_DIRECTORY="$1"
CACHE_DIRECTORY="$2"
docker stop `docker ps -aqf "name=registry-cache"` 
docker rm  `docker ps -aqf "name=registry-cache"`  

if [ ! "$(docker ps -a | grep ${name})" ]; then 
        docker run -d --restart=always -p 443:443 --name ${name} \
	-v ${SSL_DIRECTORY}:/etc/ssl/private \
	-v ${CACHE_DIRECTORY}:/cache \
	registry.datadrivendiscovery.org/aweng/docker-registry-cache:latest
else
          docker start  registry-cache 
  
fi
