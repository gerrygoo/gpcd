# google helpers/aliases

source /etc/bash_completion.d/g4d

function gcert() {
  if [[ -n $TMUX ]]; then
    eval $(tmux show-environment -s)
  fi
  command gcert "$@" &&
    /google/data/ro/users/di/diamondm/engfortunes/fortune.sh
}

alias tmux=tmx2

monarch-policies() {
  blaze run experimental/users/aktau/cmd/monarch-policies:monarch-policies -- $@;
}

alias buildfix='/google/data/ro/teams/ads-integrity/buildfix'
blaze_dbg() { blaze build -c dbg --dynamic_mode=off $@; }
iblaze_dbg() { iblaze build -c dbg --dynamic_mode=off $@; }
iblaze_dbg_t() { iblaze test -c dbg --dynamic_mode=off $@; }

source /etc/bash_completion.d/hgd
alias hg=chg
alias hgls="hg citc -l"
hgcd() { cd "/google/src/cloud/ggerardo/$1/google3" }
alias hgae="hg amend; hg evolve"
alias hgau="hg amend; hg upload"
alias hgaeu="hg amend; hg evolve; hg upload tree"

alias novacd="cd wireless/android/nova/"
alias cclean="/google/src/head/depot/google3/devtools/maintenance/cclean/cclean"
alias mdformat="/google/bin/releases/corpeng-engdoc/tools/mdformat"

alias hotswap=wireless/android/nova/tools/hotswap_local_nova_frontend.sh
alias nfe=wireless/android/nova/tools/run_local_nova_frontend.sh
alias ncis=wireless/android/nova/tools/run_local_ncis.sh
alias checkacl=/google/data/ro/projects/ganpati/aclcheck
alias mint='cd /google/src/files/head/depot/google3'
alias translator=wireless/android/nova/tools/run_local_translator.sh
