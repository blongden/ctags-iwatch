#!/bin/bash

function generate_tags_for_file {
	ctags -a -F $1
}

function clear_tags_for_file {
	sed -i -e "#$1#d" tags
}

# autotags.sh [event] [file]

if [ "$1" = 'IN_CREATE' ]; then
	generate_tags_for_file $2;
elif [ "$1" = 'IN_MOVED_TO' ]; then
	generate_tags_for_file $2;
elif [ "$1" = 'IN_MOVED_FROM' ]; then
	clear_tags_for_file $2;
elif [ "$1" = 'IN_DELETE' ]; then
	clear_tags_for_file $2;
elif [ "$1" = 'IN_MODIFY' ]; then
	clear_tags_for_file $2;
	generate_tags_for_file $2;
fi;
