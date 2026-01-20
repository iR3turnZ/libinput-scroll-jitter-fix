# libinput-scroll-jitter-fix
Libinput lua plugin to fix/mittigate mouse scroll jitter caused by a broken mouse. Works by blocking frequent direction changes. libinput plugins must be enabled by your compositor in order to work.

## Instructions:
1. Place the script in /etc/libinput/plugins
2. Modify DEVICE_VID and DEVICE_PID for the model of your mouse

**USE AT YOUR OWN RISK**
