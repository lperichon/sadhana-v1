class FacebookContactsController < UserApplicationController
  include Facebooker2::Rails::Controller
  layout 'popup'
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
  end

  def create
    flash[:notice] = t('facebook_contacts.create.success')
    redirect_to facebook_contacts_path
  end
end