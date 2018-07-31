function fish_prompt
    if [ -z $VIRTUAL_ENV ]
      printf '%s@%s%s[%s]%s$ ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (pwd) (set_color normal)
    else
      printf '%s(%s)%s %s@%s%s[%s]%s$ ' (set_color -b blue white) (basename "$VIRTUAL_ENV") (set_color normal) (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (pwd) (set_color normal)
    end
end
