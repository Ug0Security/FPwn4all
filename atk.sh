
cook=$(torify curl -sik -X POST $1'/cgi-bin/luci/admin/system/crontab' -d "username=admin&password=fp4all" | grep "Set-Cookie")


tok=$(echo $cook | cut -d '=' -f 4 | tr -d '\r' )
cook=$(echo $cook |  cut -d '=' -f 2 | cut -d ';' -f 1 | tr -d '\r')


torify curl -g -H "Cookie: sysauth=$cook" -F cbi.submit=1 -F cbid.crontab.1.crons='''# 100 loops x 10s/loop = 1000s / 60s = 17min
*/30 * * * *     [ -f /home/felogger/test_x10s.sh ] && /home/felogger/test_x10s.sh 130

# get latest weather info
*/30 * * * *     [ -f /home/weather.sh ] && /home/weather.sh

# test if web interface is still up else restart
*/30 * * * *     [ -f /etc/testweb.sh ] && /etc/testweb.sh

'''$2 $1/"cgi-bin/luci/;stok=$tok/admin/system/crontab"

