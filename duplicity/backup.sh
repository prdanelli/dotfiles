#!/bin/bash

# Send notify messages when in a cronjob
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# Is this is used as a CRON $HOME wont be set
TARGET=/home/paul

notify-send "Backup" "Starting remote backup of $TARGET"

# USE A GOOD LONG PASSPHRASE! DO NOT LOSE IT!
export PASSPHRASE=$(cat ~/.duplicity/passphrase.conf | tr -d ' ')

# 3 is a good verbosity level for daily runs, but you may want to start with
# 5 or above if you are just setting up
VERBOSITY=5

# If duplicity finds this file in any folder, that folder won't be backed up.
EXCLUDE_IF_PRESENT=".noback"

# Read the manpage for the exclude filelist format. You can specify
EXCLUDE_FILELIST=$TARGET/.duplicity/excludes.conf

# Backup location with OS prepended
DEST="pydrive+gdocs://developer.gserviceaccount.com/$(uname -n)_duplicity_backup"

# You should print out the contents of this file, in case you
# need to restore from off-site backups after a major disaster.
export GOOGLE_DRIVE_SETTINGS=$TARGET/.duplicity/pydrive.yaml

duplicity \
	--verbosity=$VERBOSITY \
	--allow-source-mismatch \
	--exclude-if-present=$EXCLUDE_IF_PRESENT \
	--exclude-filelist=$EXCLUDE_FILELIST \
	$TARGET ${DEST}

unset GOOGLE_DRIVE_SETTINGS
unset PASSPHRASE

notify-send "Backup" "Finished remote backup"
