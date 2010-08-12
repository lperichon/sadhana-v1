class Admin::SubscriptionsController < AdminApplicationController
  def manual_charge
    @subscription = Subscription.find(params[:id])
    @subscription.manual_charge_balance
    redirect_to admin_subscriptions_path
  end

  # GET /subscriptions
  # GET /subscriptions.xml
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.xml
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # _sign_in_dialog.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.xml
  def create
    @subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to([:admin, @subscription], :notice => 'Subscription was successfully created.') }
        format.xml  { render :xml => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.xml
  def update
    @subscription = Subscription.find(params[:id])

    # find the plan
    plan = SubscriptionPlan.find params[:subscription][:plan]
    if plan.nil?
      flash[:notice] = "Plan not available"
      
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
#      return redirect_to practices_path
    end

    # failed above for some reason
    redirect_to admin_subscription_path(@subscription)
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.xml
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to(admin_subscriptions_url) }
      format.xml  { head :ok }
    end
  end
end