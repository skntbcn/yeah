#!/bin/bash

# Variables
yeahpath="/path/to/yeah.repo/" 

_yeah()
{    
    # Cambiamos de directorio
    cd "$yeahpath"

    # Script Autocomplete
    local cur prev dirs files
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    dirs=$(ls -d "${yeahpath}*" 2>/dev/null | sed 's/\/$//' | awk -F'/' '{print $NF}')
    if [[ "${prev}" == "yeah.sh" ]]; then
        COMPREPLY+=("add")
        COMPREPLY+=("read")
    elif [[ "${prev}" == "read" || "${prev}" == "add" ]]; then
        if [[ -d "$yeahpath" ]]; then
            files=$(find . -type f | grep -v "yeah." | grep -v ^.$ | tr -d '.' | sed 's/\/$//' | sed 's/^\///' 2>/dev/null)
            COMPREPLY=( $(compgen -W "${files}") )
        fi
    else
	COMPREPLY+=("add")
        COMPREPLY+=("read")
    fi
}

complete -F _yeah "${yeapath}yeah.sh"
