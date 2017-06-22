# Load antigen
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found

antigen apply
