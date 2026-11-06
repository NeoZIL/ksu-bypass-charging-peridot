SKIPUNZIP=0
B=/sys/class/qcom-battery
ui_print "- Bypass Charging Peridot (POCO F6)"
ui_print "- Credits: khargosxh18 & Klozz (kernel_xiaomi_periot, commit 8c2ee43)"
if [ -e $B/bypass_charging_enable ]; then
  ui_print "- Kernel has native bypass_charging_enable (will use it)"
elif [ -e $B/smart_chg ] && [ -e $B/fastcharge_enable ]; then
  ui_print "- Using smart_chg / fastcharge_enable sequence"
else
  abort "! $B/smart_chg or fastcharge_enable not found. Unsupported kernel/ROM."
fi
mkdir -p /data/adb/bypass_charging
[ -f /data/adb/bypass_charging/config ] || cat > /data/adb/bypass_charging/config <<'CFG'
AUTO=0
HIGH=80
LOW=75
DELAY=1
CFG
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/system/bin/bypass 0 2000 0755
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/action.sh 0 0 0755
set_perm $MODPATH/uninstall.sh 0 0 0755
