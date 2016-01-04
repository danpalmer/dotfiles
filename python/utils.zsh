install_opencv_in_virtualenv() {
    if [ -z ${VIRTUAL_ENV} ]; then
        echo "You are not in a virtual environment"
        return
    fi

    cp /usr/local/lib/python2.7/site-packages/cv* "$VIRTUAL_ENV/lib/python2.7/site-packages"
}
