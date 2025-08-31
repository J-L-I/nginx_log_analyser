#!/bin/bash

#get top 5 requested IPs;
echo "Top 5 Requested IPs:";
awk '{print $1}' $1 | sort | uniq -cd | sort -r | head -n 5 | awk -v OFS=' - ' '{print $2,$1}';
echo "";

#get top 5 requested paths
echo "Top 5 Requested Paths:";
awk '{print $7}' $1 | sort | uniq -cd | sort -r | head -n 5 | awk -v OFS=' - ' '{print $2,$1}';
echo "";

#get top 5 status codes
echo "Top 5 Status Codes";
grep -oE ' [1-5][0-9]{2} ' $1 | sort | uniq -c | sort -rn | awk '{print $2 " - " $1}' |  head -n 5 
echo "";

#get top 5 user agents
echo "Top 5 User Agents";
awk '{print $12}' $1 | sort | uniq -c | sort -rn | awk '{print $2 " - " $1}' |  head -n 5;

