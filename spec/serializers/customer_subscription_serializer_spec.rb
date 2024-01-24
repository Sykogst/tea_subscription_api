require 'rails_helper'

RSpec.describe CustomerSubscriptionSerializer, type: :serializer do
  describe 'Serializing' do
    it 'serializes customer subscription data' do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_payload = {
        customer_id: customer.id,
        subscription_id: subscription.id
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  
      post '/api/v0/customer_subscriptions', headers: headers, params: JSON.generate(customer_subscription: customer_subscription_payload)
      created_customer_subscription = CustomerSubscription.last
      serialized_data = CustomerSubscriptionSerializer.new(created_customer_subscription)

      expect(serialized_data).to have_key("customer_id")
      expect(serialized_data["customer_id"]).to eq(customer_subscription_payload[:customer_id])

      expect(serialized_data).to have_key("subscription_id")
      expect(serialized_data["subscription_id"]).to eq(customer_subscription_payload[:subscription_id])
    end
  end
end