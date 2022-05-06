# .config/zsh file
ZSH_ETC="$HOME/.config/zsh"

# instant prompt should stay close to the top
source "$ZSH_ETC/instant-prompt.zsh"

# gpcd
source "$ZSH_ETC/gpcd.zsh"

# env variables
export PATH="$HOME/bin:$PATH"
source "$ZSH_ETC/oh-my-zsh.zsh"

# nvim
source "$ZSH_ETC/nvim.zsh"

# !google
source "$ZSH_ETC/google.zsh"
export GUNIT_COLOR="yes"

# scripts that must go last
source "$ZSH_ETC/pl10k.zsh"
source "$ZSH_ETC/fzf.zsh"

