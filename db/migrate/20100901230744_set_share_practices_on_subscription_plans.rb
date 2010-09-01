class SetSharePracticesOnSubscriptionPlans < ActiveRecord::Migration
  def self.up
    beta = SubscriptionPlan.find_by_name('beta')
    beta.share_practices = true
    beta.save
  end

  def self.down
  end
end
