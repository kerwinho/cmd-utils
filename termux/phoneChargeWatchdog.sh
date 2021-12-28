#!/bin/bash
B_MAX=93
B_MIN=15
SLEEP_MIN=3

mkdir -p ~/log

chargeState() {
  if [[ `battery.sh isCharging` == "true" ]];
  then
    echo "1"
  else
    echo "0"
  fi
}

while true;
do
  batteryVal=`battery.sh`
  if  [[ "$batteryVal" -gt "$B_MAX" ]];
  then
    echo -e `date` ": $batteryVal% > $B_MAX%" | tee -a ~/log/battery.log
    isCharging=$(chargeState)
    if [[ "$isCharging" -eq "1" && "$batteryVal" -ne "100" ]];
    then
      echo -e ", Stop charging battery\n"
      # Your way to stop power charging 
    else
      echo -e ", ...do nothing\n"
    fi
  elif  [[ "$batteryVal" -gt "$B_MIN" ]];
  then
    echo `date` ": $batteryVal% > $B_MIN%, do nothing" | tee -a ~/log/battery.log
  else
    echo -e `date` ": $batteryVal% < $B_MIN%, toggle on the power outlet to start charging" | tee -a ~/log/battery.log
    isCharging=$(chargeState)
    if [[ "$isCharging" -eq "0" ]];
    then
      echo ", Start to charge battery\n"
      termux-telephony-call 10000000
      # Your way to start power charging
    else
      echo -e ", ...keep charging\n"
    fi
  fi
  sleep ${SLEEP_MIN}m
done






# vim: ts=2 sw=2 et
