#! /usr/bin/bash

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

BASE_URL=${BASE_URL:-http://localhost:8983}
CORE=${CORE:-songs_jp}

id=$1

curl -X --get --data-urlencode "q=id:\"${id}\"" \
	"${BASE_URL}/solr/${CORE}/mlt?mlt.interestingTerms=list&mlt.boost=true&mlt.mintf=1"
