alias kill_esets='pgrep esets | xargs sudo kill -9'
alias ll='ls -alh'
# plus! https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh#L46
alias gpom='git pull origin master'
alias gs='git status'
alias gti='git'
alias gitlog='git log -"$(git rev-list --count HEAD ^origin/master)"'
alias gitdiff='git merge-tree $(git merge-base HEAD master) master HEAD | colordiff'
alias git_update_master='BRANCH=$(git branch --show-current); git checkout master && git pull && git checkout $BRANCH'
