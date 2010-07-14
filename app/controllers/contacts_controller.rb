class ContactsController < UserApplicationController
  layout 'popup'
  skip_before_filter :verify_authenticity_token, :only => :create
  def index
    if params[:provider].present?
      provider = params[:provider].to_sym
      consumer = Contacts.new(provider)
      url = consumer.authentication_url('http://local.sadhana.com.ar/contacts')
      session[:consumer] = consumer.serialize
      session[:provider] = provider
      redirect_to url
    else
      provider = session[:provider]
      consumer = Contacts.deserialize_consumer(provider, session[:consumer])
      if consumer.authorize(params)
        Rails.logger.debug 'consumer authorized, listing contacts'
        @contacts = consumer.contacts
      else
        # handle error
      end
    end
  end

  # Windows Live posts to return url
  def create
    provider = session[:provider]
    consumer = Contacts.deserialize_consumer(provider, session[:consumer])
    @contacts = consumer.contacts(params)

    render :action => :index
  end
end