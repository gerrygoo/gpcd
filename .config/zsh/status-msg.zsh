# Source: https://github.com/ayazhafiz/hmcd

info() {
  echo "${0##*/}\tINFO:\t$1" >&2
}

debug() {
  echo "${0##*/}\tDEBUG:\t$1" >&2
}

warn() {
  echo "${0##*/}\tWARNING:\t$1" >&2
}

error() {
  echo "${0##*/}\tERROR:\t$1" >&2
}
