#! /bin/bash
date
#--------MyAccessPoint=SSID MyPassPhrase=Password----------

wl=wlan0
wl=$(iwconfig | awk '/wlan/ && NR==1 {print $1}')
#echo $wl 
echo $wl | egrep "^wlan" >/dev/null 2>&1
   if [ $? -eq 0  ]; then
       #echo yes
       ifdown $wl
      ./create_ap -g 11.0.0.1 -n $wl flying-computer 123456789 &
   fi
