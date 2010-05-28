class PracticesController < UserApplicationController
  # GET /practices
  # GET /practices.xml
  def index
    @practices = current_user.practices.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /practices/1
  # GET /practices/1.xml
  def show
    @practice = current_user.practices.find(params[:id])

    respond_to do |format|
      format.html { require_subscription_check(@practice) } # show.html.erb
      format.xml  { render :xml => @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.xml
  def new
    @practice = current_user.practices.new

    respond_to do |format|
      format.html { require_subscription_check(@practice) }
      format.xml  { render :xml => @practice }
      format.js {}
    end
  end

  # GET /practices/1/edit
  def edit
    @practice = current_user.practices.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @practice }
    end
  end

  # POST /practices
  # POST /practices.xml
  def create
    @practice = current_user.practices.new(params[:practice])

    respond_to do |format|
      if @practice.save
        format.xml  { render :xml => @practice, :status => :created, :location => @practice }
        format.js {}
      else
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.xml
  def update
    @practice = current_user.practices.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.xml  { head :ok }
        format.json { render :json => {:result => @practice.send(params['wants'])} }
      else
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
        format.json { render :json => {:result => @practice.send(params['wants'] + '_was')} }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.xml
  def destroy
    @practice = current_user.practices.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok }
    end
  end

  def play
    @practice = current_user.practices.find(params[:id])

    require_subscription_check(@practice)
  end


  protected

  def require_paid_account
    if current_user.subscription.free?
      flash[:notice] = 'You require a paid subscription for full functionality.'
      return redirect_to :back
    end
  end

  def require_subscription_check(practice)
    if current_user.practices_subscription_check(current_user.subscription.plan) && (practice.new_record? || practice.position > current_user.subscription.plan.max_practices.to_i) 
      flash[:notice] = 'You require a paid subscription for full functionality.'
      return redirect_to :back
    end
  end
end
