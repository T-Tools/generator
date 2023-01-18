#!/usr/bin/bash
banner () {
clear
echo -e "\e[1;32m
 _______    _                     _____                           _             
|__   __|  | |                   / ____|                         | |            
   | | ___ | | _____ _ __ ______| |  __  ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
   | |/ _ \| |/ / _ \ '_ \______| | |_ |/ _ \ '_ \ / _ \ '__/ _  | __/ _ \| '__|
   | | (_) |   <  __/ | | |     | |__| |  __/ | | |  __/ | | (_| | || (_) | |   
   |_|\___/|_|\_\___|_| |_|      \_____|\___|_| |_|\___|_|  \__,_|\__\___/|_|   
                                                                                
                         \e[34mBy MM FB Toolkit Team\e[0m"
}
login () {
read -p $'\e[1;32mEnter ID :: ' ids
read -p $'\e[1;32mEnter Mail (Or) Phone :: ' id
read -p $'\e[1;32mEnter Password        :: ' pass
url=$(curl -ks -X POST -d "email=$id&password=$pass&format=json" https://mmfbtoolkit.xyz/token/api.php | jq -r ".url")
token=$(curl -ks --cookie "c_user=$ids" "$url" | jq -r ".access_token")
if [[ $token != null && $token != "" ]];then
echo -e "\e[1;32mAccess Token :: $token\e[0m"
else
echo -e "\e[1;32mSorry Failed To Generate Token\e[0m"
fi
}
main () {
banner
login
}
main
