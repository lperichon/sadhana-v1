class AddMaxPracticesLimitToSubscriptionPlans < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :max_practices, :integer
  end

  def self.down
    remove_column :subscription_plans, :max_practices
  end
end
