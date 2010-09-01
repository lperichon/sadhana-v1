class AddSharePracticesBooleanToSubscriptionPlan < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :share_practices, :boolean, :default => false
  end

  def self.down
    remove_column :subscription_plans, :share_practices
  end
end
