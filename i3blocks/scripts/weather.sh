echo -n 'Temp: '
curl -silent https://weather-broker-cdn.api.bbci.co.uk/en/observation/rss/2643123  > /tmp/weather2.html
egrep "Temperature.* \(" /tmp/weather2.html -o | cut -d ' ' -f 2

