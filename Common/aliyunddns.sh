#!/bin/sh

set -e

if [ $1 ]; then
    domain=$1
fi

if [ -z "$domain" ]; then
    echo "缺少必须参数 domain"
    exit 1
fi

if [ $2 ]; then
    subDomain=$2
fi

if [ -z "$subDomain" ]; then
    subDomain="@"
fi

# 域名解析记录id
domainRecordId=""
# 域名解析记录 Ipv6 地址
domainRecordIpv6=""
# 最新本地 ipv6 地址
newIpv6=""

# 获取本地 ipv6 地址
getLocalIpv6(){
    echo "getLocalIpv6 ..."
    newIpv6=`ip addr show eth0 | grep "inet6.*global temporary dynamic" | awk '{print $2}' | awk -F"/" '{print $1}'` || die "$ipv6"
    echo "getLocalIpv6 ipv6:$newIpv6."
}

# 获取域名解析记录
getDomainRecordId() {
    echo "getDomainRecordId..."
    # 查询域名解析记录
    local jsonData=`aliyun alidns DescribeSubDomainRecords --Type AAAA --SubDomain "$subDomain.$domain" --DomainName $domain`
    # 测试JSON数据
    # jsonData=$'{
    #     "DomainRecords": {
    #         "Record": [
    #             {
    #                 "DomainName": "melove.net",
    #                 "Line": "default",
    #                 "Locked": false,
    #                 "RR": "www",
    #                 "RecordId": "854565756207798272",
    #                 "Status": "ENABLE",
    #                 "TTL": 600,
    #                 "Type": "AAAA",
    #                 "Value": "240e:304:2c81:1951:e9a9:d152:9a14:ef3c",
    #                 "Weight": 1
    #             }
    #         ]
    #     },
    #     "PageNumber": 1,
    #     "PageSize": 20,
    #     "RequestId": "08053517-D710-5F24-BAEA-B797B1A5D232",
    #     "TotalCount": 1
    # }'
    # 使用 jq 解析数据
    domainRecordId=$(jq -r '.DomainRecords.Record[0].RecordId' <<< "$jsonData")
    domainRecordIpv6=$(jq -r '.DomainRecords.Record[0].Value' <<< "$jsonData")

    # 输出解析结果
    echo "getDomainRecordId parse result recordId: $domainRecordId, ipValue:$domainRecordIpv6"
}

# 添加解析记录
addDomainRecord() {
    # 新增域名解析记录
    local jsonData=`aliyun alidns AddDomainRecord --DomainName $domain --RR $subDomain --Type AAAA --Value $newIpv6`

    echo "addDomainRecord result: $jsonData"

    recordId=$(jq -r '.RecordId' <<< "$jsonData")
    requestId=$(jq -r '.RequestID' <<< "$jsonData")
    
    echo "addDomainRecord result recordId:$recordId, requestId:$requestId"
    
    # 判断设置结果
    if [ -z "$recordId" -o -z "$requestId" ]; then
        # 提取ErrorCode
        errorCode=$(echo "$jsonData" | grep -oP 'ErrorCode:\s*\K[^\n]+')
        # 提取Message
        message=$(echo "$jsonData" | grep -oP 'Message:\s*\K[^\n]+')

        echo "addDomainRecord failed [$errorCode-$message]"
        echo $jsonData 
    else
        echo "addDomainRecord successful $subDomain.$domain - $newIpv6"
    fi
}

# $1 = record ID, $2 = new IP
updateDomainRecord() {
    # 更新解析记录
    local jsonData=`aliyun alidns UpdateDomainRecord --RecordId $domainRecordId --RR $subDomain --Type AAAA --Value $newIpv6`
    echo "addDomainRecord result: $jsonData"

    recordId=$(jq -r '.RecordId' <<< "$jsonData")
    requestId=$(jq -r '.RequestID' <<< "$jsonData")

    echo "updateDomainRecord result recordId:$recordId, requestId:$requestId"

    # 判断设置结果
    if [ -z "$recordId" -o -z "$requestId" ]; then
        # 提取ErrorCode
        errorCode=$(echo "$jsonData" | grep -oP 'ErrorCode:\s*\K[^\n]+')
        # 提取Message
        message=$(echo "$jsonData" | grep -oP 'Message:\s*\K[^\n]+')

        echo "updateDomainRecord failed [$errorCode-$message]"
        echo $jsonData 
    else
        echo "updateDomainRecord successful $subDomain.$domain - $newIpv6"
    fi
}

# 检查域名解析记录
checkDomainRecord(){
    # 获取本机 ipv6 地址
    getLocalIpv6

    # 获取域名解析记录id 未设置会为空
    getDomainRecordId


    if [ "$domainRecordIpv6" == "$newIpv6" ]; then
        echo "checkDomainRecord ip is not change quit..."
    else 
        if [ -z "$domainRecordId" -o "$domainRecordId" = "" -o "$domainRecordId" = null ]; then
            echo "checkDomainRecord recordId is null, prepare add [$subDomain.$domain - $newIpv6]"
            addDomainRecord
        else
            echo "checkDomainRecord recordId is $domainRecordId, prepare update [$subDomain.$domain - $newIpv6]"
            updateDomainRecord
        fi
    fi
}

checkDomainRecord
