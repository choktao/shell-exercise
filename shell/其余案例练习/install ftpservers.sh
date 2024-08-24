#!/bin/bash
yum -y install vsftpd &> /dev/null
systemctl enable vsftpd -now