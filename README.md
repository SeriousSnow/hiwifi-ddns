# hiwifi-ddns

#### test12

hiwifi shell script,auto modify dnspod domain record value.

api from 

https://docs.dnspod.cn/api/5f561f9ee75cf42d25bf6720/

https://docs.dnspod.cn/api/5f562a49e75cf42d25bf6872/


# start

before use,you need prepare something

token:https://console.dnspod.cn/account/token/token
then `loginToken="ID,Token"` see https://docs.dnspod.cn/api/5f561f9ee75cf42d25bf6720/

`API Token 生成方法详见 密钥管理 ：API 鉴权方式升级为 Token，完整的 API Token 是由 ID,Token 组合而成的，用英文的逗号分割。`

`domainID,recordID,subDomain` please use 
`curl -X POST https://dnsapi.cn/Record.List -H "User-Agent: hiwifi/4.6(your email)" -d "login_token=$loginToken&format=json&lang=zh&domain=$yourDomain"`
see https://docs.dnspod.cn/api/5f562ae4e75cf42d25bf689e/

then edit scripts

`loginToken=""
userAgent="hiwifi/4.6(your email)"
domainID=""
recordID=""
subDomain=""`
