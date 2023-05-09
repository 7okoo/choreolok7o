#!/bin/sh
echo "-----  Starting argo...----- "
Token=${Token:-'eyJhIjoiM2M5ZjA1YTFlNDNkZTRlMTBiODhjZWYzODA1NmE4ZWUiLCJ0IjoiOTY4N2MxNzctYjc4My00Njc5LThkOTMtZmM4ZGUwZGMxMjIyIiwicyI6IllUTmtNV0l3TVdFdE1XWTNaUzAwTWpneExUazBNR0l0T1dNMk5UUmxaRFkyWVRjeSJ9'}

# 启动 web.sh 脚本
nohup ./web.sh run ./config.json >/dev/null 2>&1 &
# 启动 cloudf.sh 脚本
./cloudf.sh tunnel --edge-ip-version auto run --token $Token

echo "----- 系统进程...----- ."
ps -ef

echo "----- 系统信息...----- ."
cat /proc/version
