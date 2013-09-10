#!/bin/bash
pref="/var/lib/schroot/mount"
guest_name="$("$(dirname "$0")/get_guest_name.sh")"
pattern="$pref/$guest_name"
mount | grep -E " ${pattern}-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"

