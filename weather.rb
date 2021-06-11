require "http"

weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=columbus&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")

weather = weather.parse(:json)

# pp weather

temp_min = weather["main"]["temp_min"]
temp_max = weather["main"]["temp_max"]
description = weather["weather"][0]["description"]
wind_speed = weather["wind"]["speed"]
city_name = weather["name"]

p "Currently in #{city_name} there is #{description} with a wind speed of #{wind_speed}mph. Todays high is #{temp_max} with a low of #{temp_min}"


#find wind speed