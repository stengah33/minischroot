#! /bin/bash
echo "HOST FILE"
session="$1"
[ -z "$session" ] && echo "Session ID isn't set" && exit 1
run_id="$2"
[ -z "$run_id" ] && echo "Run ID isn't set" && exit 2

schroot -r -c $session -- mkdir -p "/tmp/$run_id"

cat /etc/apt/sources.list | schroot -r -c "$session" -- cat > "/tmp/$run_id/sources.list"
uname -r | schroot -r -c $session -- cat > "/tmp/$run_id/host_kernel_ver"

xauth list | schroot -r -c $session -- cat > "/tmp/$run_id/xauth.list"
env | grep DISPLAY | cut -f2 -d'=' | schroot -r -c $session -- cat > "/tmp/$run_id/env.DISPLAY"

exit 0
