##!/bin/bash
clear
cekray=cat /root/log-install.txt | grep -ow "v2ray" | sort | uniq
if [ "$cekray" = "v2ray" ]; then
domainlama=cat /etc/v2ray/domain
else
domainlama=cat /etc/v2ray/domain
fi

clear
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop nginx
systemctl stop v2ray
systemctl stop v2ray@none
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/v2ray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
