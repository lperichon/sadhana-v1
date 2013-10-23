class AddStripeToSubscriptionPlans < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :stripe_id, :string
  end

  def self.down
    remove_column :subscription_plans, :stripe_id
  end
end
