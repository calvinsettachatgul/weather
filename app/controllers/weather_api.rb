require 'httparty'
class WeatherApi
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'
  def initialize(api_key)
    @options = { query: { appid: api_key } }
  end
  def weather_by_lat_lon(lat, lon)
    @options[:query][:lat] = lat
    @options[:query][:lon] = lon
    self.class.get("/forecast", @options)
  end
end