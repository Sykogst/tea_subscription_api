require 'rails_helper'

describe 'Create Customer Subscription Endpoint', type: :request do
  describe 'POST /api/v0/customer_subscriptions, with payload customer_id and subscription_id' do
    it 'creates a new customer subscription, GOOD data, 201 status, create /api/v0/customer_subscriptions' do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_payload = {
        customer_id: customer.id,
        subscription_id: subscription.id
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  
      post '/api/v0/customer_subscriptions', headers: headers, params: JSON.generate(customer_subscription_payload)
      created_customer_subscription = CustomerSubscription.last
  
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(created_customer_subscription.customer_id).to eq(customer_subscription_payload[:customer_id])
      expect(created_customer_subscription.subscription_id).to eq(customer_subscription_payload[:subscription_id])
    end

    it 'creates new customer and a subscription association, BAD customer_id data, 404 status, create /api/v0/customer_subscriptions' do
      subscription = create(:subscription)
      customer_subscription_params = ({
        customer_id: 1,
        subscription_id: subscription.id
      })
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('404')
      expect(data[:errors].first[:title]).to eq("Validation failed: Customer must exist, Customer can't be blank")
    end
    
    it 'creates new customer and a subscription association, BAD subscription_id data, 404 status, create /api/v0/customer_subscriptions' do
      customer = create(:customer)
      customer_subscription_params = ({
        customer_id: customer.id,
        subscription_id: 1
      })
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('404')
      expect(data[:errors].first[:title]).to eq("Validation failed: Subscription must exist, Subscription can't be blank")
    end
    
    it 'creates new customer and a subscription association, BAD nil customer_id data, 400 status, create /api/v0/customer_subscriptions' do
      subscription = create(:subscription)
      customer_subscription_params = ({
        subscription_id: subscription.id
      })
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
    
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('400')
      expect(data[:errors].first[:title]).to eq("Validation failed: Customer must exist, Customer can't be blank")
    end
    
    it 'creates new customer and a subscription association, BAD nil subscription_id data, 400 status, create /api/v0/customer_subscriptions' do
      customer = create(:customer)
      customer_subscription_params = ({
        customer_id: customer.id,
        subscription_id: nil
      })
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
    
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('400')
      expect(data[:errors].first[:title]).to eq("Validation failed: Subscription must exist, Subscription can't be blank")
    end
    
    it 'creates new customer and a subscription association, duplicate id data, 422 status, create /api/v0/customer_subscriptions' do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_params = ({
        customer_id: customer.id,
        subscription_id: subscription.id
      })
      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
      post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
    
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq('422')
      expect(data[:errors].first[:title]).to eq("Validation failed: Customer subscription association between customer and subscription with customer_id=#{customer.id} and subscription_id=#{subscription.id} already exists")
    end
    
  end
end
