#! /usr/bin/bash

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

# stop on error
set -e

NB_PROC=${NB_PROC:-1}

PORT=${PORT:-8983}
CORE=${CORE:-'songs_jp'}
DATADIR=${DATADIR:-'../songs'}

export START_TIME=$(date +%s)

echo "Counting files to import..."
export nbFiles=$(find "${DATADIR}" -name '*.json' | wc -l)

AWK=$(cat <<EOF
BEGIN { SEP = "" }

{
	print SEP
	print "echo -e \"\$(( \$(date +%s) - \${START_TIME} ))s\t" NR "/${nbFiles} \t\" '"  \$0 "'"
	print "DATA=\$( ./_alter_json.sed '" \$0 "' )"
	print "curl -X POST -H 'Content-Type: application/json' http://localhost:${PORT}/solr/${CORE}/update/json/docs?commit=true --data \"\${DATA}\" "
	
	SEP = "\0"
}
EOF
)

# Processing the JSON files
find "${DATADIR}" -name '*.json' \
| sed "s/'/'\"'\"'/g" \
| gawk "${AWK}" \
| xargs -0 -P ${NB_PROC} -I {CMD} sh -c '{CMD}'

