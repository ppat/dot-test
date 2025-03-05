#!/bin/bash
set -euo pipefail

log_info() {
  echo -e "\033[0;34m[INFO]\033[0m $1"
}

log_success() {
  echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

log_warning() {
  echo -e "\033[0;33m[WARNING]\033[0m $1"
}

log_error() {
  echo -e "\033[0;31m[ERROR]\033[0m $1"
}

source_env_file() {
  local env_file="$1"
  if [[ ! -e "$env_file" ]]; then
    return
  fi
  set -o allexport
  source $env_file
  set +o allexport
}
