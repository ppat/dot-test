#!/bin/bash
set -euo pipefail

# Source the environment loader script
if [ -f "$HOME/.local/bash/load_env.sh" ]; then
    # Save original IFS
    ORIG_IFS="$IFS"
    # Source the environment
    source "$HOME/.local/bash/load_env.sh" >/dev/null
    # Restore original IFS
    IFS="$ORIG_IFS"
else
    echo "Warning: Environment loader not found at $HOME/.local/bash/load_env.sh"
    
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
