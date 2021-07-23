#!/bin/sh
nowIP=""
IP_FILE_NAME="new_ip.text"
IP_LOG_FILE_NAME="new_ip_log.text"
tempIP=""
start() {
  if [ -f $IP_FILE_NAME ]; then
    #    nowIP=$(head -n 1 $IP_FILE_NAME)
    nowIP=$(cat $IP_FILE_NAME)
    echo "read ip :$nowIP"
  fi
  while true; do
    tempIP=$(curl "ip.nsu.edu.cn" -s)
    if [ "$nowIP" != "$tempIP" ] && [ ${#tempIP} -lt 20 ] && [ ${#tempIP} -gt 0 ]; then
      echo "$(date +%Y-%m-%d\ %H:%M:%S):try update ip $tempIP " >>$IP_LOG_FILE_NAME

      updateIP $tempIP
    fi
    sleep 60
  done
}

#need input start
loginToken=""
userAgent="hiwifi/4.6(email@qq.com)"
domainID=""
recordID=""
subDomain=""
#need input end

jsonResult=""
successCode='"code":"1"'
updateIP() {
#  curl "ip.wangjian.tk/?homeIP=$1" -s
   jsonResult=$(curl -X POST https://dnsapi.cn/Record.Modify \
   -s \
   -k \
   -H "User-Agent: $userAgent" \
   -d "login_token=$loginToken&format=json&lang=cn&domain_id=$domainID&record_id=$recordID&sub_domain=$subDomain&record_type=A&record_line_id=0&value=$1&mx=1" )
   if ( echo "$jsonResult" |grep -q "$successCode" );then
       echo "$(date +%Y-%m-%d\ %H:%M:%S):update ip success $tempIP " >>$IP_LOG_FILE_NAME
       nowIP=$1
       echo "$nowIP" >$IP_FILE_NAME
   else
       echo "$(date +%Y-%m-%d\ %H:%M:%S):update ip fail $tempIP------$jsonResult" >>$IP_LOG_FILE_NAME
   fi

}

start