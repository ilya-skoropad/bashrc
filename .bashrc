#---------------------------------------------------------------------------------------------------------------------------------------
#   1.  ENVIRONMENT SETUP
#---------------------------------------------------------------------------------------------------------------------------------------

# set a home directory
cd /var/www

# Set colors to variables
BLACK="\[\033[0;30m\]"
BLACKB="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDB="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENB="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWB="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEB="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEB="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANB="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEB="\[\033[1;37m\]"
RESET="\[\033[0;0m\]"

#---------------------------------------------------------------------------------------------------------------------------------------
#   2.  TERMINAL CUSTOMIZATIN
#---------------------------------------------------------------------------------------------------------------------------------------

# set a prompt style
PS1="\n$RED┌[\\u][\T][\w]\n└> $RESET"

#---------------------------------------------------------------------------------------------------------------------------------------
#   3.  FUNCTIONS
#---------------------------------------------------------------------------------------------------------------------------------------

function printDockerContainers()
{
    if [ $# == 0 ]; then
        sudo docker ps -a;
    else
        printf "containers with the name like $1\n";
        sudo docker ps -a --filter "name=$1";
    fi
}

function printDockerContainerLogs()
{
    if [ $# != 2 ]; then
        printf "example of use: dc-logs cont_name 3";
        return;
    fi

    sudo docker logs -n $2 $1;
}

function execCommandInContainer()
{
    sudo docker exec -ti $1 $2;
}

function cpFileToContainer()
{
    sudo docker cp $2 $1:/var/$2;
}

function cacheClear()
{
    sudo docker exec -ti $1 php ./bin/console cache:clear;
}

#---------------------------------------------------------------------------------------------------------------------------------------
#   4.  ALIASES
#---------------------------------------------------------------------------------------------------------------------------------------

alias dc-ps="printDockerContainers"
alias dc-exec="execCommandInContainer"
alias dc-cp="cpFileToContainer"
alias dc-cache-cls="cacheClear"
alias dc-logs="printDockerContainerLogs"
alias cls="clear"
alias fuck='sudo $(fc -ln -1)'
alias update-bashrc="cp ./.bashrc ~/.bashrc"