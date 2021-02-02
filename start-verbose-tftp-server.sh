#!/bin/sh

echo "Creating log service ..."
busybox syslogd
echo "Running TFTP server ..."
in.tftpd -Lvvv --secure /var/tftpboot
echo "Done"