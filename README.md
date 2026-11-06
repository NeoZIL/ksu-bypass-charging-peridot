# Bypass Charging Peridot (POCO F6)



> Test manually first (plugged in, as root):
> `echo 0 > /sys/class/qcom-battery/fastcharge_enable; sleep 1; echo 9 > /sys/class/qcom-battery/smart_chg; sleep 1; echo 3 > /sys/class/qcom-battery/smart_chg`
> Use at your own risk; this talks to charger firmware.

Userspace KernelSU / Magisk module with WebUI for bypass (pass-through) charging.

## Credits
Module, WebUI and packaging by **NeoZIL** (https://github.com/NeoZIL).

The bypass-charging firmware sequence (`smart_chg` scene handling, step order
and timing) was discovered and implemented in the kernel by
**khargosxh18** (https://github.com/khargosxh18), co-authored by
**Klozz** (https://github.com/Klozz), in
https://github.com/khargosxh18/kernel_xiaomi_periot/commit/8c2ee434a85627baa5eec36de209cf3f9114583c
("power: qti_battery_charger: add bypass charging support").
This module only replays that sequence from userspace. All credit for the
research goes to them.

## Compatibility
- KernelSU / KernelSU-Next: full support (WebUI built in)
- Magisk 28+: installs and works, Action button supported
- WebUI on Magisk needs a WebUI app such as MMRL or KSU WebUI (standalone). The CLI works everywhere.

## Usage
    bypass on | off | toggle | status | json
    bypass set AUTO|HIGH|LOW|DELAY <number>
WebUI: open the module's WebUI from KernelSU / KernelSU-Next manager.
Action button: toggles bypass.
