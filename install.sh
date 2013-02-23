#!/bin/bash

# Install script for OMV-sensors script
# Use it with OMV

# Author: Solo0815
# feel free to edit this file, but please share it in
# the OMV-Forum: http://forums.openmediavault.org/viewtopic.php?f=13&t=79#p244

# Version 0.3

cat <<EOF
############################################
###                                      ###
###      OMV-sensors Install script      ###
###                                      ###
############################################

EOF

echo -n "Do you have lm-sensors already installed and configured? (y/n) "
read -n 1 LM_SENSORS

case $LM_SENSORS in
	y|Y)
		;;
	n|N)
		echo -e "\n\nYou have to install and configure lm-sensors first"
		echo "Then you can rerun this script"
		echo "Exiting ..."
		exit 0
		;;
	*)
		echo "\n\nPlease use y/n! Exiting ..."
		exit 0
		;;
esac

echo "Installing files ..."

echo -e "\nsensors >>> /usr/share/openmediavault/scripts/collectd.d/"
cp sensors /usr/share/openmediavault/scripts/collectd.d/
sleep 1
echo "omv-sensor.conf >>> /etc"
cp omv-sensor.conf /etc
sleep 1
echo "Sensors.default >>> /var/www/openmediavault/js/omv/module/admin"
cp Sensors.default /var/www/openmediavault/js/omv/module/admin
sleep 1
echo "Fanspeed.default /var/www/openmediavault/js/omv/module/admin"
cp Fanspeed.default /var/www/openmediavault/js/omv/module/admin
sleep 1
echo
# new:
echo -n "Should this install-script make the changes for the first-time-setup? (y/n) "
read -n 1 CONFIRM

case $CONFIRM in
	y|Y)
		echo -e "\n\nMaking changes ..."
		sleep 1
		echo "running '/usr/share/openmediavault/scripts/collectd.d/sensors' ..."
		echo
		/usr/share/openmediavault/scripts/collectd.d/sensors
		echo -e "\nIf you have errors here, it's due to missing rrd-files. You have to edit /etc/omv-sensor.conf"
		echo -e "\nrestarting collectd ..."
		/etc/init.d/collectd restart
		echo "creating graphs ..."
		/usr/sbin/omv-mkgraph
		echo -e "Installation successfull!"
		echo -e "\nEdit /etc/omv-sensor.conf to fit your needs and run"
		echo "'/usr/share/openmediavault/scripts/collectd.d/sensors'"
		echo -e "to create the rrd-scripts for OMV.\n"
		echo -e "After install, you can delete this folder\n"
		echo "Have fun!"
		;;
	n|N)
		echo "You have to make the changes by yourself"
		cat <<EOF
Please install and configure lm-sensors (if not already done)

Edit /etc/omv-sensor.conf to fit your needs
and run '/usr/share/openmediavault/scripts/collectd.d/sensors'
to create the rrd-scripts for OMV.

After that, please run '/etc/init.d/collectd restart'
to collect the values for your coretemp/fanspeed. You can run 
'omv-mkgraph' to create the graphs.

After install, you can delete this folder

Have fun!

EOF
		exit 0
		;;
	*)
		echo "Please use y/n! Exiting ..."
		exit 0
		;;
esac

exit 0



