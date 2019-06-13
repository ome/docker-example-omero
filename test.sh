#!/bin/sh
set -eu

docker-compose up -d
./wait_for_login.sh
