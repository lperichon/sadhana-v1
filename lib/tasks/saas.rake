namespace :saas do
  desc "Daily subscription processing, including renewals and email messages"
  task :daily => :environment do
    #Lockfile('subscription_daily_lock', :retries => 0) do

      # send warnings that trial ending in 3 days
      #Subscription.with_state(:trial).with_no_warnings.due_in(3.days).each do |sub|
      #  SubscriptionConfig.mailer.trial_expiring(sub).deliver
      #  sub.increment!(:warning_level)
      #end

      # send warnings that trial ending in 3 days
      #Subscription.with_state(:active).with_no_warnings.due_in(3.days).each do |sub|
      #  SubscriptionConfig.mailer.subscription_expiring(sub).deliver
      #  sub.increment!(:warning_level)
      #end

      # renew subscriptions that are due now
      Subscription.with_states(:trial, :active).due_now.each do |sub|
        sub.renew
      end

      # try past due after a couple days
      # dont do this for now, since we are not charging directly.
      #Subscription.with_state(:past_due).with_warning_level(1).due_ago(3.days).each do |sub|
      #  sub.renew
      #end

      # end of grace period, try again or expire the subscription
      Subscription.with_state(:past_due).due_ago(SubscriptionConfig.grace_period.days).each  do |sub|
        #unless sub.renew
          # expired subscriptions change to a free plan and change state to 'expired'
          # (your app may also do other things on expire)
          sub.expired
          SubscriptionConfig.mailer.subscription_expired(sub).deliver
        #end
      end

    #end
  end
end