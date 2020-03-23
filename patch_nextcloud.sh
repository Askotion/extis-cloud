#!/bin/bash

docker-compose exec --user www-data app php occ config:system:set overwriteprotocol --value="https"

docker-compose exec --user www-data app php occ db:add-missing-indices

docker-compose exec --user www-data app php occ db:convert-filecache-bigint

docker-compose exec --user www-data app php occ app:disable updatenotification

echo "Done!"
