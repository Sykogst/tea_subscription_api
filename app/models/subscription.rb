class Subscription < ApplicationRecord
  belongs_to :tea
  has_many :customer_subscriptions, dependent: :destroy
  has_many :customers, through: :customer_subscriptions

  validates :title, :price, :status, :frequency, :tea, presence: true

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { monthly: 0, weekly: 1, daily: 2 }
end
