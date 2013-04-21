ActiveAdmin.register Subscription do
  menu false

  form do |f|
    f.inputs "Subscription Details" do
      f.input :plan, :input_html => {:name => 'plan'}
      f.input :balance_cents, :input_html => {:name => 'cents'}
      f.input :next_renewal_on
    end
    f.buttons
  end

  before_update do
    # find the plan
    plan = SubscriptionPlan.find params[:plan]

    # perform the change using #change_plan, dont just assign it
    if plan && resource.change_plan(plan)
      # after change_plan, call renew
      resource.renew
    end

    cents = params[:cents]
    @subscription.balance_cents = cents
  end
end
