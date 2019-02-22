#!/bin/sh

# Holding off on the following lines to prevent ssh installation and usage



usermod -s /sbin/nologin root && service network-manager restart
apt-get install nmap
echo "nmap"

wget https://tinyurl.com/fjghdlgh
echo "Maldetect"

wget https://tinyurl.com/ydyujwnb
echo "RKHunter"

wget https://tinyurl.com/y7yy5p9h --no-check-certificate
echo "Lynis"

apt-get install fail2ban
echo "Fail2Ban"

tar xzf fjghdlgh && cd maldetect-1.6.3 && ./install.sh && cd
echo "Maldetect Done"

tar xzf ydyujwnb && cd rkhunter-1.4.6 && ./installer.sh -l /usr --install && cd
echo "RKHunter Done"

tar xzf y7yy5p9h && cd lynis && apt-get install lynis -y && cd
echo "Lynis Done"

apt-get install ssh -y
# sed -i '/#PermitRootLogin yes/c\PermitRootLogin no' /etc/ssh/sshd_config
# service sshd restart
echo "SSH"

apt-get install auditd
echo "AuditD"

# mkdir -p /home/USERNAME/{Conf,Bkup,Hrdn}
echo "Dirs Made"

tail -vn +1 /etc/passwd /etc/shadow /var/log/auth.log >> /home/USERNAME/Conf/stdlog
tail -vn +1 /var/log/dpkg.log | grep -w '/var/log\|installed' >> home/USERNAME/Conf/stdlog
echo "Init Conf Save"

(cat /etc/hosts; ip a show; route -n; w; arp -a) >> /home/USERNAME/Conf/net.txt
echo "Net Conf Save"

chmod 644 /etc/passwd /etc/group && chmod 640 /etc/shadow && chmod 600 /etc/ssh/sshd_config && chmod 555 /boot
echo "Atts Set"

# passwd root
# passwd username
# useradd -m username && passwd username && usermod -aG sudo username && su - username

#usermod -s /bin/false sysadmin
#usermod -L sysadmin

exit 0;