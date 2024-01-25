require 'rails_helper'

describe 'Get All Subscriptions for a Customer Endpoint', type: :request do
  describe 'GET /api/v0/customer_subscriptions, with payload customer_id' do
    it 'returns all subscriptions for a customer, 200 status' do
      customer = create(:customer)
      subscriptions = create_list(:customer_subscription, 3, customer: customer)
      payload = { customer_id: customer.id }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      get '/api/v0/customer_subscriptions', headers: headers, params: payload

      data_parsed = JSON.parse(response.body, symbolize_names: true)
      expect(data_parsed).to have_key(:customer_id)
      expect(data_parsed).to have_key(:subscriptions)
      
      data = data_parsed[:subscriptions][:data]

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data).to be_a(Array)
      expect(data.size).to eq(subscriptions.size)
   
      expect(data.first[:attributes][:id]).to eq(subscriptions.first.subscription_id)
      expect(data.last[:attributes][:id]).to eq(subscriptions.last.subscription_id)
    end

    it 'returns an empty array if the customer has no subscriptions, 200 status' do
      customer = create(:customer)

      payload = { customer_id: customer.id }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      get '/api/v0/customer_subscriptions', headers: headers, params: payload

      data_parsed = JSON.parse(response.body, symbolize_names: true)   
      data = data_parsed[:subscriptions][:data]
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data).to be_a(Array)
      expect(data).to be_empty
    end

    it 'returns 404 if the customer is not found' do
      payload = { customer_id: -1 }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      get '/api/v0/customer_subscriptions', headers: headers, params: payload

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_successful
      expect(response.status).to eq(404)
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('404')
      expect(data[:errors].first[:title]).to eq("Couldn't find Customer with 'id'=-1")
    end
  end
end