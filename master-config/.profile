. ~/.timconfig

export SCALA_HOME=/usr/local/share/scala
export GRADLE_USER_HOME=/usr/local/opt/gradle/libexec/

export GOPATH=~/go

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GF'

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

export AWS_REGION=ap-southeast-2
export AWS_DEFAULT_REGION=$AWS_REGION


export PATH=$PATH:$SCALA_HOME/bin:~/go/bin:$TIMCONFIG_HOME/timbash/bin
