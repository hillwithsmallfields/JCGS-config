# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
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
