class PracticesController < UserApplicationController
  # GET /practices
  # GET /practices.xml
  def index
    @practices = current_user.practices.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @practices }
    end
  end

  # GET /practices/1
  # GET /practices/1.xml
  def show
    @practice = current_user.practices.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.xml
  def new
    @practice = current_user.practices.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @practice }
    end
  end

  # GET /practices/1/edit
  def edit
    @practice = current_user.practices.find(params[:id])
  end

  # POST /practices
  # POST /practices.xml
  def create
    @practice = current_user.practices.new(params[:practice])

    respond_to do |format|
      if @practice.save
        format.html { redirect_to(@practice, :notice => 'Practice was successfully created.') }
        format.xml  { render :xml => @practice, :status => :created, :location => @practice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.xml
  def update
    @practice = current_user.practices.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to(@practice, :notice => 'Practice was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => {:result => @practice.send(params['wants'])} }
      else
        format.html { render :action => "edit" }
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
      format.html { redirect_to(practices_url) }
      format.xml  { head :ok }
      format.json { render :json => :ok }
    end
  end

  def play
    @practice = current_user.practices.find(params[:id])
  end
end
