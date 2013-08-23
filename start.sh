#!/bin/bash
cd /root/videoplayer
GEOMON1="0:0"
MYPWD=$(pwd)
DISPLAY=":0.0"

PLAYING1=`cat playing1`
if [ $PLAYING1 == $1 ]; then
	echo "Already playing $1"
else
	killall mplayer

	mplayer -playlist $1 -fs -fixed-vo -loop 0 -vo xv -display $DISPLAY -geometry $GEOMON1 &
	echo "$1" >playing1

	echo "#!/bin/bash" >last.sh
	echo "$MYPWD/force.sh" >>last.sh
	echo "$MYPWD/start.sh $1" >>last.sh
	chmod +x last.sh
fi
