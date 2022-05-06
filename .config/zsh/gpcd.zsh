# avoid recursion issues
echo ".gpcd" >> .gitignore

# define the alias
alias gpcd='/usr/bin/git --git-dir=$HOME/.gpcd/ --work-tree=$HOME'

# initialize the repo
gpcd_clone() {
  git clone --bare $1 $HOME/.gpcd
	gpcd config --local status.showUntrackedFiles no
	echo "run 'gpcd checkout' to start using gpcd"
}
