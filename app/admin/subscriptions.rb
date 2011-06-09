ActiveAdmin.register Subscription do
  menu false

  form do |f|
    f.inputs "Subscription Details" do
      f.input :plan, :input_html => {:name => 'plan'}
      f.input :balance_cents, :input_html => {:name => 'cents'}
    end
    f.buttons
  end

  controller do
    def update
      # find the plan
      plan = SubscriptionPlan.find params[:plan]

      if plan.nil?
        flash[:notice] = "Plan not available"

      # perform the change using #change_plan, dont just assign it
      elsif resource.change_plan(plan)
        # after change_plan, call renew
        case result = resource.renew
        when false
          flash[:notice] << "An error occured trying to charge the credit card. Please update card information."
        when Money
          flash[:notice] << "The credit card has been charged #{result.format(:symbol => true)}"
        end
      end

      cents = params[:cents]
      @subscription.balance_cents = cents

      update! do |success, failure|
        failure.html { render_or_default 'edit' }
      end
    end
  end
end
