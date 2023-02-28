#!/bin/bash

# ssh with logging

FILENAME=$(date +%Y%m%d%H%M).log
LOGFILEPATH=~/logs/$FILENAME

TARGETHOST=$1
# user@hostname
#SSHKEY=$2

touch $LOGFILEPATH

script -fq -c "ssh $TARGETHOST" $LOGFILEPATH
