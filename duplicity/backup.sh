#!/bin/bash

notify-send "Backup" "Starting remote backup"

# + Setup OAth Credentials in Google API
#
# https://rgarth.github.io/2017/10/29/Grive-and-Duplicity/
# + Go to https://console.developers.google.com/
# + Click “Create Project”
# + Give it some sensible name like “Duplicity Backup”
# + From the Dashboard click on “Enable API”
# + Search for “Drive”, select the Drive API, and enable it
# + You will now need to create some credentials, Select “Credentials” from the panel on the left
# + Use the arrow on the Create Credentials button to select “OAuth Client ID”
# + You will need to give a Product Name. I used “Duplicity Backup”
# + For Application Type, select “Other” and name the client. I used “Duplicity”
# + Save your credentials somewhere safe (although they can easily be regenerated)
# + Download client_secrets.json from GCloud and put it in the directory

# USE A GOOD LONG PASSPHRASE! DO NOT LOSE IT!
export PASSPHRASE=$(cat ~/.duplicity/passphrase | tr -d ' ') # String used for encryption
USERNAME=$(cat ~/.duplicity/username | tr -d ' ') # Username from email address

# 3 is a good verbosity level for daily runs, but you may want to start with
# 5 or above if you are just setting up
VERBOSITY=0

# If duplicity finds this file in any folder, that folder won't be backed up.
EXCLUDE_IF_PRESENT=".noback"

# Read the manpage for the exclude filelist format. You can specify
EXCLUDE_FILELIST=$HOME/.duplicity/excludes

# Backup configuration settings
# Set this to point to your Google Drive location
DEST="gdocs://$USERNAME@gmail.com/duplicity"

# You can specify a different offsite-specific exclude filelist here
EXCLUDE_FILELIST=$EXCLUDE_FILELIST

# You can specify an offsite-specific exclude-if-present filename here
EXCLUDE_IF_PRESENT=$EXCLUDE_IF_PRESENT

# You should print out the contents of this file, in case you
# need to restore from off-site backups after a major disaster.
export GOOGLE_DRIVE_SETTINGS=$HOME/.duplicity/credentials

duplicity \
	--verbosity=$VERBOSITY \
	--allow-source-mismatch \
	--exclude-if-present=$EXCLUDE_IF_PRESENT \
	--exclude-filelist=$EXCLUDE_FILELIST \
	$HOME ${DEST}

# Cleanup - Remove all backed up files
# duplicity --verbosity=0 cleanup --force gdocs://prwhitehead@gmail.com/duplicity

unset GOOGLE_DRIVE_SETTINGS

notify-send "Backup" "Finished remote backup"
