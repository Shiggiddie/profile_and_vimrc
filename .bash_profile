if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# VSCode shortcut "code ." will open VSCode at current working dir
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

bind '"\C-p": shell-backward-kill-word'
source ~/.profile
source dnvm.sh
alias mfh='cdmf; ./test --hanky-config=../hanky_config.yaml --hanky-app mind --hanky-user sdennison --with-poster --hanky-url=http://hanky/ --hanky-app=mind_func'
alias cddn='cd ~/Projects/dn'
alias cdp='cd ~/Projects'
alias cdpa='cd ~/Projects/playing_around'
alias cdpap='cd ~/Projects/playing_around/playing_with_python'
alias cdpar='cd ~/Projects/playing_around/playing_with_ruby'
alias cdpaj='cd ~/Projects/playing_around/playing_with_java'
alias cdpan='cd ~/Projects/playing_around/playing_with_nodejs'
alias cdpam='cd ~/Projects/playing_around/playing_with_misc'
alias cdc='cd ~/Projects/content'
alias cdl='cd ~/Projects/larry'
alias cdr='cd ~/Projects/homebrews/randalf'
alias cdri='cd ~/Projects/Riker'
alias cds='cd ~/Projects/sovngarde'
alias gpom='git pull origin master'
alias gcm='git checkout master; gpom; git push sean master'
alias gcb='git checkout -b'
alias c='clear'
alias vea='source env/bin/activate'
alias cdh='cd ~/Projects/homebrews/herodotus'
alias p2='pyenv local 2.7.6'
alias p3='pyenv local 3.4.0'
alias dgb='git branch -d $(git branch | grep -v master | grep -v api)'
alias sg='grep -rI --exclude-dir=env'
alias rmpyc='find . -name "*.pyc" -type f|xargs rm -f'
alias ls='ls -G'

# global search and replace under current directory
# $1 - The regex you wish to match that, if within a file, will nominate that file for replacement
# $2 - The regex that will match the value to be replaced
# $3 - The replacement value
search_find_replace() {
    grep -rl $1 * | xargs sed -i '' "s/$2/$3/g"
}
alias sfr=search_find_replace

# Find all processes running on a port
# $1 - port #
find_processes_on_port() {
    sudo lsof -i tcp:$1
}
alias port=find_processes_on_port

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
  }
function parse_pyenv_version_and_add_brackets {
  pyenv version-name | sed -e 's/\(.*\)/\ \[\1\]/' -e 's/^[ ]//'
  }
function parse_rbenv_version_and_add_brackets {
  rbenv version-name | sed -e 's/\(.*\)/\ \[\1\]/' -e 's/^[ ]//'
  }

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)
PS1="\[$green\][\[$reset\]\!\[$green\]]\[$reset\] \w \[$cyan$bold\]\$(parse_pyenv_version_and_add_brackets)\[$reset\]\[$red$bold\]$(parse_rbenv_version_and_add_brackets)\[$reset\]\[$green\]\$(parse_git_branch_and_add_brackets) \[$reset\]\$ "

LSCOLORS='gxfxcxdxbxegedabagacad'; export LSCOLORS

alias s='source ~/.bash_profile; source ~/.profile; source ~/.bashrc'

# Handy alias for getting master branches all in sync
export PATH="/usr/local/bin:$PATH"
export HOMEBREWPATH=/opt/boxen/homebrew/bin
export PATH="$HOMEBREWPATH:$PATH"

# Setting up the JAVA_HOME environment variable
export JAVA_HOME=$(/usr/libexec/java_home)

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
