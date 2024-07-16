#!/bin/bash

show_help() {
    echo "Available options:"
    echo "--date -d: Display today's date"
    echo "--logs [n] -l [n]: Create n log files (default 100)"
    echo "--help -h: Display this help message"
    echo "--init: Clone repository and set PATH"
    echo "--error [n] -e [n]: Create n error files (default 100)"
}

create_logs() {
    count=${1:-100}
    for i in $(seq 1 $count); do
        echo "log$i.txt created by skrypt.sh on $(date)" > log$i.txt
    done
}

create_errors() {
    count=${1:-100}
    for i in $(seq 1 $count); do
        mkdir -p error$i
        echo "error$i.txt created by skrypt.sh on $(date)" > error$i/error$i.txt
    done
}

case "$1" in
    --date|-d)
        echo "Today's date is: $(date)"
        ;;
    --logs|-l)
        create_logs "$2"
        ;;
    --help|-h)
        show_help
        ;;
    --init)
        git clone <URL_repozytorium> new_repo
        export PATH=$PATH:$(pwd)/new_repo
        ;;
    --error|-e)
        create_errors "$2"
        ;;
    *)
        echo "Invalid option. Use --help for available options."
        ;;
esac
