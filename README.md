# dotfiles

Environment configuration

# Usage

Run the install script.

```zsh
./install.sh
```

In Terminal preferences > Tab, uncheck all title options.

You'll need to add `.hushlogin` to your `.gitignore` files. Maybe this isn't worth it?

# Features

- Terminal title
- nvm autoload
- node space fix
- hushlogin
- oh-my-zsh
- zsh-command-time

## Terminal title

Shows `directory` when idle, and `directory · command` when running.

```zsh
stt_tab "${PWD##*/} · .zprofile"
function precmd () { stt_tab "${PWD##*/}" }
function preexec() { stt_tab "${PWD##*/} · $1" }
```

## oh-my-zsh

[default .zshrc](https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template)
