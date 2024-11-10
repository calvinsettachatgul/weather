require 'httparty'

class AddressApi
  include HTTParty

  debug_output $stdout

  base_uri 'https://api.geoapify.com/v1/geocode/'
  def initialize(api_key)
    @options = { query: { 
        apiKey: api_key,
        format: "json"
    } }
  end
  def geoencode_by_address(text_address)
    @options[:query][:text] = text_address
    self.class.get("/search", @options)
  end
end