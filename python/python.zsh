alias rmpycs="find . -name '*.pyc' -delete"

export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export VIRTUAL_ENV_DISABLE_PROMPT=1

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

pyenv virtualenvwrapper
