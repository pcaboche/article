#! /usr/bin/gawk -f

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

/^\[/{next}
/^]/{next}

{
	$0 = gensub(/^\s*/, "", 1)
}

/^"/{
	KEY=$0
	next
}

{
	$0 = gensub(/,$/, "", 1)
	print KEY $0
}

