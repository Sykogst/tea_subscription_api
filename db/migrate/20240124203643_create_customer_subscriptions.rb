class CreateCustomerSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
