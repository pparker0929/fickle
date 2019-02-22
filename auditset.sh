#!/bin/sh

Auditctl -e 1
#service enable auditd.service 
nano /etc/audit/aditd.conf

#Insert the following lines
#-w /etc/passwd -p wa -k identity <-Events that affect the /etc/passwd
#-w /etc/group -p wa -k identity <-Events that affect the /etc/group
#-w /etc/gshadow -p wa -k identity <-Events that affect the /etc/gshadow
#-w /etc/shadow -p wa -k identity <-Events that affect the /etc/shadow
#-w /etc/security/opasswd -p wa -k identity <-Events that affect the /etc/security/opasswd
#-a always,exit -F path=/bin/su -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change <-Successful/Unsuccessful attempts to use the su cmd
#-a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-ssh <-Successful/Unsuccessful attempts to use the ssh-agent cmd
#-a always,exit -F arch=b64 -S chown -F auid>=1000 -F auid!=4294967295 -k perm_chng <- Successful/Unsuccessful attempts to use the chown cmd
#-a always,exit -F arch=b64 -S chmod -F auid>=1000 -F auid!=4294967295 -k perm_chng <- Successful/Unsuccessful attempts to use the chmod cmd
#-a always,exit -F arch=b64 -S truncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access <- Successful/Unsuccessful attempts to use the truncate cmd
#-a always,exit -F arch=b64 -S truncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access <- Successful/Unsuccessful attempts to use the truncate cmd
#-a always,exit -F arch=b64 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access <- Successful/Unsuccessful attempts to use the creat cmd
#-a always,exit -F arch=b64 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access <- Successful/Unsuccessful attempts to use the creat cmd
#-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd <- Successful/Unsuccessful attempts to use the sudo cmd
#-a always,exit -F path=/usr/bin/sudoedit -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd <- Successful/Unsuccessful attempts to use the sudoedit cmd
#-w /var/log/faillog -p wa -k logins <- Successful/Unsuccessful mods to the faillog file
#-w /var/log/lastlog -p wa -k logins <- Successful/Unsuccessful mods to the lastlog file
#-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd <- Successful/Unsuccessful use of the passwd cmd
#-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod <- Successful/Unsuccessful use of the usermod cmd 
#-a always,exit -F path=/usr/bin/chsh -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd
#-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd
#-a always,exit -F path=/sbin/apparmor_parser -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng
#-w /var/log/tallylog -p wa -k logins
#-w /var/log/faillog -p wa -k logins
#-w /var/log/lastlog -p wa -k logins
#-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd
#-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-gpasswd
#-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-chage
#-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod
#-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-crontab
#-a always,exit -F arch=b64 -S delete_module -F auid>=1000 -F auid!=4294967295 -k module_chng

#service restart auditd.service
exit 0;