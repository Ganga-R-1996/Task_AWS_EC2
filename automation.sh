#! /bin/sh
if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install apache2;
fi
sleep 3
if pgrep -x "apache2" >/dev/null
then echo "1"
else
        systemctl start apache2
fi
sleep 5
if apache2ctl -M >/dev/null
then
        echo "Apache2 is enabled"
else
        systemctl enable apache2
fi
sleep 6
exit
