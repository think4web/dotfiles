
#!/bin/bash

#set variables

#Check lid state (return 0 if closed)
check_lid () {
 grep -q closed /proc/acpi/button/lid/*/state
}

#Lock screen without sleep
check_lid
if [ $? = 0 ]
then
        DISPLAY=:0.0 su faust -c /home/faust/.local/bin/lock
        systemctl suspend
fi
