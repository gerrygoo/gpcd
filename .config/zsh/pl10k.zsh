# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]] && {
  echo "no oh-my-zsh custom directory, not sourcing p10k, try:"
  echo 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"'
	return 1
}

source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f "$HOME/.p10k.zsh" ]] || source ~/.p10k.zsh

