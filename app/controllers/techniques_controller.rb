class TechniquesController < UserApplicationController
  # GET /techniques
  # GET /techniques.xml
  def index
    @technique_type = TechniqueType.find_by_symbol(params[:symbol])
    @techniques = @technique_type.techniques

    respond_to do |format|
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