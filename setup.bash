#!/bin/bash -xve

#exec 2> /tmp/setup.log

[[ ! -z $(lsmod | grep rtmouse) ]] && { echo "rtmouse driver has been installed";exit 1; }

cd /home/ubuntu/RaspberryPiMouse/src/drivers/
insmod rtmouse.ko || /bin/bash /home/ubuntu/RaspberryPiMouse/utils/build_install.bash

sleep 1                   #すぐにはデバイスファイルができないので待つ
chmod 666 /dev/rt*

echo 0 > /dev/rtmotoren0  #安全のためモータの電源を切っておく

# Copyright 2016 Ryuichi Ueda
# Released under GPL.
# To make line numbers be identical with the book, this statement is written here. Don't move it to the header.
