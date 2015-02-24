

#export COLOR_YELLOW='\e[1;33m'

#highlightColor=COLOR_YELLOW

source ~/.profile
alias ls='ls -G'
alias mfh='cdmf; ./test --hanky-config=../hanky_config.yaml --hanky-app mind --hanky-user sdennison --with-poster --hanky-url=http://hanky/ --hanky-app=mind_func'
alias cdmf='cd ~/Projects/mind_func/mind_func'
alias cdp='cd ~/Projects/phoenix'
alias cdpa='cd ~/Projects/homebrews/playing_around'
alias cdc='cd ~/Projects/content'
alias cdl='cd ~/Projects/larry'
alias cdr='cd ~/Projects/homebrews/randalf'
alias cdri='cd ~/Projects/Riker'
alias cds='cd ~/Projects/sovngarde'
alias gpum='git pull upstream master'
alias gcm='git checkout master; gpum; git push origin master'
alias gcb='git checkout -b'
alias c='clear'
alias vea='source env/bin/activate'
alias cdh='cd ~/Projects/homebrews/herodotus'
alias p2='pyenv local 2.7.6'
alias p3='pyenv local 3.4.0'
alias dgb='git branch -d $(git branch | grep -v master | grep -v api)'
alias sg='grep -rI --exclude-dir=env'
alias rmpyc='find . -name "*.pyc" -type f|xargs rm -f'

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

#Dynamically load python interpreter depending on version
#function pyenvver {
#  pyenv version-name | sed -e 's/\(3\).*/\ \1/'
#}
#pyenvv=$(pyenvver)
#if [ $pyenvv == '3' ]
#then
#    pyint='bpython'
#else
#    pyint='python'
#fi
#alias python='source ~/.bash_profile; $pyint'
alias python='python'

#LS_COLORS='gafacadabaeaeahahahaha' ; export LS_COLORS
#LSCOLORS='gafacadabaeaeahahahaha' ; export LS_COLORS
LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;40:cd=34;40:su=37;40:sg=37;40:tw=37;40:ow=37;40:'; export LS_COLORS

alias shiggify='source ~/.bash_profile; source ~/.profile; source ~/.bashrc'
alias s='shiggify'

# Handy alias for getting master branches all in sync
export PATH="/usr/local/bin:$PATH"
export HOMEBREWPATH=/opt/boxen/homebrew/bin
export PATH="$HOMEBREWPATH:$PATH"
#export PYENV_ROOT=/opt/boxen/homebrew/opt/pyenv/shims
#export PATH="$PYENV_ROOT:$HOMEBREWPATH:$PATH"
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

##
# Your previous /Users/sdennison/.bash_profile file was backed up as /Users/sdennison/.bash_profile.macports-saved_2014-09-03_at_14:16:01
##

# MacPorts Installer addition on 2014-09-03_at_14:16:01: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Phoenix variables
export PUBLISH_APPROVAL_MAILING_LIST='sdennison@leapfrogonline.com'
export RIKER_ROOT='https://qa.riker.leapfrogonline.com/'
export RIKER_NEW_TESTRUN_PATH='api/tests/new'
export RIKER_SUPPORTED_PATH='api/supported'
eval "$(pyenv init -)"
