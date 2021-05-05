#!/bin/bash

set -eu

OMERO_USER=root
OMERO_PASS=omero
OMERO=/opt/omero/server/OMERO.server/bin/omero

# Wait up to 2 mins
docker-compose exec -T omeroserver $OMERO login -C -s localhost -u "$OMERO_USER" -q -w "$OMERO_PASS" --retry 120
echo "OMERO.server connection established"
