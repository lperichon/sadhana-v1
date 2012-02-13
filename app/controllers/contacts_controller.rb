class ContactsController < UserApplicationController
  # GET /contacts
  # GET /contacts.xml
  layout 'application', :except => :select


  def select
    @contacts = current_user.contacts
    render :action => :select, :layout => 'popup'
  end

  def index
    @contacts = current_user.contacts.page(params[:page]).per(5)
    respond_to do |format|
      format.html { } # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    contact = current_user.contacts.find(params[:id])
    current_user.contacts.delete contact

    respond_to do |format|
      format.xml  { head :ok }
      format.json { render :json => :ok }
    end
  end
end
