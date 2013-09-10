#!/bin/bash
apt-get -y update
apt-get -y install debootstrap schroot
apt-get -y autoremove
guest_name="$("$(dirname "$0")/get_guest_name.sh")"
echo "$guest_name"
cp "$(dirname "$0")/host_schroot_guest.conf" "/etc/schroot/chroot.d/$guest_name.conf"
mkdir -p "/srv/chroot/$guest_name"
#variant="minbase"
variant="buildd"
dist="ubuntu"
dist_relname="precise"
[ "$(uname -p)" == "x86_64" ] && arch="amd64" || arch="i386"
url="http://ru.archive.ubuntu.com/ubuntu/"
debootstrap --variant=$variant --arch=$arch $dist_relname "/srv/chroot/$guest_name" "$url"
