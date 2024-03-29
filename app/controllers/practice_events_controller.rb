class PracticeEventsController < UserApplicationController
  before_filter :require_paid_account, :except => [:index, :new]

  # GET /practice_events
  # GET /practice_events.xml
  def index
    @practice_events = current_user.practice_events.all

    respond_to do |format|
      format.html { require_paid_account(true) } # index.html.erb
      format.xml  { render :xml => @practice_events }
    end
  end

  # GET /practice_events/1
  # GET /practice_events/1.xml
  def show
    @practice_event = current_user.practice_events.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @practice_event }
    end
  end

  # GET /practice_events/new
  # GET /practice_events/new.xml
  def new
    @practice_event = current_user.practice_events.new(params[:practice_event])

    respond_to do |format|
      format.xml  { render :xml => @practice_event }
      format.js { require_paid_account(true) }
    end
  end

  # GET /practice_events/1/edit
  def edit
    @practice_event = current_user.practice_events.find(params[:id])
  end

  # POST /practice_events
  # POST /practice_events.xml
  def create
    @practice_event = current_user.practice_events.new(params[:practice_event])

    respond_to do |format|
      if @practice_event.save
        format.xml  { render :xml => @practice_event, :status => :created, :location => @practice_event }
        format.js { flash.now[:notice] = t('practice_events.create_notice') }
      else
        format.xml  { render :xml => @practice_event.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /practice_events/1
  # PUT /practice_events/1.xml
  def update
    @practice_event = current_user.practice_events.find(params[:id])

    respond_to do |format|
      if @practice_event.update_attributes(params[:practice_event])
        format.xml  { head :ok }
        format.js {}
      else
        format.xml  { render :xml => @practice_event.errors, :status => :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE /practice_events/1
  # DELETE /practice_events/1.xml
  def destroy
    @practice_event = current_user.practice_events.find(params[:id])
    @practice_event.destroy

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok }
    end
  end


  protected

  def require_paid_account(no_return = false)
    if current_user.calendar_subscription_check(current_user.subscription.plan)
      flash.now[:notice] = t('practice_events.paid_account_notice', :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
      return redirect_to :back unless no_return
    end
  end
end
