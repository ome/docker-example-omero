#!/bin/bash

set -e
set -u
set -x

# Wait up to 2 mins
i=0
while ! docker compose logs  2>&1 | grep 'Listening at: http://0.0.0.0:4080'; do
    i=$(($i+1))
    if [ $i -ge 24 ]; then
        echo "$(date) - OMERO.web still not listening, giving up"
        exit 1
    fi
    echo "$(date) - waiting for OMERO.web..."
    sleep 5
done
echo "OMERO.web listening"

# Check the string "OMERO.web - Login" is present
curl -sL localhost:4080 | grep 'OMERO.web - Login'
