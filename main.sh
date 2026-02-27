#!/usr/bin/env bash

# Safty standard for bash scripts
# set -e: Exit immediately if a command exits with a non-zero status.
# set -u: Treat unset variables as an error and exit immediately.
# set -o pipefail: Return the exit status of the last command in the pipeline that failed.
# IFS=$'\n\t': Set the Internal Field Separator to newline and tab,
# which helps to handle filenames with spaces and tabs correctly.
set -euo pipefail
IFS=$'\n\t'

# Define constants and source configuration
# APP_ROOT: The directory where the script is located
# readlink -f: returns the absolute path of the script, and dirname extracts the directory part
readonly APP_ROOT=$(dirname "$(readlink -f "$0")")
source "$APP_ROOT/config/app.conf"
source "$APP_ROOT/lib/utils.sh"

cleanup(){
    log_event "INFO" "Securely closing script..."
    exit 1
}
# trap: Sets a trap to execute the cleanup function when the script exits, 
# ensuring that any necessary cleanup actions are performed regardless of 
# how the script terminates.
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

#free: shows the total amount of free and used physical and swap memory in the system,
#as well as the buffers used by the kernel.
monitor_memory(){
    local mem_usage=$(free | grep Mem | awk '{print $3/$2 *100.0}') | cut -d. -f1

    if [[ "$mem_usage" -gt "$MEMORY_THRESHOLD" ]]
    then
        log_event "Warn" "Memory usage is high: ${mem_usage}%"
    else
        log_event "Warn" "Memory usage is low: ${mem_usage}%"
    fi
}

# The main function serves as the entry point of the script, orchestrating the execution of various tasks.
main(){
    log_event "INFO" "Starting system resource monitoring..."
    check_root
    monitor_cpu
    monitor_memory
    log_event "INFO" "System resource monitoring completed."
}

# The last line of the script calls the main function, passing any command-line arguments to it.
# This allows the script to be executed directly, and the main function will handle the overall flow of the program.
main "$@"