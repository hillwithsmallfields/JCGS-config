# User specific environment and startup programs

# On my desktop machine at somwhere I once worked, I avoided the
# NFS-mounted official home directory for most things, and used a more
# capacious and faster local partition; so I use $EHOME as "effective
# home".  Likewise, on my Raspberry Pi home server, where the SD card
# isn't that large, I've added a USB key, so we try that too.

for DIR in $HOME /work/$USER /mnt/usbmem
do
  if [ -d $DIR/common ]
  then
    EHOME=$DIR
    break
  fi
done

export EHOME

# Various things my Emacs configuration, and my other scripts, want to
# be able to find without hardcoding paths into them:

export COMMON=$EHOME/common
export CONFIG=$EHOME/JCGS-config
export SCRIPTS=$EHOME/JCGS-scripts
export EMACS=$EHOME/JCGS-emacs
export ORGLISP=$EHOME/JCGS-org-mode/lisp
export OPEN_PROJECTS=$EHOME/open-projects
export GATHERED=$EHOME/library

export DROPBOX=$EHOME/Dropbox
export ORG=$COMMON/org
export VEHICLES=$COMMON/vehicles
export MYSELFORG=$EHOME/myself/org

export PATH=$PATH:$DROPBOX/com:$EHOME/bin:$SCRIPTS

export WRITING=$COMMON/writing
export LANGUAGES=$COMMON/languages

export PATH=$PATH:$COMMON/com:$EHOME/bin:$SCRIPTS

export WWW_HOME=$COMMON/local-www/index.html

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib/

# export EMACS_SERVER_FILE=$HOME/.emacs-servers/server

# xmodmap ~/.xmodmap

export HANDLE=jcgs

if [ -f $HOME/.env ]
then
    . $HOME/.env
fi

if [ -f $HOME/.local_bashrc ]
then
    . $HOME/.local_bashrc
fi

if echo $PATH | grep -v /usr/local/bin > /dev/null
then
  PATH=/usr/local/bin:$PATH
fi

if [ -d /usr/local/go/bin ]
then
  PATH=$PATH:/usr/local/go/bin
#   export GOPATH=$GATHERED/go-code
#   export GOBIN=$HOME/bin
fi

# Some work tools

# None at the moment

# android hacking (at home)

if [ -d /home/android/android-sdk-linux/platform-tools ]
then
  PATH=$PATH:/home/android/android-sdk-linux/platform-tools
fi

PEBBLE_SDK=$EHOME/pebble/PebbleSDK-2.4.1/bin
if [ -f $PEBBLE_SDK/pebble ]
then
  PATH=$PATH:$PEBBLE_SDK
fi

# joystick for emacs
if [ -d $EHOME/joylisp ]
then
    PATH=$PATH:$EHOME/joylisp
fi

# work-related scripts

if [ -d $EHOME/work-scripts ]
then
  PATH=$PATH:$EHOME/work-scripts
  else
  if [ -d $HOME/work-scripts ]
  then
    PATH=$PATH:$HOME/work-scripts
  fi
fi

# find openscad where I installed it from a tarball

if [ -d /usr/local/openscad-2014.03/bin ]
then
    PATH=$PATH:/usr/local/openscad-2014.03/bin
fi

# add anaconda if available

if [ -d /usr/local/bin/anaconda/bin ]
then
    PATH=$PATH:/usr/local/bin/anaconda/bin
fi

export EDITOR=emacsclient
alias du='du -hs'
alias df='df -h'
umask 0002
