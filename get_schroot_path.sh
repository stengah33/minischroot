#!/bin/bash
cat "$(dirname "$0")/host_schroot_guest.conf" | grep -E '^directory' | cut -f2 -d'='
