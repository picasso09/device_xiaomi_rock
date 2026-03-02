#!/vendor/bin/sh

# Key Down
sendevent /dev/input/event1 1 116 1
# exec
sendevent /dev/input/event1 0 0 0
# Key Up
sendevent /dev/input/event1 1 116 0
# exec
sendevent /dev/input/event1 0 0 0