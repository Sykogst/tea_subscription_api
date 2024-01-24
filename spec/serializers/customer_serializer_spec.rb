require 'rails_helper'

RSpec.describe CustomerSerializer, type: :serializer do
  describe 'Serializing' do
    it 'serializes customer data' do
      customer = create(:customer)
      serialized_customer = CustomerSerializer.new(customer).as_json['data']

      expect(serialized_customer).to have_key('id')
      expect(serialized_customer['id']).to eq(customer.id.to_s)
      expect(serialized_customer).to have_key('type')
      expect(serialized_customer['type']).to eq('customer')
      expect(serialized_customer).to have_key('attributes')

      serialized_attributes = serialized_customer['attributes']
      expect(serialized_attributes).to have_key('first_name')
      expect(serialized_attributes['first_name']).to eq(customer.first_name)
      expect(serialized_attributes).to have_key('last_name')
      expect(serialized_attributes['last_name']).to eq(customer.last_name)
      expect(serialized_attributes).to have_key('address')
      expect(serialized_attributes['address']).to eq(customer.address)
      expect(serialized_attributes).to have_key('email')
      expect(serialized_attributes['email']).to eq(customer.email)
    end
  end
end