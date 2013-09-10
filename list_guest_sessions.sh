#!/bin/bash
guest_name="$("$(dirname "0")/get_guest_name.sh")"
schroot --all-sessions -l | cut -f2 -d':' | grep -E "^${guest_name}-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"
#3384293f-f85e-45e1-bb07-b36812882652"
