class PracticePartsController < UserApplicationController
  # POST /practice_parts
  def create
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.new(params[:practice_part])

    respond_to do |format|
      if @practice_part.save
        format.js { }
      else
        format.js { }
      end
    end
  end
end