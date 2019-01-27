#!/bin/bash

for file in ~/.{bashrc,prompt,aliases,functions,apps,path,help,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file
