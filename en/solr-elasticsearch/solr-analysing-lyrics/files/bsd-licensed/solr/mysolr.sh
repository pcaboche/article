#! /usr/bin/bash

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

# stop on error
set -e

export CONT_SOLR=${CONT_SOLR:-solr_lyrics}

export HOST=${HOST:-localhost}
export PORT=${PORT:-8983}
export CORE=${CORE:-songs_jp}

ACTION=${1:-START}

case "${ACTION^^}" in 
	"START")
		if [ -z "$( docker container ls -a | grep "\\s${CONT_SOLR}\$" )" ]
		then
			docker run --name ${CONT_SOLR} -d -p 8983:${PORT} -t solr:latest
			./_init.sh
		else
			docker start ${CONT_SOLR}
		fi
		docker container ls -a | grep "\s${CONT_SOLR}\$"
		;;

	"STOP")
		docker stop ${CONT_SOLR}
		docker container ls -a | grep "\s${CONT_SOLR}\$"
		;;
		
	"RM")
		docker rm ${CONT_SOLR} --force
		docker container ls -a | grep "\s${CONT_SOLR}\$"
		;;
		
	"ENABLE_MLT")
		curl -X POST -H 'Content-type:application/json' -d '{   
			"add-requesthandler": {                            
				"name": "/mlt",
				"class": "solr.MoreLikeThisHandler",
				"defaults": {"mlt.fl": "lyrics_txt_ja"}
			}
		}' "http://${HOST}:${PORT}/solr/${CORE}/config"
		;;
esac
