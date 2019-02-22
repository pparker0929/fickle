#!/bin/sh
#Check for extra 0 UIDs
echo "Extra Powerusers or Roots"
awk -F: '($3 == "0"){print}' /etc/passwd

#Check for pswd empty accts
echo "Empty Password Holders"
awk -F: '($2 == " "){print}' /etc/shadow

#Check for superusers
echo "Check for superusers"
grep -e ':x:0' /home/USERNAME/Conf/stdlog

#Check for user accts in Shadow
echo "Users in Shadow"
grep ':\$' /home/USERNAME/Conf/stdlog

#Check for Empty Password Accounts"
echo "Empty Password Holders"
awk -F: '(2 == " "){print}' /etc/shadow

#Check for Successful, opened or closed sessions by users
echo "Sessions Installed"
grep -e "installed" /home/USERNAME/Conf/stdlog | more

#Check for World Writeable Files



#Check Lynis Logs
echo "Lynis Logs Check"
grep 'warning\|suggestion\|details\|vulnerable\|listen_port' /var/log/lynis-report.dat

#Check RK Hunter Logs
echo "RK Hunter Log Check"
grep -e "Warning" /var/log/rkhunter.log

#Check for suspicious programs
echo "Suspicious Programs"
ps -eo pid,tty,user,args | less

#Check for who is logged on currently
echo "Whos on NOW"
w









echo "Added Users"
grep useradd /var/log/*

echo "Deleted Users"
grep userdel /var/log/*

echo "Check for recent altered files"
find . -mmin -5 -print












exit 0;