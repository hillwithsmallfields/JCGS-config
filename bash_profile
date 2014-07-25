# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# On my desktop machine at work, I avoid the NFS-mounted official home
# directory for most things, and use a more capacious and faster local
# partition; so I use $EHOME as "effective home":

if [ -d $HOME/common ]
then
  EHOME=$HOME
else
  EHOME=/work/$USER
fi

export EHOME

# Various things my Emacs configuration, and my other scripts, want to
# be able to find without hardcoding paths into them:

export CONFIG=$EHOME/JCGS-config
export SCRIPTS=$EHOME/JCGS-scripts
export EMACS=$HOME/JCGS-emacs

export COMMON=$EHOME/common
export OPEN_PROJECTS=$EHOME/open-projects
export GATHERED=$EHOME/library

export DROPBOX=$EHOME/Dropbox
export ORG=$DROPBOX/org
export VEHICLES=$DROPBOX/vehicles

export PATH=$PATH:$DROPBOX/com:$EHOME/bin:$SCRIPTS

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

# Some work tools

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

# android hacking (at home)

if [ -d /home/android/android-sdk-linux/platform-tools ]
then
  PATH=$PATH:/home/android/android-sdk-linux/platform-tools
fi

# Dropbox: not available at work, so check first whether the dropbox
# program is there.

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
