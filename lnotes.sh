#!/usr/bin/bash
set -euo pipefail
IFS=$' \n\t'

cd "$(dirname "${BASH_SOURCE[0]}")"
export LNOTES_DIR="$(pwd)"

source "${LNOTES_DIR}/scripts/util.sh"
source "${LNOTES_DIR}/scripts/help.sh"

if [[ $# -eq 0 ]]; then
    doc::help && exit 1

else
  cmd="$1"
  case "$cmd" in
    info)    ( "${LNOTES_DIR}/scripts/info.sh" "$@" ) ;;
    compile) ( "${LNOTES_DIR}/scripts/compile.sh" "$@" ) ;;
    init)    ( "${LNOTES_DIR}/scripts/init.sh" "$@" ) ;;
    push)    ( "${LNOTES_DIR}/scripts/push.sh" "$@" ) ;;
    watch)   ( "${LNOTES_DIR}/scripts/watch.sh" "$@" ) ;;
    list)    ( "${LNOTES_DIR}/scripts/list.sh" "$@" ) ;;
    install) (
        cd "$LNOTES_DIR/latex-stuff"
        chmod +x "$LNOTES_DIR/latex-stuff/install"
        "$LNOTES_DIR/latex-stuff/install"
    ) ;;
    *)       doc::help "$@" ;;
  esac

fi