class PracticeTechniquesController < UserApplicationController
  # GET /practice_techniques
  # GET /practice_techniques.xml
  def index
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_techniques = @practice_part.practice_techniques

    respond_to do |format|
      format.xml  { render :xml => @practice_techniques }
    end
  end

  # GET /practice_techniques/1
  # GET /practice_techniques/1.xml
  def show
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @practice_technique }
    end
  end

  # GET /practice_techniques/new
  # GET /practice_techniques/new.xml
  def new
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.new

    respond_to do |format|
      format.xml  { render :xml => @practice_technique }
    end
  end

  # GET /practice_techniques/1/edit
  def edit
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.find(params[:id])
  end

  # POST /practice_techniques
  # POST /practice_techniques.xml
  def create
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.new(params[:practice_technique])

    respond_to do |format|
      if @practice_technique.save!
        format.xml  { render :xml => @practice_technique, :status => :created, :location => @practice_technique }
        format.json { render :json => { :practice_technique => @practice_technique } }
        format.js { }
      else
        format.xml  { render :xml => @practice_technique.errors, :status => :unprocessable_entity }
        format.json { render :json => {:errors => @practice_technique.errors, :status => :unprocessable_entity }}
        format.js { }
      end
    end
  end

  # PUT /practice_techniques/1
  # PUT /practice_techniques/1.xml
  def update
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.find(params[:id])

    respond_to do |format|
      if @practice_technique.update_attributes(params[:practice_technique])
        format.xml  { head :ok }
        format.js {}
      else
        format.xml  { render :xml => @practice_technique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_techniques/1
  # DELETE /practice_techniques/1.xml
  def destroy
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    @practice_technique = @practice_part.practice_techniques.find(params[:id])
    @practice_technique.destroy

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok}
    end
  end

  def sort
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:practice_part_id])
    params[:practice_technique].each_with_index do |id, index|
      @practice_part.practice_techniques.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
