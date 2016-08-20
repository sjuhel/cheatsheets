#!/bin/bash
################################################################################
# This script allow you to read any cheat sheet within the files/ directory.
# It uses the command 'less' to read it.
################################################################################


usage () {
    sheets_available="$(ls -l files/ | awk 'NR > 1 {print $NF}')"

    echo "Usage: $(basename $0) <cheatsheet>"
    echo ""
    echo "Cheat Sheets available:"
    for sheet in $sheets_available; do
        to_print="$(echo $sheet | sed -e 's/\.txt$//')"
        echo "  ${to_print}"
    done
    echo ""
}

sheets_root="./files/"
sheet_name="$1"

if [[ -z "$sheet_name" ]]; then
    usage
    exit 0
elif [[ ! -e "${sheets_root}${sheet_name}.txt" ]]; then
    echo "[-] error: ${sheets_root}${sheet_name}.txt does not exist"
    exit 1
fi

less ${sheets_root}${sheet_name}.txt
exit 0

