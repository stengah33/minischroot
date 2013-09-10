#!/bin/bash
session="$1"
[ -z "$session" ] && echo "Session ID isn't set" && exit 1
shift
schroot -r -c $session -- $@
