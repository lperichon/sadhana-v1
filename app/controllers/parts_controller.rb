class PartsController < UserApplicationController
  # GET /parts/1
  # GET /parts/1.xml
  def show
    @part = Part.find_by_symbol(params[:symbol])

    respond_to do |format|
      format.js {}
    end
  end
end