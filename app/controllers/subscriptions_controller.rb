class SubscriptionsController < UserApplicationController
  before_filter :find_subscription

  def update
    # find the plan
    current_password = params[:subscription].delete(:current_password)
    unless current_user.valid_password? current_password
      @subscription.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      return
    end

    plan = SubscriptionPlan.find params[:subscription][:plan]

    # consider case when plan doesnt change
    is_upgrade = plan.rate > @subscription.plan.rate
    is_downgrade = plan.rate < @subscription.plan.rate

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

      @subscription.stripe_card_token = params[:subscription][:stripe_card_token]

      # after change_plan, call renew
      @subscription.renew
    end
    

    respond_to do |format|
      format.html { redirect_to practices_path }  # failed above for some reason
      format.js {}
    end
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
