#!/usr/bin/gawk -f

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

{
	if ( match($0, /^-- Table structure for table `?(\w+)`?/, a) ) {
		### This is a match. We need to change of bucket
		
		table_name = a[1]
			
		close(filename)
		file_num++ 
		filename = sprintf("%s/%04d_%s.sql", outdir, file_num, table_name)
				
		### Print the filename to stderr
		print filename  > "/dev/stderr"
			
		print  > filename
	}
	else {
		print >> filename
	}
}

END {
	close(filename)
}
