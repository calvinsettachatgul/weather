require_relative "../app/controllers/weather_api"

RSpec.describe '#forecast_by_lat_lon' do
  weather = WeatherApi.new('api key')
  lat = '12.345'
  lon = '122.345'
  it 'should call get' do
    allow(WeatherApi).to receive(:get).and_return({response: 'a valid weather response'})
    response = weather.forecast_by_lat_lon(lat, lon)
    expect(response).to eq({response: 'a valid weather response'})
  end

end

RSpec.describe '#weather_by_lat_lon' do
  weather = WeatherApi.new('api key')
  lat = '12.345'
  lon = '122.345'
  it 'should call get' do
    allow(WeatherApi).to receive(:get).and_return({response: 'a valid current weather response'})
    response = weather.weather_by_lat_lon(lat, lon)
    expect(response).to eq({response: 'a valid current weather response'})
  end

end