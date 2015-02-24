#source /opt/boxen/env.sh

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
  }
function parse_pyenv_version_and_add_brackets {
  pyenv version-name | sed -e 's/\(.*\)/\ \[\1\]/' -e 's/^[ ]//'
  }
  PS1="\[\033[0;32m\]===========================================================================\n\[\033[0;32m\][\[\033[0m\]\[$(tput setaf 7)\]\!\[\033[0;32m\]]\[\033[0m\] \[$(tput setaf 7)\]\w \[\e[1;36m\]\$(parse_pyenv_version_and_add_brackets)\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "
