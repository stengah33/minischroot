#! /bin/bash
run_id="$1"
[ -z "$run_id" ] && echo "Run ID isn't set" && exit 1
[ -s "/tmp/$run_id/xauth.list" ] && (cat "/tmp/$run_id/xauth.list" | xargs xauth add)
export DISPLAY=$(cat "/tmp/$run_id/env.DISPLAY")
echo "export DISPLAY=$(cat "/tmp/$run_id/env.DISPLAY")" > "/tmp/env.DISPLAY"
