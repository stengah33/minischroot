#! /bin/bash
run_id="$1"
[ -z "$run_id" ] && echo "Run ID isn't set" && exit 1

cat "/tmp/$run_id/sources.list" > "/etc/apt/sources.list"

apt-get -y upgrade
apt-get -y update
apt-get -y install sudo vim screen whiptail wget
unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade
apt-get -y install ruby1.9.1 ruby1.9.1-dev libxml2-dev libxslt-dev build-essential git zlib1g-dev
gem install fog -v 1.8
gem install specific_install
gem specific_install -l https://github.com/mitchellh/vagrant.git
gem specific_install -l https://github.com/jedi4ever/veewee.git
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list
apt-get update
echo "export LC_CTYPE=en_US.UTF-8" >> /etc/enviromnent
echo "export LANG=en_US.UTF-8" >> /etc/enviromnent
echo "unset LC_ALL" >> /etc/enviromnent
locale-gen en
update-locale LANG=en_US.UTF-8
echo "Europe/Moscow" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata
apt-get -y install linux-image-generic-lts-raring 
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade -y install linux-image-generic-lts-raring 
apt-get -y install linux-headers-generic
apt-get -y install linux-headers-$(cat "/tmp/$run_id/host_kernel_ver")
apt-get -y --force-yes --no-install-recommends install virtualbox-4.2
/etc/init.d/vboxdrv setup
[ -s "/tmp/$run_id/xauth.list" ] && (cat "/tmp/$run_id/xauth.list" | xargs xauth add)
export DISPLAY=$(cat "/tmp/$run_id/env.DISPLAY")
echo "export DISPLAY=$(cat "/tmp/$run_id/env.DISPLAY")" > /tmp/env.DISPLAY
