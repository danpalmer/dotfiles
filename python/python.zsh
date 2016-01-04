alias rmpycs="find . -name '*.pyc' -delete"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

pyenv virtualenvwrapper
