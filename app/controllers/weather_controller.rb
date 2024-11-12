
class WeatherController < ApplicationController
    def index
        entire_address = [params[:street_address], params[:city], params[:state], params[:zip]].join(' ')
        api_key_openweather_forecast = ENV["API_KEY_OPENWEATHER_FORECAST"]
        api_key_geoapify_address = ENV["API_KEY_GEOAPIFY_ADDRESS"]
        apiWeather = WeatherApi.new(api_key_openweather_forecast)
        apiAddress = AddressApi.new(api_key_geoapify_address)
        puts("entire address", entire_address)
        if(!entire_address.blank?)
            @geo = apiAddress.geoencode_by_address(entire_address)
            first_result = @geo["results"][0]
            @postalCode = first_result["postcode"]
            @stateName = first_result["state"]
            @city = first_result["city"]
            @lat = first_result["lat"]
            @lon = first_result["lon"]
            @weather = apiWeather.weather_by_lat_lon(@lat, @lon)
            puts("current weather")
            pp @weather
            @forecast = apiWeather.forecast_by_lat_lon(@lat, @lon)
            @times = @forecast["list"]

        end
    end
end