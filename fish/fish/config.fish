set nvm_prefix /usr/local/opt/nvm/

set -U fish_user_paths \
    `yarn global bin` \
    $HOME/.nvm \
    $HOME/.local/bin \
    /usr/local/opt/gettext/bin \
    /Applications/Postgres.app/Contents/Versions/latest/bin

function fish_prompt
    if set -q VIRTUAL_ENV
        printf '%s[%s]%s %s[%s]%s$ ' \
            (set_color -b blue white) \
            (basename "$VIRTUAL_ENV") \
            (set_color normal) \
            (set_color $fish_color_cwd) \
            (prompt_pwd) \
            (set_color normal)

    else
        printf '%s[%s]%s$ ' \
            (set_color $fish_color_cwd) \
            (prompt_pwd) \
            (set_color normal)
    end
end

status --is-interactive; and source (rbenv init -|psub)


function on-python-diff
    git diff --name-only master | grep ".py\$" | xargs $argv
end

status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function fish_greeting
end

set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
