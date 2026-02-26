#!/usr/bin/env bash


log_event(){
    local level=$1
    local message=$2
    local timestamp=$(date +%Y-%m-%d %H-%M-%S)

    mkdir -p "$(dirname "$LOG_FILE")"

    case $level in
        "INFO")\
            #green
            echo -e "[$timestamp] [\e[32mINFO\e[0m] $message" | tee -a "LOG_FILE"
            ;;
        "WARN")
            #yellow
            echo -e "[$timestamp] [\e[33mWARN\e[0m] $message" | tee -a "LOG_FILE"
            ;;
        "ERROR")
            #red
            echo -e "[$timestamp] [\e[31mERROR\e[0m] $message" | tee -a "LOG_FILE"
            ;;
    esac
}


check_root(){
    if [[ $EUID -ne 0 ]]
    then
        log_event "ERROR" "This script must be run as root. Exiting."
        exit 1
    fi
}