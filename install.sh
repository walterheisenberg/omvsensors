#!/bin/bash

# Install script for OMV-sensors script
# Use it with OMV

# Author: Solo0815
# feel free to edit this file, but please share it in
# the OMV-Forum: http://forums.openmediavault.org/viewtopic.php?f=13&t=79#p244

cat <<EOF
############################################
###                                      ###
###      OMV-sensors Install script      ###
###                                      ###
############################################

Installing files ...

EOF

echo "sensors >>> /usr/share/openmediavault/scripts/collectd.d/"
cp sensors /usr/share/openmediavault/scripts/collectd.d/

echo "omv-sensor.conf >>> /etc"
cp omv-sensor.conf /etc

echo "Sensors.default >>> /var/www/openmediavault/js/omv/module/admin"
cp Sensors.default /var/www/openmediavault/js/omv/module/admin

echo "Fanspeed.default /var/www/openmediavault/js/omv/module/admin"
cp Fanspeed.default /var/www/openmediavault/js/omv/module/admin

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



