#!/bin/bash
cd /root/videoplayer
GEOMON1="0:0"
GEOMON2="1921:0"
MYPWD=$(pwd)
PLAYING1='cat playing1'
PLAYING2='cat playing2'

if [ $PLAYING1 == $1 ]; then
	echo""
else
	killall mplayer

	mplayer -playlist $1 -fs -fixed-vo -loop 0 -vo xv -geometry $GEOMON1 &
	echo "$1" >playing1

	echo "#!/bin/bash" >last.sh
	if [ -f $2 ]; then
		mplayer -playlist $2 -fs -fixed-vo -loop 0 -vo xv -geometry $GEOMON2 &
		echo "$MYPWD/start.sh $1 $2" >>last.sh
else
		echo "$MYPWD/start.sh $1" >>last.sh
	fi
	chmod +x last.sh
fi
