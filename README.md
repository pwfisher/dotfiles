# dotfiles

Environment configuration

# Usage

Run the install script or copy/paste.

```zsh
./install.sh
```

In Terminal preferences > Tab, uncheck all title options.

You'll need to add `.hushlogin` to your `.gitignore` files. Maybe this isn't worth it?

# Features

- Terminal title
- prompt
- nvm autoload
- node space fix
- hushlogin

## Terminal title

Shows `directory` when idle, and `directory · command` when running.

```zsh
stt_tab "${PWD##*/} · .zprofile"
function precmd () { stt_tab "${PWD##*/}" }
function preexec() { stt_tab "${PWD##*/} · $1" }
```
