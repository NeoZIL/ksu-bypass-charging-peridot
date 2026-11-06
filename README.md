# Bypass Charging Peridot (POCO F6)

KernelSU / KernelSU-Next module. Tag a release (`git tag v1.1 && git push --tags`) and GitHub Actions builds the flashable zip.

> Test manually first (plugged in, as root):
> `echo 0 > /sys/class/qcom-battery/fastcharge_enable; sleep 1; echo 9 > /sys/class/qcom-battery/smart_chg; sleep 1; echo 3 > /sys/class/qcom-battery/smart_chg`
> Use at your own risk; this talks to charger firmware.

Userspace KernelSU module with WebUI for bypass (pass-through) charging.

## Credits
The bypass-charging firmware sequence (`smart_chg` scene handling, step order
and timing) was discovered and implemented in the kernel by
**khargosxh18** (https://github.com/khargosxh18), co-authored by
**Klozz** (https://github.com/Klozz), in
https://github.com/khargosxh18/kernel_xiaomi_periot/commit/8c2ee434a85627baa5eec36de209cf3f9114583c
("power: qti_battery_charger: add bypass charging support").
This module only replays that sequence from userspace. All credit for the
research goes to them.

## Usage
    bypass on | off | toggle | status | json
    bypass set AUTO|HIGH|LOW|DELAY <number>
WebUI: open the module's WebUI from KernelSU / KernelSU-Next manager.
Action button: toggles bypass.
