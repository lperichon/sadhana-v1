ActiveAdmin.register User do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
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
