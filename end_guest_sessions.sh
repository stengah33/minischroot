#!/bin/bash
"$(dirname "$0")/list_guest_sessions.sh" | while read line; do
  schroot -e -c "$line"
done
