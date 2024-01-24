class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :subscription_id

  belongs_to :customer, serializer: CustomerSerializer
  belongs_to :subscription, serializer: SubscriptionSerializer
end
