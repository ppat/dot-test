#!/bin/bash
set -euo pipefail

ENV_LOADER=$HOME/.local/bash/load-env.sh

# Source the environment loader script
if [ -f "$ENV_LOADER" ]; then
  # Save original IFS
  ORIG_IFS="$IFS"
  # Source the environment
  source "$ENV_LOADER" >/dev/null
  # Restore original IFS
  IFS="$ORIG_IFS"
else
  echo "Warning: Environment loader not found at $ENV_LOADER"
  # Set up minimal environment in case the loader doesn't exist yet
  export PATH="$HOME/.local/bin:$PATH"
fi

# Helper functions for scripts
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
