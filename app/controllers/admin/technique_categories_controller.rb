class Admin::TechniqueCategoriesController < AdminApplicationController
  # GET /technique_types
  # GET /technique_types.xml
  def index
    @technique_categories = TechniqueCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @technique_categories }
    end
  end

  # GET /technique_categories/1
  # GET /technique_categories/1.xml
  def show
    @technique_category = TechniqueCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technique_category }
    end
  end

  # GET /technique_categories/new
  # GET /technique_categories/new.xml
  def new
    @technique_category = TechniqueCategory.new

    respond_to do |format|
      format.html # _sign_in_dialog.html.erb
      format.xml  { render :xml => @technique_category }
    end
  end

  # GET /technique_categories/1/edit
  def edit
    @technique_category = TechniqueCategory.find(params[:id])
  end

  # POST /technique_categories
  # POST /technique_categories.xml
  def create
    @technique_category = TechniqueCategory.new(params[:technique_category])

    respond_to do |format|
      if @technique_category.save
        format.html { redirect_to([:admin, @technique_category], :notice => 'Technique category was successfully created.') }
        format.xml  { render :xml => @technique_category, :status => :created, :location => @technique_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @technique_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /technique_categories/1
  # PUT /technique_categories/1.xml
  def update
    @technique_category = TechniqueCategory.find(params[:id])

    respond_to do |format|
      if @technique_category.update_attributes(params[:technique_category])
        format.html { redirect_to([:admin, @technique_category], :notice => 'Technique category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technique_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technique_categories/1
  # DELETE /technique_categories/1.xml
  def destroy
    @technique_category = TechniqueCategory.find(params[:id])
    @technique_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_technique_categories_url) }
      format.xml  { head :ok }
    end
  end
end
