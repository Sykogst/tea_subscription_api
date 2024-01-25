require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:subscription) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:subscription) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 0, cancelled: 1) }
  end
end
