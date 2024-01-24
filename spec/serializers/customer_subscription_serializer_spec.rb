require 'rails_helper'

RSpec.describe CustomerSubscriptionSerializer, type: :serializer do
  describe 'Serializing' do
    it 'serializes customer subscription data' do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription = create(:customer_subscription, customer: customer, subscription: subscription)

      serialized_cs = CustomerSubscriptionSerializer.new(customer_subscription).as_json
      expect(serialized_cs).to have_key('data')

      serialized_data = serialized_cs['data']
      expect(serialized_data).to have_key('id')
      expect(serialized_data['id']).to eq(customer_subscription.id.to_s)
      expect(serialized_data).to have_key('type')
      expect(serialized_data['type']).to eq('customer_subscription')
      expect(serialized_data).to have_key('attributes')
      expect(serialized_data).to have_key('relationships')

      serialized_attributes = serialized_data['attributes']
      expect(serialized_attributes).to have_key('customer_id')
      expect(serialized_attributes['customer_id']).to eq(customer.id)
      expect(serialized_attributes).to have_key('subscription_id')
      expect(serialized_attributes['subscription_id']).to eq(subscription.id)

      serialized_relationships = serialized_data['relationships']
      expect(serialized_relationships).to have_key('customer')    
      expect(serialized_relationships).to have_key('subscription')    
    end
  end
end