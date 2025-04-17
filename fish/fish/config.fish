# iTerm
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# NVM
set nvm_prefix /usr/local/opt/nvm/

# Homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Bun JS
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Ruby
status --is-interactive; and source (rbenv init - fish | psub)

# OrbStack
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

function fish_prompt
    printf '%s[%s]%s$ ' \
        (set_color $fish_color_cwd) \
        (prompt_pwd) \
        (set_color normal)
end

function fish_greeting
end
