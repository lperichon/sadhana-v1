class PracticesController < UserApplicationController
  skip_before_filter :authenticate_user!

  # GET /practices
  # GET /practices.xml
  def index
    if params[:deleted]
      @practices = current_user.archived_practices.paginate :page => params[:page], :per_page => 5
    elsif params[:public]
      @practices = Practice.public.paginate :page => params[:page], :per_page => 5
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
    if params[:practice_id]
      original = Practice.unscoped.find(params[:practice_id])
      @practice = original.duplicate
      @practice.user = current_user
      flash[:notice] = t('practices.create.duplicate_notice')
    else
      asana = Part.find_by_symbol('asana')
      @practice = current_user.practices.new(params[:practice])
    end

    respond_to do |format|
        if @practice.save
          @practice.practice_parts.create(:part => asana) unless params[:practice_id]
          format.html { redirect_to practice_path(@practice)}
          format.xml  { render :xml => @practice, :status => :created, :location => @practice }
          format.js {}
        else
          format.html {}
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
    if params[:destroy_all].present?
      flash[:notice] = t('practices.destroy.destroy_all_notice')
      practices = Practice.unscoped.find(:all, :conditions => {:state => 'archived', :user_id => current_user.id})
      practices.each do |p|
        p.destroy
      end
    else
      @practice = Practice.unscoped.find(:first, :conditions => {:id => params[:id], :user_id => current_user.id})

      if @practice.nil?
        @practice = current_user.unscoped_shared_practices.find(params[:id]).first
        if @practice
          @practice.viewers.delete current_user
        else
          flash[:notice] = t('practices.not_owner_notice')
          redirect_to :back
          return false;
        end
      elsif @practice.archived?
        @practice.destroy
        @destroy = true
      else
        flash.now[:notice] = t('practices.destroy.undo_notice',
          :undo_link => self.class.helpers.link_to_function(t('practices.destroy.undo'),"$.ajax({
            type:'put',
            data: { 'restore': true },
            dataType: 'script',
            url: '#{practice_path(@practice)}'
          });"),
          :destroy_link => self.class.helpers.link_to_function(t('practices.destroy.destroy_completely'),"$('#confirm_dialog').dialog({
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
    end

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok }
      format.js {}
    end
  end

  def play
    if (current_user)
      begin
        @practice = current_user.practices.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @practice = current_user.unscoped_shared_practices.find {|p| p.id == params[:id].to_i}
        unless @practice
          @practice = Practice.public.find(params[:id])
          @practice.share_with(current_user, false) if @practice
        end
      end

      require_subscription_check(@practice)
    else
      @practice = Practice.public.find(params[:id])
    end
  end


  protected

  def require_subscription_check(practice, no_return = false)
    if practice.user == current_user && current_user.practices_subscription_check(current_user.subscription.plan) && (practice.nil? || practice.new_record? || practice.position > current_user.subscription.plan.max_practices.to_i)
      flash.now[:notice] = t('practices.paid_account_notice', :count => current_user.subscription.plan.max_practices.to_i, :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
      return redirect_to :back unless no_return
    end
  end
end
