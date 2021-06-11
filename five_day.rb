require "http"
require "awesome_print"

five_day = HTTP.get("http://api.openweathermap.org/data/2.5/forecast?q=columbus&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")

pp five_day.parse(:json)