require 'rails_helper'

describe 'Create Customer Subscription Endpoint', type: :request do
  describe 'POST /api/v0/customer_subscriptions' do
    it 'creates a new customer subscription, GOOD data, 201 status, create /api/v0/customer_subscriptions' do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_payload = {
        customer_id: customer.id,
        subscription_id: subscription.id
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_payload)
      created_customer_subscription = CustomerSubscription.last
  
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(created_customer_subscription.customer_id).to eq(customer_subscription_payload[:customer_id])
      expect(created_customer_subscription.subscription_id).to eq(customer_subscription_payload[:subscription_id])
    end
  end
end