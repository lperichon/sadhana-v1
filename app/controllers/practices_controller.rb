class PracticesController < UserApplicationController
  # GET /practices
  # GET /practices.xml
  def index
    if params[:deleted]
      @practices = current_user.archived_practices.paginate :page => params[:page], :per_page => 5
    else
      @practices = current_user.all_practices.paginate :page => params[:page], :per_page => 5
    end

    respond_to do |format|
      format.html {} # index.html.erb
    end
  end

  # GET /practices/1
  # GET /practices/1.xml
  def show
    begin
      @practice = current_user.practices.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = t('practices.not_owner_notice')
      redirect_to :back
      return false;
    end

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
      format.xml  { render :xml => @practice }
      format.js { require_subscription_check(@practice, true)}
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
    asana = Part.find_by_symbol('asana')
    @practice = current_user.practices.new(params[:practice])
    respond_to do |format|
      if @practice.save
        @practice.practice_parts.create(:part => asana)
        format.html { redirect_to practice_path(@practice)}
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
    if(params[:restore])
      @practice = current_user.practices.unscoped.find(params[:id])
      @result = @practice.restore
      flash.now[:notice] = t('practices.update.restore_notice')
      @restore = true
    else
      @practice = current_user.practices.find(params[:id])
      @result = @practice.update_attributes(params[:practice])
    end

    respond_to do |format|
      if @result
        format.xml  { head :ok }
        format.js {}
        format.json { render :json => {:result => @practice.send(params['wants'])} }
      else
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
        format.js {}
        format.json { render :json => {:result => @practice.send(params['wants'] + '_was')} }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.xml
  def destroy
    @practice = Practice.unscoped.find(:first, :conditions => {:id => params[:id], :user_id => current_user.id})

    if @practice.nil?
      @practice = current_user.shared_practices.find(params[:id])
      current_user.shared_practices.delete @practice
    elsif @practice.archived?
      @practice.destroy
      @destroy = true
    else
      flash.now[:notice] = t('practices.destroy.undo_notice',
        :undo_link => self.class.helpers.link_to_function(t('actions.undo'),"$.ajax({
          type:'put',
          data: { 'restore': true },
          dataType: 'script',
          url: '#{practice_path(@practice)}'
        });"),
        :destroy_link => self.class.helpers.link_to_function(t('actions.destroy_completely'),"$('#confirm_dialog').dialog({
          resizable: false,
          height:140,
          modal: true,
          buttons: {
          '#{t('actions.delete')}': function() {
              $.ajax({
                type:'post',
                data: { '_method': 'delete' },
                dataType: 'script',
                url: '#{practice_path(@practice)}'
              });
              $(this).dialog('close');
            },
           '#{t('actions.cancel')}': function() {
              $(this).dialog('close');
            }
          }
        });")).html_safe
      @practice.archive
    end

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok }
      format.js {}
    end
  end

  def play
    begin
      @practice = current_user.practices.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @practice = current_user.unscoped_shared_practices.find {|p| p.id == params[:id].to_i}
    end

    require_subscription_check(@practice)
  end


  protected

  def require_subscription_check(practice, no_return = false)
    if practice.user == current_user && current_user.practices_subscription_check(current_user.subscription.plan) && (practice.nil? || practice.new_record? || practice.position > current_user.subscription.plan.max_practices.to_i)
      flash.now[:notice] = t('practices.paid_account_notice', :count => current_user.subscription.plan.max_practices.to_i, :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
      return redirect_to :back unless no_return
    end
  end
end
