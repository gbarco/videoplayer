#!/bin/bash
cd /root/videoplayer

if [ -f "$1" ]; then
	qiv -fi "$1"
else
	echo "$1 not found!"
fi
