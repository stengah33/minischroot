#! /bin/bash
g_path="$1"
h_path="$2"
session="$("$(dirname "$0")/begin_1_guest_session.sh" | tail -1)"
"$(dirname "$0")/run_file_in_guest_session.sh" "$session" "$g_path" "$h_path"
