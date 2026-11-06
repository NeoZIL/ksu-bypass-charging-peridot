#!/system/bin/sh
[ -f /data/adb/bypass_charging/on ] && /system/bin/bypass off
rm -rf /data/adb/bypass_charging
