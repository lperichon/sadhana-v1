class SubscriptionsController < UserApplicationController
  before_filter :find_subscription

  def update
    # find the plan
    plan = SubscriptionPlan.find params[:subscription][:plan]
    if plan.nil?
      flash[:notice] = "Plan not available"
      
    # make sure its an allowed plan
    elsif exceeded = @subscription.exceeds_plan?( plan ) 
      flash[:notice] = "You cannot change to plan #{plan.name}. Resources exceeded"
      flash[:notice] << ": #{exceeded.keys.join(', ')}" if exceeded.is_a?(Hash)
      
    # perform the change
    # note, use #change_plan, dont just assign it
    elsif @subscription.change_plan(plan)  
      flash[:notice] = "Successfully changed plans. "
      
      # after change_plan, call renew
      case result = @subscription.renew
      when false
        flash[:notice] << "An error occured trying to charge your credit card. Please update your card information."
      when Money
        flash[:notice] << "Thank you for your payment. Your credit card has been charged #{result.format(:symbol => true)}"
      end
      return redirect_to practices_path
    end
    
    # failed above for some reason
    redirect_to practices_path
  end

  def cancel
    @subscription.cancel
    flash[:notice] = 'Your subscription has been canceled. You still have limited access to this site.'
    redirect_to subscription_path(:current)
  end

  # could put these in separate controllers, but keeping it simple for now
  def credit_card
    @profile = @subscription.profile
    respond_to do |format|
      format.js # credit_card.js.rjs
    end
  end

  def store_credit_card
    @profile = @subscription.profile
    @profile.credit_card = params[:profile][:credit_card]
    @profile.request_ip = request.remote_ip

    if @subscription.profile.save
      case result = @subscription.renew
      when false
        flash[:notice] = "An error occured trying to charge your credit card. Please update your card information."
      when Money
        flash[:notice] = "Thank you for your payment. Your credit card has been charged #{result.format(:symbol => true)}"
      else
        flash[:notice] = "Credit card info successfully updated. No charges have been made at this time."
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def unstore_credit_card
    @subscription.profile.unstore_card
    @subscription.profile.save
    respond_to do |format|
      format.js
    end
  end

  def history
    @transactions = @subscription.transactions
    respond_to do |format|
      format.js # history.js.rjs
    end
  end

  private

  def find_subscription
    @subscription = current_user.subscription
  end
end
