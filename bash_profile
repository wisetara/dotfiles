# export RBENV_ROOT=/usr/local/var/rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# Path to the bash it configuration
export BASH_IT="/Users/tarascherner/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# For Hireology automation spec running
export AUTOMATION_SECRET_KEY='vDz6U9FaZE8YnZSQ'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Welcome
echo -e "  🐻        🐨        🐼 "
echo -e "\033[0;31m\n  --------------------"
echo -e "\033[0;31m  - \033[0;36mIt is gonna be a great day, Tara! \033[0;31m-"
echo -e "\033[0;31m  --------------------\n"
echo -e "  🐐        🐭        🐱 "

git_branch='`git rev-parse --abbrev-ref HEAD 2> /dev/null | sed s/^/\ \|\ /`'
emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐐 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥)
emoji='`echo ${emojis[$RANDOM % 22]}`'

function prompt_command() {
    PS1="\n${yellow}$(ruby_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n$emoji${bold_cyan}  $(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

PROMPT_COMMAND=prompt_command;

# Set default text editor
export EDITOR="subl -w"
export GIT_EDITOR=vim

#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

git_branch='`git rev-parse --abbrev-ref HEAD 2> /dev/null | sed s/^/\ \|\ /`'
emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐐 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥)
emoji='`echo ${emojis[$RANDOM % 22]}`'
# PS1="\[\033[0;36m\]\T | \W$git_branch | $emoji  > \[\e[0m\]"

function prompt_command() {
    #PS1="${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${purple}$(ruby_version_prompt) ${yellow}\h ${reset_color}in ${green}\w ${reset_color}\n${green}→${reset_color} "
    PS1="\n${yellow}$(ruby_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n$emoji${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

alias gg="git log --oneline --abbrev commit --all -graph --decorate --color"
alias be="bundle exec"
alias reload=". ~/.bash_profile && clear && echo \'reloaded .bash_profile\'"
alias ttop="top -R -F -s 10 -o cpu"
alias mybash="subl ~/.bash_profile"
alias tcpu="top -F -R -o cpu" # what's eating up CPU cycles?
alias tmem="top -F -R -o vsize" # what's chewing up memory?
alias bo="git for-each-ref --sort=-committerdate refs/heads/" # bo stands for branch order
alias what_files="git diff --name-only wip"
alias rdm="rake db:migrate"
alias pull="git pull && bundle install && rake db:migrate && nvm use && npm i && npm run build"
alias rdtp="rake db:test:prepare"
alias rake="be rake"
alias subl="open -a /Applications/Sublime\ Text.app"
alias hire="cd ./app && nvm use"
alias workers="rake jobs:clear && rake jobs:work"
alias gco="git checkout"
alias chekcout="checkout"
alias linter="./node_modules/eslint/bin/eslint.js"
alias cleanup="git branch --merged | egrep -v '(^\*|wip|master)' | xargs git branch -d"
alias resque="bundle exec rake environment resque:work QUEUE=*"
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias go_shared="cd /Users/tarascherner/go_shared/"
alias marketing="cd /Users/tarascherner/marketing_service/"
alias envy="export $(cat .env | xargs)"
alias gorun="export $(cat .env | xargs) && go run *.go"
alias gtree="git log --graph --oneline --decorate"
alias ios="npm start & bundle exec rails s -b 0.0.0.0"
alias rspec="bundle exec rspec"
alias cop="rubocop"

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Auto-restart ssh-agent
eval "$(ssh-agent)"
ssh-add -K $HOME/.ssh/id_rsa

export PATH="$PATH:/usr/local/sbin"
export PATH="~/.rbenv/bin:$PATH"

export ANSIBLE_DIR="$HOME/Projects/Hireology/ansible" \
       OVERRIDE_DEPLOY_USER=true \
       DISABLE_UPDATE_ANSIBLE_REPOSITORY=true

eval "$(rbenv init -)"

export BASH_SILENCE_DEPRECATION_WARNING=1

# Go related items
[[ -s "/Users/tarascherner/.gvm/scripts/gvm" ]] && source "/Users/tarascherner/.gvm/scripts/gvm"
export PATH="$PATH:$HOME/go/bin:$GOPATH/bin"
export GOPATH="$HOME/go:$GOPATH"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
