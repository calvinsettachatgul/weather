class MemoryCache
    def initialize
      @cache = Rails.cache
    end
    def read(zipcode)
      puts("************reading from cache***********")
      # pp(@cache.read(zipcode))
      @cache.read(zipcode)
    end
    def write(zipcode, current, forecast)
      @cache.write(zipcode, { current: current, forecast: forecast }, expires_in: 30.minute)
    end
end
