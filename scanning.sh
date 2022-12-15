#!/bin/bash
blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

read -p "list : " list;
for i in $(cat $list);
do
dde=$(dig -t A "${i}" | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
if [[ $(echo $dde) =~ "pantheonsite.io" ]];
then
  sleep 1
  dd=$(dig -t A "${i}" | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
  echo -e "$cyan[+]$yellow $i =>$okegreen $dde"
  echo "$i|$dd" >> pantheon.txt
  else
     if [[ $(echo $dde) =~ "azurewebsites.net" ]];
     then
          sleep 1
         dd=$(dig -t A ${i} | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
         echo -e "$cyan[+]$yellow $i =>$okegreen $dd"
         echo "$i|$dd" >> azurewebsites.txt
      else
         if [[ $(echo $dde) =~ "trafficmanager.net" ]];
         then
              sleep 1
             dd=$(dig -t A ${i} | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
             echo -e "$cyan[+]$yellow $i =>$okegreen $dd"
             echo "$i|$dd" >> trafficmanager.txt
         else
		    if [[ $(echo $dde) =~ "cloudapp.azure.net" ]];
         then
              sleep 1
             dd=$(dig -t A ${i} | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
             echo -e "$cyan[+]$yellow $i =>$okegreen $dd"
             echo "$i|$dd" >> cloudapp.azure.txt
         else
		 if [[ $(echo $dde) =~ "github.io" ]];
         then
              sleep 1
             dd=$(dig -t A ${i} | grep -A1  "ANSWER SECTION" | tail -1| grep CNAME | awk "{print \$5}")
             echo -e "$cyan[+]$yellow $i =>$okegreen $dd"
             echo "$i|$dd" >> github.txt
         else
             echo -e "$cyan[+]$yellow $i =>$red Not Vuln"
            fi
        fi
		fi
fi
fi
done
