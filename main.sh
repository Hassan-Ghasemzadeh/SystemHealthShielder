#!/usr/bin/env bash

# Safty standard for bash scripts
set -euo pipefail
IFS=$'\n\t'

readonly APP_ROOT=$(dirname "$(readlink -f "$0")")
source "$APP_ROOT/config/app.conf"
source "$APP_ROOT/lib/utils.sh"