#!/usr/bin/perl

# This source code is under the BSD License
# Copyright 2022 Pierre S. Caboche

use File::Path qw(make_path) ;

BEGIN: {
	$outdir = "out/perl" ;
	$file_num = 0 ;
	$filename = $outdir . "/0000_BEGIN.sql" ;
	
	# $mode = '>>' ;  # append
	$mode = '>' ;     # overwrite
	
	### Create the output directory if it does not exist
	make_path($outdir, { chmod=>0770 }) ;
	
	### File Handler ("FH")
	open(FH, $mode, $filename) or die $! ;
}

while (<>) {
	
	if ( $_ =~ /^-- Table structure for table `?(?<TABLE>\w+)`?/i ){
	
		### This is a match. We need to change of bucket
		$table_name = $+{TABLE} ;
		
		close(FH) ;
		$file_num++ ;
		$filename = sprintf("%s/%04d_%s.sql", $outdir, $file_num, $table_name) ;
		
		### Print the filename to stderr
		print STDERR $filename . "\n" ;
		
		open(FH, '>', $filename) or die $! ;
	}
	print FH ;
}

END: {
	close(FH) ;
}
