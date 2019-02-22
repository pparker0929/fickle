#!/bin/sh

apt-get install iptables 
iptables -F
# To Block Incoming traffic from a specific ip address see below
# iptables -A INPUT -s XXX.XXX.XXX.XXX -j DROP
# To Accept Incoming traffic from a specific ip address see below
# Replace the previous command with -j ACCEPT
# To Block Output traffic to a specific ip address see below
# iptables -A OUTPUT -d XXX.XXX.XXX.XXX -j DROP
# To Accept Output traffic to a specific ip address see below
# Replace the previous command with -j ACCEPT
# To Block an IP Range see below
# iptables -A INPUT -s XXX.XXX.XXX.0/24 -j DROP
# To Accept an IP Range see below
# Replace the previous command with -j ACCEPT
# To Disable PING see below
# iptables -I INPUT -i ech0 -p icmp -s 0/0 -d 0/0 -j DROP
# To Enable PING see below
# iptables -I INPUT -i ech0 -p icmp -s 0/0 -d 0/0 -j ACCEPT

# Adjust the following IPs for ADS, Windows, PaloAlto
#iptables -A INPUT -s 172.20.XXX.254 -j ACCEPT
#iptables -A INPUT -s 172.20.XXX.100 -j ACCEPT
#iptables -A INPUT -s 172.20.XXX.200 -j ACCEPT
#iptables -A INPUT -s 172.20.XXX.0/24 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit 2/second --limit-burst 2 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A INPUT -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A INPUT -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
#The following two lines do not work in Ubuntu
#service iptables save
#service iptables restart
#Use these instead
apt-get install iptables-persistent
iptables-save > /home/USERNAME/Conf/iptables.rules

exit 0;
