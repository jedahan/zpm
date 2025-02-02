#!/usr/bin/env zsh

_ZPM_PATH=""
_ZPM_fpath=()
_ZPM_files_for_source=()
_ZPM_files_for_async_source=()

_ZPM_DIR=${ZPM_DIR:-"${${(%):-%x}:A:h}"}
export _ZPM_DIR
unset ZPM_DIR

_ZPM_PLUGIN_DIR=${ZPM_PLUGIN_DIR:-"$HOME/.local/lib/zpm"}
_ZPM_PLUGIN_DIR="${_ZPM_PLUGIN_DIR:A}"
export _ZPM_PLUGIN_DIR
unset ZPM_PLUGIN_DIR

_ZPM_CACHE=${ZPM_CACHE:-"$HOME/.zpm-cache.zsh"}
_ZPM_CACHE="${_ZPM_CACHE:A}"
export _ZPM_CACHE
unset ZPM_CACHE

if [[ -f ~/.zpm-cache.zsh ]]; then
  source ~/.zpm-cache.zsh
else
  source "${_ZPM_DIR}/lib/functions.zsh"
  source "${_ZPM_DIR}/lib/initialize.zsh"
  source "${_ZPM_DIR}/lib/imperative.zsh"
fi

function _post_fn () {
  TMOUT=5
  source "${_ZPM_DIR}/lib/completion.zsh"
}

TMOUT=1

add-zsh-hook background _post_fn
