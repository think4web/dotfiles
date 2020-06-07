#sudo systemctl restart acpid.service

grep -q closed /proc/acpi/button/lid/*/state
if [ $? = 0 ]; then
 lid_closed=1
 echo "Lid Closed"
 DISPLAY=:0.0 'sh /home/faust/.local/bin/lock'
 #DISPLAY=:0.0 su faust -c 'sh /home/faust/.local/bin/lock'
 sleep 1
 systemctl  suspend
else
 lid_closed=0
 echo "Lid Open"
fi

exit
