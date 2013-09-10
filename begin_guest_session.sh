#!/bin/bash
guest_name="$("$(dirname "$0")/get_guest_name.sh")"
#echo "Guest name: $guest_name"
schroot -b -c "$guest_name"
