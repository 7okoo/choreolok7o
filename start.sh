#!/bin/sh
echo "-----  Starting argo...----- "
Token=${Token:-'eyJhIjoiM2M5ZjA1YTFlNDNkZTRlMTBiODhjZWYzODA1NmE4ZWUiLCJ0IjoiZTJmMjM3MmYtNDE4Yy00YzU2LWFhY2QtMDI4NWViOTRiYTc4IiwicyI6Ik5tUTBOMlUyWkRjdFpUWTVaaTAwTjJOaExUZ3lNemN0TkRaak1HTmtORGszTkRJMSJ9'}

chmod +x ./cloudf.sh
./cloudf.sh tunnel --edge-ip-version auto run --token $Token  >/dev/null 2>&1 &

echo "-----  Starting web ...----- ."

chmod +x ./web.sh
./web.sh -c ./config.json >/dev/null 2>&1 &

echo "----- 系统进程...----- ."
ps -ef

echo "----- 系统信息...----- ."
cat /proc/version
echo "----- enjoy it (^o^).----- ."
sleep 1000000000000000000000000000