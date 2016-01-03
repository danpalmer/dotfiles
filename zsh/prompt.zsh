function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "[${VIRTUAL_ENV:t}]"
}

PROMPT='$(virtualenv_prompt_info)%{$fg[magenta]%}[%c]%{$reset_color%}$(git-radar --zsh --fetch) '
