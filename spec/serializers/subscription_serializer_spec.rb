require 'rails_helper'

RSpec.describe SubscriptionSerializer, type: :serializer do
  describe 'Serializing' do
    it 'serializes subscription data' do
      tea = create(:tea)
      subscription = create(:subscription, tea: tea)
      serialized_subscription = SubscriptionSerializer.new(subscription).as_json['data']

      expect(serialized_subscription).to have_key('id')
      expect(serialized_subscription['id']).to eq(subscription.id.to_s)
      expect(serialized_subscription).to have_key('type')
      expect(serialized_subscription['type']).to eq('subscription')
      expect(serialized_subscription).to have_key('attributes')

      serialized_attributes = serialized_subscription['attributes']
      expect(serialized_attributes).to have_key('title')
      expect(serialized_attributes['title']).to eq(subscription.title)
      expect(serialized_attributes).to have_key('price')
      expect(serialized_attributes['price']).to eq(subscription.price.to_s)
      expect(serialized_attributes).to have_key('status')
      expect(serialized_attributes['status']).to eq(subscription.status)
      expect(serialized_attributes).to have_key('frequency')
      expect(serialized_attributes['frequency']).to eq(subscription.frequency)

      serialized_relationships = serialized_subscription['relationships']
      expect(serialized_relationships).to have_key('tea')    
    end
  end
end