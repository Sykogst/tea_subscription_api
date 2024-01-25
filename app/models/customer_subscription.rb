class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  validates :customer, :subscription, presence: true
  validates_uniqueness_of :customer_id, scope: :subscription_id

  enum status: { active: 0, cancelled: 1 }
end
