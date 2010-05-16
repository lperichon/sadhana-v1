class Admin::TechniqueTypesController < AdminApplicationController
  # GET /technique_types
  # GET /technique_types.xml
  def index
    @technique_types = TechniqueType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @technique_types }
    end
  end

  # GET /technique_types/1
  # GET /technique_types/1.xml
  def show
    @technique_type = TechniqueType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technique_type }
    end
  end

  # GET /technique_types/new
  # GET /technique_types/new.xml
  def new
    @technique_type = TechniqueType.new

    respond_to do |format|
      format.html # _sign_in_dialog.html.erb
      format.xml  { render :xml => @technique_type }
    end
  end

  # GET /technique_types/1/edit
  def edit
    @technique_type = TechniqueType.find(params[:id])
  end

  # POST /technique_types
  # POST /technique_types.xml
  def create
    @technique_type = TechniqueType.new(params[:technique_type])

    respond_to do |format|
      if @technique_type.save
        format.html { redirect_to([:admin, @technique_type], :notice => 'Technique type was successfully created.') }
        format.xml  { render :xml => @technique_type, :status => :created, :location => @technique_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @technique_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /technique_types/1
  # PUT /technique_types/1.xml
  def update
    @technique_type = TechniqueType.find(params[:id])

    respond_to do |format|
      if @technique_type.update_attributes(params[:technique_type])
        format.html { redirect_to([:admin, @technique_type], :notice => 'Technique type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technique_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technique_types/1
  # DELETE /technique_types/1.xml
  def destroy
    @technique_type = TechniqueType.find(params[:id])
    @technique_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_technique_types_url) }
      format.xml  { head :ok }
    end
  end
end
