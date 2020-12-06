#!/bin/bash

set -eu

OMERO_USER=root
OMERO_PASS=omero
OMERO=/opt/omero/server/OMERO.server/bin/omero

# Wait up to 2 mins
i=0
while ! docker-compose exec -T omeroserver $OMERO login -C -s localhost -u "$OMERO_USER" -q -w "$OMERO_PASS"; do
    i=$(($i+1))
    if [ $i -ge 24 ]; then
        echo "$(date) - OMERO.server still not reachable, giving up"
        exit 1
    fi
    echo "$(date) - waiting for OMERO.server..."
    sleep 5
done
echo "OMERO.server connection established"
