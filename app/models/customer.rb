class Customer < ApplicationRecord
  has_many :customer_subscriptions, dependent: :destroy
  has_many :subscriptions, through: :customer_subscriptions

  validates :first_name, :last_name, :address, presence: true
  validates :email, presence: true, uniqueness: true
end
