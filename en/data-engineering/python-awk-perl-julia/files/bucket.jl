#!/usr/bin/julia

# This source code is under the BSD License
# Copyright 2022. Pierre S. Caboche

using Base.Filesystem
using Printf

function put_in_buckets(outdir)

	file_num = 0
	filename = outdir * "/0000_BEGIN.sql"
	
	regex = r"^-- Table structure for table `?(?<TABLE>\w+)`?"i
	mkpath(outdir, mode=0o777)
	
	mode="w+"
	FH = open(filename, mode)
	
	for line = eachline()
		m = match(regex, line)
		
		if !isnothing(m)
			table_name = m[:TABLE]
			
			close(FH)
			
			file_num += 1
			filename = @sprintf("%s/%04d_%s.sql", outdir, file_num, table_name)
			
			### Output the filename to logger
			@info filename
			
			FH = open(filename, mode)
		end
	
		write(FH, line, "\n")
	end
	
	close(FH)
end

put_in_buckets("out/julia")

