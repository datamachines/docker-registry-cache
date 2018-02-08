docker-registry-cache
=====================

This is a pull-through docker private registry cache implemented using a
Squid HTTP proxy.


Requirements
============

You must have docker installed. 

SSL-enabled squid
-----------------
use ssl/*.pem as key

or have nginx/haproxy using http end point

Build the cache server image
----------------------------

First, copy squid.conf.template to squid.conf, and change the variables.

* `{{ docker_host }}` is your private docker registry host
* `{{ cache_size }}` should be set to the cache size, in MB. According to the 
  squid docs, this should not exceed 80% of the disk. For example, 500000 is
  500GB.

Next, build the image:

```console
$ ./build.sh
```
   
   or simply docker pull registry.datadrivendiscovery.org/aweng/docker-registry-cache 
    
Setup
=====

* Create an empty directory for your cache.
* Create a directory for your SSL certificates, and place them in a directory,
  with the certificate called 'cert.pem' and the private key called 'key.pem'

```console
$ ./run.sh $(pwd)/ssl /path/to/cache
```

The registry will start, and be listening on port 443. It should restart on
bootup if your docker daemon is running.

Using the cache
===============

Once the registry cache starts, you pull from it like you would pull from a
normal docker registry -- but you pull from the cache hostname, not your
original private registry hostname!

```console
$ docker pull CACHE_HOST/foo/bar:latest
```

source .aliase to help with developement environment.


License
=======

The contents of this repository are available under the Apache v2 license. 


Author
======
Annie Weng annieweng@datamachines.io

Credit: forked from https://github.com/virtuald/docker-registry-cache
Dustin Spicuzza (dustin@virtualroadside.com)
