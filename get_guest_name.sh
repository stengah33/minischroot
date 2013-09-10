#!/bin/bash
cat "$(dirname "$0")/host_schroot_guest.conf" | grep '\[' | tr -d '[' | tr -d ']'
