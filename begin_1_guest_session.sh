#!/bin/bash
n="$("$(dirname "$0")/list_1_guest_session.sh")"
[ -n "$n" ] && echo $n || "$(dirname "$0")/begin_guest_session.sh"

