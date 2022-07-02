#!/usr/bin/python3

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

import sys
import re
import os
import codecs
sys.stdin = codecs.getreader('utf8')(sys.stdin.detach(), errors='ignore')
#sys.stdin.reconfigure(errors='ignore')

#mode='a+'   # append to existing file
mode='w+'    # write to file

outdir="out/python"
file_num = 0
filename = outdir + "/0000_BEGIN.sql"

pattern=r'^-- Table structure for table `?(?P<TABLE>\w+)`?'
parser = re.compile(pattern, re.IGNORECASE)

### Create the output directory if it does not exist
os.makedirs(outdir, exist_ok = True)

### File Handler (FH)
FH = open(filename, mode)

try:
	for line in sys.stdin :
		res = parser.match(line)
		if res:
			### New table detected. Need to switch files
			FH.close()
			table = res.group('TABLE')
			file_num += 1
			filename = "{dir}/{num:04d}_{tbl}.sql".format(
				dir = outdir, num = file_num, tbl = table )
			
			### Print the filename to stderr
			sys.stderr.write(filename + "\n")
			
			FH = open(filename, mode)
		FH.write(line)
finally:
	FH.close()

