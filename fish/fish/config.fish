set nvm_prefix /usr/local/opt/nvm/

set -U fish_user_paths \
    `yarn global bin` \
    $HOME/.nvm \
    $HOME/.yarn/bin \
    /Applications/Postgres.app/Contents/Versions/latest/bin


function styleme
  workon styleme
  cd ~/Code/styleme
end

alias workon "vf workon"
set -gx PROJECT_HOME "$HOME/Code"
set -gx VIRTUALFISH_ACTIVATION_FILE ".vfile"

# After PATH modifications
eval (python -m virtualfish compat_aliases projects auto_activation)

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
