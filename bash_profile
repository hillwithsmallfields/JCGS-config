# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -d $HOME/common ]
then
  EHOME=$HOME
else
  EHOME=/work/$USER
fi

export COMMON=$EHOME/common

export DROPBOX=$EHOME/Dropbox

export CONFIG=$EHOME/JCGS-config

export ORG=$DROPBOX/org

export OPEN_PROJECTS=$EHOME/open-projects

export VEHICLES=$DROPBOX/vehicles

export GATHERED=$EHOME/library

export PATH=$PATH:$DROPBOX/com:$EHOME/bin

export EMACS=$HOME/JCGS-emacs

export WRITING=$DROPBOX/writing

export LANGUAGES=$DROPBOX/languages

# http_proxy=http://staff-proxy.ul.ie:8080/
# export http_proxy

export WWW_HOME=$COMMON/local-www/index.html

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib/

export EMACS_SERVER_FILE=$HOME/.emacs-servers/server

# xmodmap ~/.xmodmap

export HANDLE=jcgs

if echo $PATH | grep -v /usr/local/bin > /dev/null
then
  PATH=/usr/local/bin:$PATH
fi

# if [ -d /usr/local/go/bin ]
# then
#   PATH=$PATH:/usr/local/go/bin
#   export GOPATH=$GATHERED/go-code
#   export GOBIN=$HOME/bin
# fi

if [ -f /arm/tools/setup/init/bash ]
then
  . /arm/tools/setup/init/bash
fi

if [ -d /arm/devsys-tools/abs ]
then
  PATH=$PATH:/arm/devsys-tools/abs
  . /arm/tools/setup/init/bash
  module load apache/subversion/1.7.3
  alias gbuild='pb_var_exec -- go install -v arm.com/uniSched...'

fi

# TODO: look at whether we have a network connection, before looking for a dropbox process
DROPBOX_PROG=$HOME/.dropbox-dist/dropboxd
if [ -f $DROPBOX_PROG ]
then
  ps -u $USER | grep -q dropbox
  DROPBOX_RUNNING=$?

  if [ ! $DROPBOX_RUNNING ]
  then
    $DROPBOX_PROG &
  fi
fi
