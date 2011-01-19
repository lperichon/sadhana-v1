class FacebookContactsController < UserApplicationController
  include Facebooker2::Rails::Controller
  layout 'popup'

  def index
  end
end