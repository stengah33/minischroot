#!/bin/bash
session="$("$(dirname "$0")/begin_1_guest_session.sh" | tail -1)"
[ -z "$session" ] && echo "Session ID isn't set" && exit 1
schroot -r -c $session -- $@
