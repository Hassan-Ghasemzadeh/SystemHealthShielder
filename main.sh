#!/usr/bin/env bash

# Safty standard for bash scripts
set -euo pipefail
IFS=$'\n\t'

readonly APP_ROOT=$(dirname "$(readlink -f "$0")")
source "$APP_ROOT/config/app.conf"
source "$APP_ROOT/lib/utils.sh"

cleanup(){
    log_event "INFO" "Securely closing script..."
    exit 1
}
trap cleanup EXIT

monitor_cpu(){
    #-b: (batch mode) prepares the response for processing with no graphic or color 
    #-n1 (number 1):show only one time and then exit
    #-d: (delimiter) show spliter charactor
    #-f1:(Field 1) shows field 1 after spli
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') | cut -d -f1

    if [[ "$cpu_usage" -gt "$CPU_THRESHOLD" ]]
    then
        log_event "Warn" "CPU usage is high: ${cpu_usage}%"
    else
        log_event "Warn" "CPU usage is low: ${cpu_usage}%"
    fi
}