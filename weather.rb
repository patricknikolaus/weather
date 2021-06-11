require "http"

while true
  print "Enter a city: "
  city = gets.chomp
  if city == "quit"
    break
  end
  print "Temperature units?[C/F]: "
  temperature = gets.chomp
  if temperature == "F"
    units = "imperial"
  elsif temperature == "C"
    units = "metric"
  end
  weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=#{units}")

  weather = weather.parse(:json)

  temp_min = weather["main"]["temp_min"]
  temp_max = weather["main"]["temp_max"]
  description = weather["weather"][0]["description"]
  wind_speed = weather["wind"]["speed"]
  city_name = weather["name"]

  p "Currently #{city_name} has #{description} with a wind speed of #{wind_speed}mph. Todays high is #{temp_max} with a low of #{temp_min}"
end

# weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=#{units}")

# weather = weather.parse(:json)

# temp_min = weather["main"]["temp_min"]
# temp_max = weather["main"]["temp_max"]
# description = weather["weather"][0]["description"]
# wind_speed = weather["wind"]["speed"]
# city_name = weather["name"]

# p "Currently in #{city_name} has #{description} with a wind speed of #{wind_speed}mph. Todays high is #{temp_max} with a low of #{temp_min}"