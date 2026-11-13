goto() {
    emulate -L zsh

    if [[ -z "$1" ]]; then
        echo "usage: goto <filename>"
        return 1
    fi

    local -a matches
    matches=("${(@f)$(find . -iname "*$1*" 2>/dev/null)}")

    if [[ ${#matches[@]} -eq 0 || -z "${matches[1]}" ]]; then
        echo "no matches found"
        return 1
    fi

    if [[ ${#matches[@]} -eq 1 ]]; then
        cd "${matches[1]:h}" && lf
        return
    fi

    print -l -- "${matches[@]}"

    local -a dirs
    dirs=("${matches[@]:h}")

    local common="${dirs[1]}"
    local d
    for d in "${dirs[@]:2,-1}"; do
        while [[ "$d" != "$common" && "$d" != "$common"/* ]]; do
            common="${common:h}"
        done
    done

    cd "$common"
} 
