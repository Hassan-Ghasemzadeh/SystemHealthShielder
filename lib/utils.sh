#!/usr/bin/env bash

log_event(){
    local level=$1
    local message=$2
    local timestamp=$(date +%Y-%m-%d %H-%M-%S)

    mkdir -p "$(dirname "$LOG_FILE")"

    case $level in
        "INFO")
            echo -e "[$timestamp] [\e[32mINFO\e[0m] $message" | tee -a "LOG_FILE"
            ;;
        "WARN")
            echo -e "[$timestamp] [\e[33mWARN\e[0m] $message" | tee -a "LOG_FILE"
            ;;
        "ERROR")
            echo -e "[$timestamp] [\e[31mERROR\e[0m] $message" | tee -a "LOG_FILE"
            ;;
    esac
}