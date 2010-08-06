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

  # DELETE /practice_techniques/1
  def destroy
    @practice = current_user.practices.find(params[:practice_id])
    @practice_part = @practice.practice_parts.find(params[:id])
    @practice_part.destroy

    respond_to do |format|
      format.js { }
    end
  end

  def sort
    @practice = current_user.practices.find(params[:practice_id])
    params[:practice_part].each_with_index do |id, index|
      @practice.practice_parts.update_all(['position=?', index+1], ['id=?', id])
    end
    respond_to do |format|
      format.js { }
    end
  end
end