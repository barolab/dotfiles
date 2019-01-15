#!/bin/bash

export PATH="$HOME/.cargo/bin:$PATH"

for file in ~/.{bashrc,prompt,aliases,functions,dockers,path,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file
