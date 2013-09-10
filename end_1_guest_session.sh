#!/bin/bash
"$(dirname "$0")/list_1_guest_session.sh" | while read line; do
  schroot -e -c "$line"
done
