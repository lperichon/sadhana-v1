class ContactsController < UserApplicationController
  layout 'popup'
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
        @contacts = consumer.contacts
      else
        # handle error
      end
    end
  end
end