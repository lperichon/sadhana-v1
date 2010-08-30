class ContactsController < UserApplicationController
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = current_user.contacts.paginate :page => params[:page], :per_page => 9

    respond_to do |format|
      format.html { } # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end
end
