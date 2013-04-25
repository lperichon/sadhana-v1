class AddOneSecADayTrainingToSubscriptionPlans < ActiveRecord::Migration
  def self.up
  	add_column :subscription_plans, :one_sec_a_day_training, :boolean, :default => false
  end

  def self.down
  	remove_column :subscription_plans, :one_sec_a_day_training
  end
end
