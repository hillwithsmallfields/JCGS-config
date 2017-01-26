
# User specific environment and startup programs

# On my desktop machine at work, I avoid the NFS-mounted official home
# directory for most things, and use a more capacious and faster local
# partition; so I use $EHOME as "effective home".  Likewise, on my
# Raspberry Pi home server, where the SD card isn't that large, I've
# added a USB key, so we try that too.

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

# http_proxy=http://staff-proxy.ul.ie:8080/
# export http_proxy

export PATH=$PATH:$COMMON/com:$EHOME/bin:$SCRIPTS

export WWW_HOME=$COMMON/local-www/index.html

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib/

# export EMACS_SERVER_FILE=$HOME/.emacs-servers/server

# xmodmap ~/.xmodmap

export HANDLE=jcgs

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

if [ -f /arm/tools/setup/init/bash ]
then
  . /arm/tools/setup/init/bash
  module load arm/cluster
  module load swdev gnu/gcc/4.9.1_lto
  module load gnu/gdb/7.7
  module load core apache/subversion/1.6.13
  module load swdev scons/scons/2.0.1
  module load swdev gnu/cmake/3.4.3
  module load util graphviz/graphviz/2.26.3
  # module load core gnu/gnuplot/4.4.2
  module load util arm/datasync/2.0
  module load swdev smartbear/codecollab/8.4.8403
  module load gnu/gdb/7.7
  STDCPPNAME=`g++ --print-file libstdc++.so`
  STDCPPNAME32=`g++ -m32 --print-file libstdc++.so`
  LD_LIBRARY_PATH=`dirname $STDCPPNAME`:`dirname $STDCPPNAME32`:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH
fi

if [ -d /arm/devsys-tools/abs ]
then
  PATH=$PATH:/arm/devsys-tools/abs
  module load apache/subversion/1.7.3
  alias gbuild='pb_var_exec -- go install -v arm.com/uniSched...'
fi

# todo: make this pick up the latest version of scala, but still be syntactically correct if there are no versions
if [ -d /usr/local/share/scala-2.11.6 ]
then
    PATH=$PATH:/usr/local/share/scala-2.11.6/bin
    export SCALA_HOME=/usr/local/share/scala-2.11.6
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

# work-related scripts

if [ -d /nethome/johstu01/work-scripts ]
then
  PATH=$PATH:/nethome/johstu01/work-scripts
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

export EDITOR=emacsclient
alias du='du -hs'
alias df='df -h'
umask 0007
