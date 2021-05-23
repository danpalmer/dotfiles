function link-venv -d "Link a virtualenv given by NAME to .venv in this directory"
    ln -s $HOME/.pyenv/versions/$argv[1] .venv
    echo "Linked $HOME/.pyenv/versions/$argv[1] to .venv"
end
