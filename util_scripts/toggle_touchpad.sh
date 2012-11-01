#!/bin/bash

#
# Toggle the touchpad using xinput
#

touchpad_id=$(xinput | grep -i touchpad | grep -o "id=[0-9]*" | sed 's/[^0-9]//g')
is_enabled=$(xinput --list-props $touchpad_id | grep -i enabled | grep -o "[0-9]$")

if [[ $is_enabled == "0" ]]; then
  xinput --set-prop $touchpad_id "Device Enabled" 1
else
  xinput --set-prop $touchpad_id "Device Enabled" 0
fi

