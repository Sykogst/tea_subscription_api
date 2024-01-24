class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :status, :frequency

  belongs_to :tea, serializer: TeaSerializer
end
