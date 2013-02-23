omvsensors
==========

OMV-script for easy setup of sensors (Temperature and Fanspeed)

Requirements:
installed and configured lm-sensors in OpenMediaVault
http://forums.openmediavault.org/viewtopic.php?f=13&t=79&p=7459#p7459
and

http://forums.openmediavault.org/viewtopic.php?f=13&t=79#p244
(second half of the post)

Installation:
http://forums.openmediavault.org/viewtopic.php?f=13&t=79&start=60#p7374

Edit  '/etc/omv-sensor.conf'  to fit your needs
and run '/usr/share/openmediavault/scripts/collectd.d/sensors'
to create the rrd-scripts for OMV.

After that, please run '/etc/init.d/collectd restart'
to collect the values for your coretemp/fanspeed. 

You can run 
'omv-mkgraph' to create the graphs.

Don't forget to run
'/usr/share/openmediavault/scripts/collectd.d/sensors'
and
'omv-mkgraph'
each time after changing the configuration file to make your changes happen in OMV
