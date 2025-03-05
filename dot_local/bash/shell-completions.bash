# Load shell completions

# Mise completions
if command -v mise &> /dev/null; then
  eval "$(mise completion bash)"
fi

# Aqua completions
if command -v aqua &> /dev/null; then
  source <(aqua completion bash)
fi
