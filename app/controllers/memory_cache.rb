class MemoryCache
    def initialize()
      @cache = Rails.cache
    end
    def forecast_by_lat_lon(lat, lon)
      @options[:query][:lat] = lat
      @options[:query][:lon] = lon
      self.class.get("/forecast", @options)
    end
    def write(key, data)
      @cache.write(key, data, expires_in: 30.minute)
    end
  end