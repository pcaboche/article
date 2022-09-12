#! /bin/bash

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

# stop on error
set -e

BASE_URL=${BASE_URL:-http://localhost:8983}
OUTPUT_DIR=${OUTPUT_DIR:-../../../content/results}


BAND_LIST_FILE="${OUTPUT_DIR}/list-bands.tex"
OVERALL_WORDCOUNTS_FILE="${OUTPUT_DIR}/across-all-bands.tex"
NUMFOUND_FILE="${OUTPUT_DIR}/numFound.tex"

BANDS_DIR="${OUTPUT_DIR}/bands"
WORDCOUNTS_DIR="${OUTPUT_DIR}/wordcounts"
SONGWRITERS_DIR="${OUTPUT_DIR}/songwriters"
MLT_DIR="${OUTPUT_DIR}/mlt"
CONTAINS_DIR="${OUTPUT_DIR}/contains"

CORE='songs_jp'


mkdir -p "${BANDS_DIR}"
mkdir -p "${WORDCOUNTS_DIR}"
mkdir -p "${SONGWRITERS_DIR}"
mkdir -p "${MLT_DIR}"
mkdir -p "${CONTAINS_DIR}"





function generate_overall_wordcounts() {

	RESPONSE=$( curl -q -o /dev/stdout --get "${BASE_URL}/solr/${CORE}/select?facet.field=lyrics_txt_ja&facet.mincount=1&facet=true&q.op=OR&q=*%3A*&rows=0" )
	
	# echo -n '"numFound":' > "${NUMFOUND_FILE}"
	echo "${RESPONSE}" \
	| jq '.response.numFound'  > "${NUMFOUND_FILE}"
	
	echo "${RESPONSE}" \
	| jq '.facet_counts.facet_fields.lyrics_txt_ja' \
	| ./_transform_json.awk \
	| ./_add_translations.sed  > "${OVERALL_WORDCOUNTS_FILE}"
}




function generate_band_list() {

	curl -q -o /dev/stdout --get "${BASE_URL}/solr/${CORE}/select?facet.field=band_str&facet.mincount=1&facet=true&q.op=OR&q=*%3A*&rows=0"   \
	| jq '.facet_counts.facet_fields.band_str' \
	| ./_transform_json.awk \
	| ./_add_band_names.sed > "${BAND_LIST_FILE}"
}




function generate_bands_wordusage() {

	# Read results from:   generate_band_list
	# Generates word usage for every band

	cat "${BAND_LIST_FILE}" | awk -F' &' '{ print $1 }'  \
	| sed "s/'/'\"'\"'/g" \
	| tr '\n' '\0' \
	| xargs -0 -I {BAND} sh -c "
	echo '[{BAND}]'
	curl -q -o /dev/stdout --get --data-urlencode 'q=band_str:\"{BAND}\"' '${BASE_URL}/solr/${CORE}/select?facet.field=lyrics_txt_ja&facet=true&q.op=OR&rows=0'  \
	| jq '.facet_counts.facet_fields.lyrics_txt_ja'  \
	| ./_transform_json.awk  \
	| ./_add_translations.sed  > '${BANDS_DIR}/band-{BAND}.tex'
"
}




function retrieve_wordcounts() {

	LEXEME="$1"
	QUERY="$2"
	
	FACET_MINCOUNT=${FACET_MINCOUNT:-0}
	
	RESP=$(curl -q -o /dev/stdout --get --data-urlencode "${QUERY}" "${BASE_URL}/solr/${CORE}/select?facet.field=band_str&facet.mincount=${FACET_MINCOUNT}&facet=true&facet.limit=50&indent=true&q.op=OR&rows=0")
	
	echo "${RESP}" \
	| jq '.response.numFound' > "${WORDCOUNTS_DIR}/lex-${LEXEME}-numFound.tex"
	
	echo "${RESP}" \
	| jq '.facet_counts.facet_fields.band_str' \
	| ./_transform_json.awk \
	| ./_add_band_names.sed > "${WORDCOUNTS_DIR}/lex-${LEXEME}-wordcount.tex"
}




function songs_containing() {

	LEXEME="$1"
	Q="$2"
	
	curl -q -o /dev/stdout --get --data-urlencode "$Q" "${BASE_URL}/solr/${CORE}/select?facet.field=band_str&facet.mincount=1&facet=true&indent=true&rows=20"  \
	| jq '.response.docs[] | .id' \
	| sort \
	| sed -E 's/^"(.*) -- (.*)"$/"\1",\2/' \
	| ./_add_band_names.sed > "${CONTAINS_DIR}/contains-${LEXEME}.tex"
}




function get_all_lexemes() {

	# Read results from:   generate_bands_wordusage
	# generates a list of lexemes

	find "${BANDS_DIR}" -name 'band-*.tex' -print0  \
	| sed "s/'/'\"'\"'/g" \
	| xargs -0 -I {FILE} sh -c "
		cat '{FILE}' | awk -F' &' '{ print \$1 }' 
	"

}




function print_select_lexemes() {
	# Prints some interesting lexemes, one per line

	echo '
夢   心   胸   愛   恋   人  恋人   涙   夜   風   空   雨   雪   
生きる 生まれる 死   死ぬ 人生  命 
忘れる 泣く 声  世界   未来   思う 思い出す 思い出  気持ち 好き 笑う 変わる キス 
信じる 希望   望み
手  駅  消える 光   火
花   花火  花びら 桜   女  男  子  初  山  酒  離れる
時  瞬間   ずっと いつも 永遠  時代
幸せ 喜び 悲しみ 悲しい 嬉しい  楽しい 楽しむ
神  神様  天国  地獄  
' | sed -E -e 's/\s+/\n/g' -e '/^$/d'

}




function get_distinct_lexemes() {

	# Gets the list of lexemes, but only keep the ones that contain at least one kanji
	# Add the list of select lexemes
	# Sort the list, remove duplicates

	( get_all_lexemes | grep -P "\p{Han}" ;	
	  print_select_lexemes ) \
	| sort | uniq
}




function process_lexemes() {
	while read -r LEXEME
	do
		echo "Lexeme: ${LEXEME}" 		
	    retrieve_wordcounts "${LEXEME}"  "q=lyrics_txt_ja:\"${LEXEME}\""
	done
}




function generate_all_wordcounts() {
	# FOR FUTURE USE

	FACET_MINCOUNT=1
		
	get_distinct_lexemes | process_lexemes
}




function generate_select_wordcounts() {
	
	FACET_MINCOUNT=0

	print_select_lexemes | process_lexemes
}




function generate_songwriters_wordcounts() {

	for SONGWRITER in '甲本ヒロト' '真島昌利' '河口純之助'
	do

		curl -q -o /dev/stdout --get --data-urlencode "q=lyrics_by_str:\"${SONGWRITER}\"" "${BASE_URL}/solr/${CORE}/select?facet.field=lyrics_txt_ja&facet.mincount=1&facet=true&q.op=OR&rows=0" \
		| jq '.facet_counts.facet_fields.lyrics_txt_ja' \
		| ./_transform_json.awk \
		| ./_add_translations.sed > "${SONGWRITERS_DIR}/writer-${SONGWRITER}.tex"
	
	done
}




function get_mlt() {
	CORE=${CORE:-songs_jp}
	
	id=$1
	
	RESPONSE=$( ./get_mlt.sh "${id}" )

	echo "$RESPONSE" \
	| jq '.interestingTerms' \
	| sed -E '
		/^(\[|])/d
	' \
	| ./_add_translations.sed \
	| sed -E 's/&\s*(\\\\)$/\1/' > "${MLT_DIR}/${id} - interestingTerms.tex"

	# get docs
	echo "$RESPONSE" \
	| jq '.response.docs[] | .id' \
	| sed -E 's/^"(.+) -- (.+)"$/\1 \& \2 \\\\/' > "${MLT_DIR}/${id} - docs.tex"
}



generate_band_list

generate_overall_wordcounts

generate_bands_wordusage

generate_songwriters_wordcounts

# FOR FUTURE USE
# generate_all_wordcounts

generate_select_wordcounts


FACET_MINCOUNT=0

retrieve_wordcounts '神, 神様'   'q=lyrics_txt_ja:"神", lyrics_txt_ja:"神様"'
retrieve_wordcounts '約束, やくそく'   'q=lyrics_txt_ja:"約束", lyrics_txt_ja:"やくそく"'
retrieve_wordcounts '可愛い, かわいい, カワイイ'   'q=lyrics_txt_ja:"可愛い", lyrics_txt_ja:"かわいい", lyrics_txt_ja:"カワイイ"'



# Rare words

FACET_MINCOUNT=1

retrieve_wordcounts '木漏れ日'  'q=lyrics_txt_ja:"木漏れ日"'

# retrieve_wordcounts 'カボチャ, 南瓜'  'q=lyrics_txt_ja:"南瓜", lyrics_txt_ja:"カボチャ"'
# songs_containing 'カボチャ, 南瓜'  'q=lyrics_txt_ja:"南瓜", lyrics_txt_ja:"カボチャ"'




# Derogatory terms

FACET_MINCOUNT=1

retrieve_wordcounts 'クソ'        'q=lyrics_txt_ja:"クソ", lyrics_txt_ja:"くそ", lyrics_txt_ja:"糞"'
songs_containing 'クソ'       'q=lyrics_txt_ja:"クソ", lyrics_txt_ja:"くそ", lyrics_txt_ja:"糞"'

retrieve_wordcounts 'クソッタレ'  'q=lyrics_txt_ja:"クソッタレ", lyrics_txt_ja:"くそったれ", lyrics_txt_ja:"糞たれ"'
songs_containing 'クソッタレ' 'q=lyrics_txt_ja:"クソッタレ", lyrics_txt_ja:"くそったれ", lyrics_txt_ja:"糞たれ"'





# Pronouns

FACET_MINCOUNT=1

retrieve_wordcounts '私, わたし'   'q=lyrics_txt_ja:"私", lyrics_txt_ja:"わたし"'
retrieve_wordcounts 'あたし'   'q=lyrics_txt_ja:"あたし"'
retrieve_wordcounts '俺,おれ,オレ'   'q=lyrics_txt_ja:"俺", lyrics_txt_ja:"おれ", lyrics_txt_ja:"オレ"'
retrieve_wordcounts '僕, ぼく, ボク'   'q=lyrics_txt_ja:"僕", lyrics_txt_ja:"ぼく", lyrics_txt_ja:"ボク"'
retrieve_wordcounts '我, われ, ワレ'   'q=lyrics_txt_ja:"我", lyrics_txt_ja:"われ", lyrics_txt_ja:"ワレ"'
retrieve_wordcounts 'わたくし'   'q=lyrics_txt_ja:"わたくし"'

retrieve_wordcounts '私たち, 私達, わたしたち'   'q=lyrics_txt_ja:"私たち", q=lyrics_txt_ja:"私達", lyrics_txt_ja:"わたしたち"'
retrieve_wordcounts '俺たち, 俺達, おれたち, オレタチ'   'q=lyrics_txt_ja:"俺たち", q=lyrics_txt_ja:"俺達", lyrics_txt_ja:"おれたち", lyrics_txt_ja:"オレタチ"'
retrieve_wordcounts '僕ら, ぼくら, ボクラ'   'q=lyrics_txt_ja:"僕ら", lyrics_txt_ja:"ぼくら", lyrics_txt_ja:"ボクラ"'
retrieve_wordcounts '我々, 我我, われわれ'   'q=lyrics_txt_ja:"我々", q=lyrics_txt_ja:"我我", lyrics_txt_ja:"われわれ", lyrics_txt_ja:"ワレワレ"'
retrieve_wordcounts 'わたくしたち'   'q=lyrics_txt_ja:"わたくしたち"'


retrieve_wordcounts 'あなた'   'q=lyrics_txt_ja:"あなた", lyrics_txt_ja:"貴方"'
retrieve_wordcounts '君'   'q=lyrics_txt_ja:"君"'
retrieve_wordcounts 'お前, おまえ'   'q=lyrics_txt_ja:"お前", lyrics_txt_ja:"おまえ"'
retrieve_wordcounts 'てめえ'   'q=lyrics_txt_ja:"てめえ'

retrieve_wordcounts 'あなたがた, あなた方, 貴方方, 貴方々'   'q=lyrics_txt_ja:"あなたがた", lyrics_txt_ja:"あなた方", lyrics_txt_ja:"貴方方", lyrics_txt_ja:"貴方々"'


get_mlt 'THE BLUE HEARTS -- 歩く花'
get_mlt 'THE BLUE HEARTS -- ラブレター'
get_mlt 'THE BLUE HEARTS -- TRAIN-TRAIN'
get_mlt 'AKB48 -- 365日の紙飛行機'
get_mlt 'GReeeeN -- 風'
get_mlt 'GReeeeN -- 遥か'


