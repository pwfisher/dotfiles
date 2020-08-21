#!/bin/zsh

# Install custom .zprofile
if [[ -e ~/.zprofile && ! -e ~/.zprofile.pre-pwfisher-dotfiles ]]; then
  mv ~/.zprofile ~/.zprofile.pre-pwfisher-dotfiles
fi
ln -sf "$PWD/.zprofile" ~/.zprofile

# Install oh-my-zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-command-time
if [[ ! -e ~/.oh-my-zsh/custom/plugins/command-time ]]; then
  git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
fi
if [[ $(grep -c command-time ~/.zshrc) = 0 ]]; then
  sed -Ei '.pre-pwfisher-dotfiles' 's/^plugins=\((.*)\)/plugins=\(\1 command-time\)/' ~/.zshrc
fi

# Add zsh customizations
for x (aliases node nvm-autoload path terminal-titles yarn)
  ln -sf "$PWD/pwfisher-$x.zsh" ~/.oh-my-zsh/custom/

# Success
echo "pwfisher dotfiles installed"
