class AddAvailableBooleanToSubscriptionPlans < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :available, :boolean
  end

  def self.down
    remove_column :subscription_plans, :available
  end
end
