alias rmpycs="find . -name '*.pyc' -delete"

export WORKON_HOME=$HOME/.virtualenvs

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

pip install -r requirements-common.txt
pip install -r requirements-2.txt

pip3 install -r requirements-common.txt
pip3 install -r requirements-3.txt
