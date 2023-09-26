#!/bin/bash

# commands

commands=("man" "ls" "find")

for cmd in "${commands[@]}"; do
	#get the man page content, count the lines and store it.
	man_page=$(man "$cmd")
	line_count=$(echo "$man_page" | wc -l)

	#print the command name and line count
	echo "$cmd $line_count"
done | sort -rnk2 



#echo ls, $(man ls| wc -l) > /tmp/temp-file
#cat /tmp/temp-file

#echo man, $(man man| wc -l) >> /tmp/temp-file
#cat /tmp/temp-file

#echo find, $(man find| wc -l) >> /tmp/temp-file
#cat /tmp/temp-file


#cat /tmp/temp-file | sort
#sort < /tmp/temp-file
#should get same result


