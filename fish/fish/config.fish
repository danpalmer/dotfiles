set nvm_prefix /usr/local/opt/nvm/

set -U fish_user_paths \
    `yarn global bin` \
    $HOME/.nvm \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    /usr/local/opt/gettext/bin \
    /Applications/Postgres.app/Contents/Versions/latest/bin \
    $fish_user_paths

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

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
starship init fish | source
