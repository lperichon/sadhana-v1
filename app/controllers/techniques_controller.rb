class TechniquesController < UserApplicationController
  # GET /techniques
  # GET /techniques.xml
  def index
    @technique_type = TechniqueType.find_by_symbol(params[:symbol])

    if @technique_type && params[:category_id].blank?
      @techniques = @technique_type.techniques.where("parent_id IS NULL")
    elsif @technique_type && params[:category_id].present?
      @technique_category = TechniqueCategory.find(params[:category_id])
      @techniques = @technique_category.techniques
    else
      @techniques = []
    end

    respond_to do |format|
      format.html { render :partial => 'techniques_list', :locals => {:technique_type => @technique_type, :techniques => @techniques}, :layout => false}
      format.js {}
    end
  end

  # GET /techniques/1
  # GET /techniques/1.xml
  def show
    @technique = Technique.find(params[:id])

    respond_to do |format|
      format.js {}
    end
  end
end