# define the alias
alias gpcd='git --git-dir=$HOME/.config/ --work-tree=$HOME'

# initialize the repo
gpcd_clone() {
  git clone --bare $1 $HOME/.config
  gpcd config --local status.showUntrackedFiles no
  echo "run 'gpcd checkout' to start using gpcd"
}
