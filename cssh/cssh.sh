#!/bin/bash
# ssh with logging
# -t telnet
# -s ssh
# -n nologging
# -h connect hostname or ip address 
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

mkdir -m 775 -p ~/logs
FILENAME=$(date +%Y%m%d%H%M)_$TARGETHOST.log
LOGFILEPATH=~/logs/$FILENAME
touch $LOGFILEPATH

if [ "$PROTOCOL" = "telnet" ]; then
  script -fq -c "telnet $TARGETHOST" $LOGFILEPATH
else
  script -fq -c "ssh $TARGETHOST" $LOGFILEPATH
fi
