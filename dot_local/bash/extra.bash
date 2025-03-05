# Additional Bash customizations

# Enable kubectl completion
if command -v kubectl &> /dev/null; then
  source <(kubectl completion bash)
  complete -F __start_kubectl k
fi

# Enable helm completion
if command -v helm &> /dev/null; then
  source <(helm completion bash)
fi

# # Better history command defaults
# export HISTSIZE=10000
# export HISTFILESIZE=20000
# export HISTCONTROL=ignoreboth:erasedups
# export HISTTIMEFORMAT="%F %T "
shopt -s histappend
