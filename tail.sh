 docker exec -it `docker ps -aqf "name=registry-cache"`  tail -f /var/log/squid/access.log
