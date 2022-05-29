#!/bin/sh

useradd $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
mkdir -p /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
echo "$FTP_USER" >> /etc/vsftpd.userlist
echo "secure_chroot_dir=/home/$FTP_USER/ftp/files" | tee -a /tmp/vsftpd.conf
cp /tmp/vsftpd.conf /etc/vsftpd.conf
/usr/sbin/vsftpd