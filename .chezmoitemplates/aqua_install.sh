
aqua_install() {
  local tags="$1"

  log_info "CLI Tools | Tags[${tags}] | Initializing Aqua..."
  if ! command -v aqua > /dev/null; then
    log_error "CLI Tools | Tags[${tags}] | Aqua binary is not in path, cannot proceed!"
    exit 1
  fi
  if [[ ! -e "$AQUA_GLOBAL_CONFIG" ]]; then
    log_error "CLI Tools | Tags[${tags}] | Global aqua configuration does not exist, cannot proceed!"
    exit 1
  fi
  if [[ -e "$AQUA_POLICY_CONFIG" ]]; then
    log_info "CLI Tools | Tags[${tags}] | Allowing aqua policy file: $AQUA_POLICY_CONFIG..."
    aqua policy allow $AQUA_POLICY_CONFIG
  fi
  log_info "CLI Tools | Tags[${tags}] | Installing or upgrading aqua packages..."
  aqua install --all --tags $tags 2>&1 | sed -E 's|^(.*)|  \1|g'
  log_success "CLI Tools | Tags[${tags}] | Aqua install is complete."
  echo
  log_info "CLI Tools | Tags[${tags}] | Display installed packages..."
  aqua list --installed --all | column -t 2>&1 | sed -E 's|^(.*)|  \1|g'  
}
