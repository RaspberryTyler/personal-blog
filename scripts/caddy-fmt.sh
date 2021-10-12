if docker-compose ps | grep -q tinkerlog-webserver
then 
    docker-compose exec -w /etc/caddy webserver caddy fmt --overwrite
else
    docker-compose run --rm -w /etc/caddy webserver caddy fmt --overwrite
fi