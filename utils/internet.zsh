myip () {
    curl http://ipinfo.io/ip
}

json () {
    # Pretty prints when called with, eg. curl [..] | json
    python -m json.tool
}

youtube-mp3 () {
    local url="${1}"
    shift
    youtube-dl "${url}" --extract-audio --audio-format mp3 --restrict-filenames "${@}"
}
