#!/bin/bash
cd /root/videoplayer

IMG="media/background.png"

if [ -f "$IMG" ]; then
	qiv -fi "$IMG"
else
	echo "$IMG not found!"
fi
