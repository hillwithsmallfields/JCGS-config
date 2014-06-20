# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export COMMON=$HOME/common

export DROPBOX=$HOME/Dropbox

export CONFIG=$HOME/JCGS-config

export ORG=$DROPBOX/org

export OPEN_PROJECTS=$HOME/open-projects

export VEHICLES=$DROPBOX/vehicles

export GATHERED=$HOME/library

export PATH=$PATH:$DROPBOX/com:$HOME/bin

export EMACS=$DROPBOX/emacs

export WRITING=$DROPBOX/writing

export LANGUAGES=$DROPBOX/languages

# http_proxy=http://staff-proxy.ul.ie:8080/
# export http_proxy

export WWW_HOME=$COMMON/local-www/index.html

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib/

export EMACS_SERVER_FILE=$HOME/.emacs-servers/server

# xmodmap ~/.xmodmap

export HANDLE=jcgs

# TODO: look at whether we have a network connection, before looking for a dropbox process
ps -u $USER | grep -q dropbox
DROPBOX_RUNNING=$?

if [ ! $DROPBOX_RUNNING ]
then
  $HOME/.dropbox-dist/dropboxd &
fi