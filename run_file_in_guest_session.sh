#! /bin/bash
session="$1"
[ -z "$session" ] && echo "Session ID isn't set" && exit 1
g_path="$2"
[ -z "$g_path" ] && g_path="$(dirname "$0")/script.guest.sh"
h_path="$3"
[ -z "$h_path" ] && h_path="$(dirname "$0")/script.host.sh"

guest_name="$("$(dirname "$0")/get_guest_name.sh")"
echo "Guest name: $guest_name"
echo "Guest file: $g_path"
echo "Host file: $h_path"

RANDOM=$$
run_id="$(date "+%Y%m%d%H%M%S")-$RANDOM"
echo "Session ID: $session Run ID: $run_id"

schroot -r -c $session -- mkdir /tmp/$run_id
[ -x "$h_path" ] && echo "Running host file: $h_path" \
&& "$h_path" "$session" "$run_id" | cat \
| schroot -r -c $session -- cat > /tmp/$run_id/script.host.sh
[ -e "$g_path" ] && cat "$g_path" \
| schroot -r -c $session -- cat > /tmp/$run_id/script.guest.sh
schroot -r -c $session -- chmod +x /tmp/$run_id/script.guest.sh
schroot -r -c $session -- /tmp/$run_id/script.guest.sh $run_id
