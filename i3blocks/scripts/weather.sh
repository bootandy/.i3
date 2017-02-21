curl -silent http://www.rssweather.com/wx/gb/london/wx.php > /tmp/weather.html
egrep "<p class=\"summary\">.*(Temperature)[^<]*" /tmp/weather.html -o | sed 's/<[^>]*>//g' | sed 's/Temperature://'| sed 's/&deg;//'


