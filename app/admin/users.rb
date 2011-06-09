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
      links = link_to icon(:home) + "Sign In", sign_in_as_path(:id => user.id), :class => "sign_in_link", :method => :post, :target => "_blank"
      links += link_to icon(:check) + "Manual Charge", manual_charge_admins_user_path(:id => user.id), :class => "manual_charge_link", :method => :post
      links
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

  member_action :manual_charge, :method => :post do
    @user = User.find(params[:id])
    @user.subscription.manual_charge_balance
    redirect_to admins_user_path(@user)
  end
end
