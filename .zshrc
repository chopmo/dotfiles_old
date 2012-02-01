# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

## Make sure the brew stuff is before the builtins (eg. ctags)
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# Aliases
alias ls="/bin/ls -G"
alias ll="ls -laGFh"
alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias reinit="source ~/.zshrc"

alias de="RAILS_ENV=development"
alias te="RAILS_ENV=test"
alias pe="RAILS_ENV=production"

alias deploy="git push && b/cap deploy"

# Set editors
# export EDITOR="emacs -q -nw"
EDITOR="vim"
export GEMEDITOR="mate"

alias webrick='ruby -e "require '\''webrick'\'';include WEBrick; server = HTTPServer.new( {:DocumentRoot => '\''./'\'', :Port => 5001} ); ['\''INT'\'', '\''TERM'\''].each do |signal|; trap(signal) { server.shutdown }; end; server.start"'

alias rails_tags='ctags -a -e -f TAGS --tag-relative -R app lib vendor'
alias maintain_rails_tags='while [ true ]; do rails_tags; sleep 120; done'

alias accept='bundle exec rspec --drb spec/acceptance/*_spec.rb'

alias sp='run_accept.sh'
alias mig='rake db:migrate && rake db:test:clone'
alias be='bundle exec'

export ANDROID_SDK_HOME=/usr/local/Cellar/android-sdk/r11
export LANG="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function uservm {
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
    export PS1="<RVM> [ \$(~/.rvm/bin/rvm-prompt) - \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') - \w ] $ "
}

function userbenv {
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    alias re='rbenv'
    export PS1="<rbenv> [ \$(rbenv version-name) - \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') - \w ] $ "
}


# Not used yet - found here: http://unix.stackexchange.com/questions/13464/is-there-a-way-to-find-a-file-in-an-inverse-recursive-search
upsearch () {
  slashes=${PWD//[^\/]/}
  directory=$PWD
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e $directory/$1 && echo $directory/$1 && return
    directory=$directory/..
  done
}

alias re=userbenv
alias rv=uservm

export LSCOLORS=gxfxcxdxbxegedabagacad
alias dstore-clean='find . -type f -name .DS_Store -print0 | xargs -0 rm'
alias rtags="ctags -e -R app lib vendor tasks"

alias emacs='TERM=xterm-256color /Applications/Emacs.app/Contents/MacOS/Emacs'

alias gp='git pull'
alias gd='git diff'
alias gs='git status'

alias gopublish='cd ~/wb/gopublish && userbenv'

alias ss='b/rspec spec'
alias vb='cd ~/projects/voicebox && userbenv'
alias koblo='cd ~/wb/koblo && userbenv'
alias iac='cd ~/wb/iacez && uservm'
alias dts='cd ~/wb/dts && userbenv'

alias px='ps aux | grep '
alias restart='touch tmp/restart.txt'
alias r=rails

alias ci='git commit -m'
alias aa='git add --all'
alias st='git st'

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
unsetopt correct_all
