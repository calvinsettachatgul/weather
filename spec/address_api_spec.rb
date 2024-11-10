require_relative "../app/controllers/address_api"

RSpec.describe '#geoencode_by_address' do
  addressService = AddressApi.new('api key')
  address_text = 'my street address city state zipcode'
  describe 'valid case' do
    it 'should call get' do
      allow(AddressApi).to receive(:get).and_return({response: 'a valid address response'})
      response = addressService.geoencode_by_address(address_text)
      expect(response).to eq({response: 'a valid address response'})
    end
  end

end