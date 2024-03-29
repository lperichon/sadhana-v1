class ExternalContactsController < UserApplicationController
  layout 'popup'
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @provider = (params[:provider] || session[:provider]).to_sym
    if session[:consumer].present?
      consumer = Contacts.deserialize_consumer(@provider, session[:consumer])
    elsif current_user.respond_to?("#{@provider}_consumer") && current_user.send("#{@provider}_consumer").present?
      consumer = Contacts.deserialize_consumer(@provider, current_user.send("#{@provider}_consumer"))
    else
      consumer = Contacts.new(@provider)
    end
    if (params['oauth_verifier'].present? && consumer.authorize(params)) || (consumer.respond_to?(:access_token) && consumer.access_token.present? && consumer.contacts)
      session[:consumer] = nil
      if current_user.respond_to?("#{@provider}_consumer")
        current_user.send("#{@provider}_consumer=", consumer.serialize)
        current_user.save!
      end
      @contacts = consumer.contacts
    else
      if @provider == :yahoo && consumer.respond_to?(:access_token) && consumer.access_token.present?
         consumer = Contacts.new(@provider)
      end
      url = consumer.authentication_url(url_for :controller => 'external_contacts', :action => 'index')
      session[:consumer] = consumer.serialize
      session[:provider] = @provider
      redirect_to url
      return
    end
  end

  # Windows Live posts to return url
  def create
    provider = session[:provider]
    consumer = Contacts.deserialize_consumer(provider, session[:consumer])
    @contacts = consumer.contacts(params)

    render :action => :index
  end

  def destroy
    provider = params[:provider]
    if current_user.respond_to?("#{provider}_consumer")
      current_user.send("#{provider}_consumer=", nil)
      current_user.save!
    end
    flash.now[:notice] = t('external_contacts.access_revoked_notice')
  end
end