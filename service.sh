#!/system/bin/sh
S=/data/adb/bypass_charging
until [ "$(getprop sys.boot_completed)" = 1 ]; do sleep 5; done
rm -f $S/on
P=/sys/class/power_supply
while true; do
  . $S/config
  if [ "$AUTO" = 1 ]; then
    cap=$(cat $P/battery/capacity); usb=$(cat $P/usb/online 2>/dev/null)
    if [ -f $S/on ]; then
      if [ "$usb" != 1 ] || [ "$cap" -le "$LOW" ]; then bypass off; fi
    else
      if [ "$usb" = 1 ] && [ "$cap" -ge "$HIGH" ]; then bypass on; fi
    fi
  fi
  sleep 30
done
