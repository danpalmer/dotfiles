# dotfiles

##### How to use

 - `install` files are run at bootstrap time to do installing.
 - `path.zsh` files are sourced first at startup time, to set paths.
 - All `*.zsh` files are sourced after path files, at startup time, to do things like exporting variables.
 - Apps that store state in `~/Library/Application Support` should be synced using [Mackup](https://github.com/lra/mackup), by adding them to `apps/mackup.cfg.symlink`

##### Credits

Somewhat ripped off from `holman/dotfiles` and `mathiasbynens/dotfiles`.
