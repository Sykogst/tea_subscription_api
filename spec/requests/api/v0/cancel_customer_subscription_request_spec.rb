require 'rails_helper'

describe 'Cancel Customer Subscription Endpoint', type: :request do
  describe 'PATCH /api/v0/customer_subscriptions/cancel, with payload customer_subscription_id' do
    it 'cancels an existing customer subscription, 200 status' do
      customer_subscription = create(:customer_subscription)
      payload = { customer_subscription_id: customer_subscription.id }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      patch '/api/v0/customer_subscriptions/cancel', headers: headers, params: JSON.generate(payload)

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'returns 404 if customer subscription not found' do
      customer_subscription = create(:customer_subscription)
      payload = { customer_subscription_id: -1 }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      patch '/api/v0/customer_subscriptions/cancel', headers: headers, params: JSON.generate(payload)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('404')
      expect(data[:errors].first[:title]).to eq('Customer Subscription not found.')
    end

    it 'returns 422 if cancellation fails' do
      customer_subscription = create(:customer_subscription, status: :cancelled)
      payload = { customer_subscription_id: customer_subscription.id }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      patch '/api/v0/customer_subscriptions/cancel', headers: headers, params: JSON.generate(payload)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('422')
      expect(data[:errors].first[:title]).to eq('Status cannot be changed')
    end
  end
end
