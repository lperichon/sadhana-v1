class PracticeEventsController < UserApplicationController
  # GET /practice_events
  # GET /practice_events.xml
  def index
    @practice_events = current_user.practice_events.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @practice_events }
    end
  end

  # GET /practice_events/1
  # GET /practice_events/1.xml
  def show
    @practice_event = current_user.practice_events.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @practice_event }
    end
  end

  # GET /practice_events/new
  # GET /practice_events/new.xml
  def new
    @practice_event = current_user.practice_events.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @practice_event }
      format.js {}
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
        format.html { redirect_to(@practice_event, :notice => 'Practice event was successfully created.') }
        format.xml  { render :xml => @practice_event, :status => :created, :location => @practice_event }
        format.js {}
      else
        format.html { render :action => "new" }
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
        format.html { redirect_to(@practice_event, :notice => 'Practice event was successfully updated.') }
        format.xml  { head :ok }
        format.js {}
      else
        format.html { render :action => "edit" }
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
      format.html { redirect_to(practice_events_url) }
      format.xml  { head :ok }
      format.json { render :json => :ok }
    end
  end
end
