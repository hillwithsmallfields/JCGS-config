# User specific environment and startup programs

# On my desktop machine at somwhere I once worked, I avoided the
# NFS-mounted official home directory for most things, and used a more
# capacious and faster local partition; so I use $EHOME as "effective
# home".  Likewise, on my Raspberry Pi home server, where the SD card
# isn't that large, I've added an external HDD, so we try that too.

for DIR in $HOME /work/$USER /mnt/usbmem /mnt/hdd0
do
  if [ -d $DIR/Sync ]
  then
    EHOME=$DIR
    break
  fi
done

if [ -z "$EHOME" ]
then
    EHOME=$HOME
fi

export EHOME

# Various things my Emacs configuration, and my other scripts, want to
# be able to find without hardcoding paths into them:

export SYNCED=$EHOME/Sync
export OPEN_PROJECTS=$EHOME/open-projects
export MY_PROJECTS=$OPEN_PROJECTS/github.com/hillwithsmallfields
export CONFIG=$MY_PROJECTS/JCGS-config
export SCRIPTS=$MY_PROJECTS/JCGS-scripts
export MY_ELISP=$MY_PROJECTS/JCGS-emacs
export ORGLISP=$MY_PROJECTS/JCGS-org-mode/lisp
export GOPATH=$OPEN_PROJECTS
export GATHERED=$EHOME/library
export BIBLE=$GATHERED/bible

export ORG=$SYNCED/org
export VEHICLES=$SYNCED/vehicles
export MYSELFORG=$EHOME/myself/org

export PATH=$PATH:$EHOME/commands:$SCRIPTS

export WRITING=$SYNCED/writing
export LANGUAGES=$SYNCED/languages

export PATH=$PATH:$SYNCED/com:$EHOME/bin:$SCRIPTS

export WWW_HOME=$SYNCED/local-www/index.html

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib/

# export EMACS_SERVER_FILE=$HOME/.emacs-servers/server

# xmodmap ~/.xmodmap

export HANDLE=jcgs

if [ -f $HOME/.env ]
then
    . $HOME/.env
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

if [ -f $HOME/work-scripts/work-env ]
then
    . $HOME/work-scripts/work-env
fi

if [ -f $HOME/.local_bashrc ]
then
    . $HOME/.local_bashrc
fi

if echo $PATH | grep -v /usr/local/bin > /dev/null
then
  PATH=/usr/local/bin:$PATH
fi

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

# add arduino if available

if [ -d /usr/local/arduino-1.8.10 ]
then
    PATH=$PATH:/usr/local/arduino-1.8.10
fi

export EDITOR=emacsclient
alias du='du -hs'
alias df='df -h'
umask 0002
