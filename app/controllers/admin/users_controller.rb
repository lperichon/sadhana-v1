class Admin::UsersController < AdminApplicationController
  def manual_charge
    @user = User.find(params[:id])
    @user.subscription.manual_charge_balance
    redirect_to admin_users_path
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # _sign_in_dialog.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to([:admin, @user], :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    # find the plan
    plan = SubscriptionPlan.find params[:user][:subscription][:plan]
    if plan.nil?
      flash[:notice] = "Plan not available"
      
    # perform the change
    # note, use #change_plan, dont just assign it
    elsif @user.subscription.change_plan(plan)
      flash[:notice] = "Successfully changed plans. "

      # after change_plan, call renew
      case result = @user.subscription.renew
      when false
        flash[:notice] << "An error occured trying to charge your credit card. Please update your card information."
      when Money
        flash[:notice] << "Thank you for your payment. Your credit card has been charged #{result.format(:symbol => true)}"
      end
#      return redirect_to practices_path
    end

    # failed above for some reason
    redirect_to admin_user_path(@user)
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end
end