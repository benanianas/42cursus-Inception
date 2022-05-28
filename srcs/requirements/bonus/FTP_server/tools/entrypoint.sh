#!/bin/sh

useradd sammy
echo "sammy:pwd" | chpasswd
mkdir -p /home/sammy/ftp
chown nobody:nogroup /home/sammy/ftp
mkdir /home/sammy/ftp/files
chown sammy:sammy /home/sammy/ftp/files
echo "sammy" >> /etc/vsftpd.userlist
cp /tmp/vsftpd.conf /etc/vsftpd.conf
echo "************************************"
/usr/sbin/vsftpd