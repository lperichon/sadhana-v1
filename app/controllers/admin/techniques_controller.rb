require "csv"

class Admin::TechniquesController < AdminApplicationController
  # GET /techniques
  # GET /techniques.xml
  def index
    @techniques = Technique.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @techniques }
    end
  end

  # GET /techniques/1
  # GET /techniques/1.xml
  def show
    @technique = Technique.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technique }
    end
  end

  # GET /techniques/new
  # GET /techniques/new.xml
  def new
    @technique = Technique.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @technique }
    end
  end

  # GET /techniques/1/edit
  def edit
    @technique = Technique.find(params[:id])
  end

  # POST /techniques
  # POST /techniques.xml
  def create
    @technique = Technique.new(params[:technique])

    respond_to do |format|
      if @technique.save
        format.html { redirect_to([:admin, @technique], :notice => 'Technique was successfully created.') }
        format.xml  { render :xml => @technique, :status => :created, :location => @technique }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @technique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /techniques/1
  # PUT /techniques/1.xml
  def update
    @technique = Technique.find(params[:id])

    respond_to do |format|
      if @technique.update_attributes(params[:technique])
        format.html { redirect_to([:admin, @technique], :notice => 'Technique was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /techniques/1
  # DELETE /techniques/1.xml
  def destroy
    @technique = Technique.find(params[:id])
    @technique.destroy

    respond_to do |format|
      format.html { redirect_to(admin_techniques_url) }
      format.xml  { head :ok }
    end
  end

  def csv_import
    
  end

  def do_csv_import
    n = 0
    buffer = open(params[:import][:file], "UserAgent" => "Ruby-CSVReader").read
    technique_type = TechniqueType.find(params[:import][:technique_type_id])
    CSV.parse(buffer) do |row|
      t = Technique.new
      t.name = row[0]
      t.technique_type = technique_type 
      n = n + 1 if t.save
      GC.start if n%50==0
    end
    redirect_to admin_techniques_url, :notice => "CSV Import Successful,  #{n} new records added to the database"
  end
end
