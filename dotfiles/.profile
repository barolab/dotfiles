#!/bin/bash

for file in ~/.{extra,bashrc,prompt,aliases,functions,apps,path,help,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file
