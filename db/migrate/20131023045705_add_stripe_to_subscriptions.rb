class AddStripeToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :stripe_customer_token, :string
  end

  def self.down
    remove_column :subscriptions, :stripe_customer_token
  end
end
