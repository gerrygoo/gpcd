source "$ZSH_ETC/status-msg.zsh"

if ! [ -x "$(command -v nvim)" ]; then
  warn "Neovim (\`nvim\') is not installed; not loading configuration." >&2
  return
fi

export NVIM_CONFIG_PATH="$HOME/.config/nvim"
export NVIM_SHARE_PATH="$HOME/.local/share/nvim"

export VISUAL="/usr/local/bin/nvim"
alias vi="$VISUAL"
alias vim="$VISUAL"
alias vt="vi +term"
