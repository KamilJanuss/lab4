#!/bin/bash

case "$1" in
    --date)
        echo "Today's date is: $(date)"
        ;;
    --logs)
        count=${2:-100}
        for i in $(seq 1 $count); do
            echo "log$i.txt created by skrypt.sh on $(date)" > log$i.txt
        done
        ;;
    --help)
        echo "Available options:"
        echo "--date: Display today's date"
        echo "--logs [n]: Create n log files (default 100)"
        echo "--help: Display this help message"
        ;;
    *)
        echo "Invalid option. Use --help for available options."
        ;;
esac
