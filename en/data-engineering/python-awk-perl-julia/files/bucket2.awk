#!/bin/gawk -f

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

BEGIN {
	IGNORECASE = 1;
	outdir = "out/awk"
	file_num = 0
	filename = outdir "/0000_BEGIN.sql"
	
	### Create the output directory if it does not exist
	system( "mkdir -p " outdir )
	
	### Empty first file
	printf("") > filename
}

# Rule 1
{
	if ( match($0, /^-- Table structure for table `?(\w+)`?/, a) ) {
		### This is a match. We need to change of bucket
			
		close(filename)
		file_num++ 
		filename = sprintf("%s/%04d_%s.sql", outdir, file_num, a[1])
				
		### Print the filename to stderr
		print filename  > "/dev/stderr"
		
		print  > filename
		next     # Move to the next line. Ignore the remaining rules.
	}
}

# Rule 2
{
	print >> filename
}

END {
	close(filename)
}
