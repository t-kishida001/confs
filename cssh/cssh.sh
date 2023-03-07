#!/bin/bash
# ssh with logging
# -t telnet
# -s ssh
# -n nologging
# -h connect hostname or ip address 
FILENAME=$(date +%Y%m%d%H%M).log
LOGFILEPATH=~/logs/$FILENAME

while getopts stnh: OPT
do
    case $OPT in
        s) PROTOCOL="ssh" 
           ;;
        t) PROTOCOL="telnet"
           ;;
        n) LOGFILEPATH="/dev/null"
           ;;
        h) TARGETHOST=$OPTARG
           ;;
    esac
done

touch $LOGFILEPATH

if [ "$PROTOCOL" = "telnet" ]; then
  script -fq -c "telnet $TARGETHOST" $LOGFILEPATH
else
  script -fq -c "ssh $TARGETHOST" $LOGFILEPATH
fi
