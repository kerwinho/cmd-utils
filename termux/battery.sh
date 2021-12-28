#!/bin/bash

case $1 in
  isCharging)
    st=`termux-battery-status |grep status | awk '{print substr($2,2,length($2)-3)}'`
#    echo $st
    if [[ "$st" == "DISCHARGING" ]];
    then
      echo false
    else
      echo true
    fi
    exit 0 
    ;;
  *)
    ;;
esac

termux-battery-status |grep percentage | awk '{print substr($2,0,length($2)-1)}'


# vim: ts=2 sw=2 et
