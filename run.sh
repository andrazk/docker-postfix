#!/bin/bash

touch /var/log/mail.log

postconf -e mynetworks=$mynetworks

mydestination=$(postconf mydestination | sed 's:/etc/mailname, ::g')
postconf "$mydestination"

service rsyslog restart

service postfix start

tail -f /var/log/mail.log
