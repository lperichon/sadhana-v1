ActiveAdmin.register User do

  SubscriptionPlan.all.each do |plan|
    scope "#{plan.name} Users" do |users|
      users.joins(:subscription).where(:subscriptions => {:plan_id => plan.id})
    end
  end

  index do
    column :email
    column :last_sign_in_at, :sortable => :last_sign_in_at  do |user|
      distance_of_time_in_words_to_now(user.last_sign_in_at) unless user.last_sign_in_at.nil?
    end
    default_actions
    column do |user|
      link_to icon(:arrow_right_alt1) + "Sign In", sign_in_as_path(:id => user.id), :class => "sign_in_link", :method => :post
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
    end
    f.buttons
  end

  sidebar :subscription_information, :only => :show do
    attributes_table_for user.subscription do
      row(:plan) { auto_link user.subscription.plan }
      row(:state) { user.subscription.state }
      row(:balance) { user.subscription.balance_cents }
      a 'View', :href => admins_subscription_path(user.subscription)
    end
  end
end
