#!/bin/bash
pref="/var/lib/schroot/mount"
guest_name="$("$(dirname "$0")/get_guest_name.sh")"
match=" $pref/$guest_name"
mount | grep "$match" | awk '{print $3}' | sort -r | while read line; do
  umount "$line"
done
