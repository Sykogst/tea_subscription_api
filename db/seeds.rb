# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed data for teas
tea1 = FactoryBot.create(:tea, title: 'Green Tea', description: 'Fresh and aromatic green tea.', temperature: 75.0, brew_time: '3:00')
tea2 = FactoryBot.create(:tea, title: 'Black Tea', description: 'Rich and bold black tea.', temperature: 85.0, brew_time: '4:00')
tea3 = FactoryBot.create(:tea, title: 'Oolong Tea', description: 'Semi-fermented tea with a unique flavor.', temperature: 80.0, brew_time: '3:30')

# Seed data for subscriptions
subscription1 = FactoryBot.create(:subscription, title: 'Monthly Green Tea Box', price: 19.99, status: 'active', frequency: 'monthly', tea: tea1)
subscription2 = FactoryBot.create(:subscription, title: 'Weekly Black Tea Special', price: 24.99, status: 'active', frequency: 'weekly', tea: tea2)
subscription3 = FactoryBot.create(:subscription, title: 'Daily Oolong Tea Delight', price: 29.99, status: 'active', frequency: 'daily', tea: tea3)

# Seed data for customers
customer1 = FactoryBot.create(:customer, first_name: 'Sam', last_name: 'Tran', email: 'sam@email.com', address: '123 Some St')
customer2 = FactoryBot.create(:customer, first_name: 'Jane', last_name: 'Doe', email: 'jane@email.com', address: '456 Another Ave')
customer3 = FactoryBot.create(:customer, first_name: 'Bob', last_name: 'Smith', email: 'bob@email.com', address: '789 This Rd')

# Seed data for customer subscriptions
# CustomerSubscription.create(customer: customer1, subscription: subscription1)
# CustomerSubscription.create(customer: customer2, subscription: subscription2)
# CustomerSubscription.create(customer: customer3, subscription: subscription3)
