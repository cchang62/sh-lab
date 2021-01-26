#!/bin/bash
# Ref. 
# [systemctl] https://https://www.freedesktop.org/software/systemd/man/systemctl.html#is-active%20PATTERN%E2%80%A6
# [tutorial] https://blog.gtwang.org/linux/linux-basic-systemctl-systemd-service-unit-tutorial-examples/ 

systemctl status mysql | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart mysql > /dev/null
fi

systemctl status nginx | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart nginx > /dev/null
fi

systemctl status php7.2-fpm | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart php7.2-fpm > /dev/null
fi


IS_ACT=`systemctl is-active nginx.service`
if [ "$IS_ACT" == "active" ]; then
    echo "Nginx is active."
else
    echo "Nginx is not active."
fi