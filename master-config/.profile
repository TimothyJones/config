# This file contains configuration settings not related to the shell.
# It includes environment variables that we want to be available everywhere

# Import settings for timconfig, if any
. ~/.timconfig

# Scala and Gradle settings
export SCALA_HOME=/usr/local/share/scala
export GRADLE_USER_HOME=/usr/local/opt/gradle/libexec/

# Go settings
export GOPATH=~/go

# AWS settings
export AWS_REGION=ap-southeast-2
export AWS_DEFAULT_REGION=$AWS_REGION

# Path
export PATH=$PATH:$SCALA_HOME/bin:~/go/bin:$TIMCONFIG_HOME/timbash/bin
