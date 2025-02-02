#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/fromhell26/new/main/IP.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
exit 0
fi 


# VPS Information
#Domain
domain=$(cat /etc/v2ray/domain)
#Status certificate
#modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
#modifyTime1=$(date +%s -d "${modifyTime}")
#currentTime=$(date +%s)
#stampDiff=$(expr ${currentTime} - ${modifyTime1})
#days=$(expr ${stampDiff} / 86400)
#remainingDays=$(expr 90 - ${days})
#tlsStatus=${remainingDays}
#if [[ ${remainingDays} -le 0 ]]; then
#	tlsStatus="expired"
#fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )

declare -A nama_hari
nama_hari[Monday]="Senin"
nama_hari[Tuesday]="Selasa"
nama_hari[Wednesday]="Rabu"
nama_hari[Thursday]="Kamis"
nama_hari[Friday]="Jumat"
nama_hari[Saturday]="Sabtu"
nama_hari[Sunday]="Minggu"
hari_ini=`date +%A`


declare -A nama_bulan
nama_bulan[Jan]="Januari"
nama_bulan[Feb]="Februari"
nama_bulan[Mar]="Maret"
nama_bulan[Apr]="April"
nama_bulan[May]="Mei"
nama_bulan[Jun]="Juni"
nama_bulan[Jul]="Juli"
nama_bulan[Aug]="Agustus"
nama_bulan[Sep]="September"
nama_bulan[Oct]="Oktober"
nama_bulan[Nov]="November"
nama_bulan[Dec]="Desember"
bulan_ini=`date +%b`

hari=${nama_hari[$hari_ini]}
jam=$(TZ='Asia/Jakarta' date +%R)
tnggl=$(date +"%d")
bln=${nama_bulan[$bulan_ini]}
thn=$(date +"%Y")
clear 


echo ""
echo ""
echo ""
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                    ENVY26 KID TEAM " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"p
echo -e " ${blue}Local TZ               :  Asia/Jakarta ${NC}"
echo -e " ${blue}Time                   :  $jam WIB ${NC}"
echo -e " ${blue}Day                    :  $hari ${NC}"
echo -e " ${blue}Date                   :  $tnggl $bln $thn ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                  • SERVER INFO •                 " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${blue}>${NC}\e[33m CPU Model              \e[0m: $cname"
echo -e "${blue}>${NC}\e[33m CPU Frequency          \e[0m: $freq MHz"
echo -e "${blue}>${NC}\e[33m Number Of Cores        \e[0m:  $cores"
echo -e "${blue}>${NC}\e[33m CPU Usage              \e[0m:  $cpu_usage"
echo -e "${blue}>${NC}\e[33m Operating System       \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "${blue}>${NC}\e[33m Kernel                 \e[0m:  `uname -r`"
echo -e "${blue}>${NC}\e[33m Total Amount Of RAM    \e[0m:  $tram MB"
echo -e "${blue}>${NC}\e[33m Used RAM               \e[0m:  $uram MB"
echo -e "${blue}>${NC}\e[33m Free RAM               \e[0m:  $fram MB"
echo -e "${blue}>${NC}\e[33m System Uptime          \e[0m:  $uptime "
echo -e "${blue}>${NC}\e[33m ISP Name               \e[0m:  $ISP"
echo -e "${blue}>${NC}\e[33m Domain                 \e[0m:  $domain"	
echo -e "${blue}>${NC}\e[33m IP Vps                 \e[0m:  $IPVPS"	
echo -e "${blue}>${NC}\e[33m City                   \e[0m:  $CITY"
echo -e "${blue}>${NC}\e[33m TimeZone               \e[0m:  $WKT"
echo -e "${blue}>${NC}\e[33m Day                    \e[0m:  $DAY ($hari)"
echo -e "${blue}>${NC}\e[33m Date                   \e[0m:  $DATE"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "\e[33m Traffic\e[0m        \e[33mToday       Yesterday      Month   "
echo -e "\e[33m Download\e[0m       $dtoday   $dyest   $dmon   \e[0m"
echo -e "\e[33m Upload\e[0m         $utoday   $uyest   $umon   \e[0m"
echo -e "\e[33m Total\e[0m  \033[0;36m        $ttoday   $tyest   $tmon  \e[0m "
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                 • SSH MENU •                 " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e " 1 ⸩ Create SSH & OVPN"
echo -e " 2 ⸩ Trial SSH & OVPN"
echo -e " 3 ⸩ Renew SSH & OVPN"
echo -e " 4 ⸩ Delete SSH & OVPN"
echo -e " 5 ⸩ Check Login SSH & OVPN"
echo -e " 6 ⸩ Member SSH & OVPN"
echo -e " 7 ⸩ Delete User Expired"
echo -e " 8 ⸩ Sett Auto Kill"
echo -e " 9 ⸩ Check Multi Login"
echo -e " 10 ⸩ Restart SSH Service"
echo -e   ""
echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                 • XRAY MENU •                 " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e " 11 ⸩ Create XRay VMess"
echo -e " 12 ⸩ Delete XRay VMess"
echo -e " 13 ⸩ Renew XRay VMess"
echo -e " 14 ⸩ Cek XRay Vmess"
echo -e ""
echo -e " 15 ⸩ Create XRay VLess"
echo -e " 16 ⸩ Delete XRay VLess"
echo -e " 17 ⸩ Renew XRay VLess"
echo -e " 18 ⸩ Cek XRay VLess"
echo -e ""
echo -e " 19 ⸩ Create XRay Trojan GFW"
echo -e " 20 ⸩ Delete XRay Trojan GFW"
echo -e " 21 ⸩ Renew XRay Trojan GFW"
echo -e " 12 ⸩ Cek XRay Trojan GFW"
echo -e ""
echo -e " 23 ⸩ Create XRay Trojan GO"
echo -e " 24 ⸩ Delete XRay Trojan GO"
echo -e " 25 ⸩ Renew XRay Trojan GO"
echo -e " 26 ⸩ Cek XRay Trojan GO" 
echo -e   ""
echo -e "${red}══════════════════════════════════════════════════════════${NC}"

echo -e "                 • SYSTEM •                 " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e " 27 ⸩ Add New Host"
echo -e " 28 ⸩ Restart All Service"
echo -e " 29 ⸩ Check Ram Usage"
echo -e " 30 ⸩ Check Bandwith Usage"
echo -e " 31 ⸩ Sett AutoReboot"
echo -e " 32 ⸩ Clear Log"
echo -e " 33 ⸩ Change SSH Banner"
echo -e " 34 ⸩ Kernel Update"
echo -e " 35 ⸩ Status"
echo -e ""
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " 0 ⸩ Reboot"
echo -e " x ⸩ Exit"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e   ""
read -p " Select menu option :  "  opt
echo -e   ""
case $opt in
1) clear ; usernew ;;
2) clear ; trial ;;
3) clear ; renew ;;
4) clear ; deluser ;;
5) clear ; cek ;;
6) clear ; member ;;
7) clear ; delete ;;
8) clear ; autokill ;;
9) clear ; ceklim ;;
10) clear ; restart ;;
11) clear ; add-xr ;;
12) clear ; del-xr ;;
13) clear ; renewws ;;
14) clear ; cek-ws ;;
15) clear ; add-xvless ;;
16) clear ; del-xvless ;;
17) clear ; renewvless ;;
18) clear ; cek-vless ;;
19) clear ; add-tr ;;
20) clear ; del-tr ;;
21) clear ; renew-tr ;;
22) clear ; cek-tr ;;
23) clear ; add-trg ;;
24) clear ; del-trg ;;
25) clear ; renew-trg ;;
26) clear ; cek-trgo
27) clear ; add-host ;;
28) clear ; resett ;;
29) clear ; ram ;;
30) clear ; bw ;;
31) clear ; auto-reboot ;;
32) clear ; clear-log ;;
33) clear ; nano /etc/issue.net ;;
34) clear ; kernel-updt ;;
35) clear ; status ;;
0) clear ; reboot ;;
x) exit ;;
*) sleep 1; menu ;;
esac
