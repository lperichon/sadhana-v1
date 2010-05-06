class TechniquesController < UserApplicationController
  # GET /practices
  # GET /practices.xml
  def index
    @technique_type = TechniqueType.find_by_symbol(params[:symbol])
    @techniques = @technique_type.techniques

    respond_to do |format|
      format.js {}
    end
  end
end