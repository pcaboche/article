#! /usr/bin/bash

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

# stop on error
set -e

DEFAULT_PORT=8983

PORT=${PORT:-${DEFAULT_PORT}}
CONT=${CONT:-'solr_lyrics'}
CORE=${CORE:-'songs_jp'}

# the directory containing JSON files to import
DATADIR=${DATADIR:-'songs'}


START_TIME=$(date +%s)

# wait for container to start
while ! ncat -z localhost ${PORT}; do   
  sleep 0.1 # wait 0.1s before trying again
done

END_TIME=$(date +%s)
TIME_START_SOLR=$(($END_TIME - $START_TIME))

echo "Solr started in ${TIME_START_SOLR}s"


echo "
Creating core '${CORE}'..."

START_TIME=$(date +%s)

# create the Solr core
docker exec -it --user=solr ${CONT} bin/solr create_core -c ${CORE}

END_TIME=$(date +%s)
TIME_CREATE_CORE=$(($END_TIME - $START_TIME))



START_TIME=$(date +%s)

time ./load_into_solr.sh || true

END_TIME=$(date +%s)
TIME_IMPORT_DATA=$(($END_TIME - $START_TIME))

echo "
Solr started in  ${TIME_START_SOLR}s
Core created in  ${TIME_CREATE_CORE}s
Data imported in ${TIME_IMPORT_DATA}s
"

