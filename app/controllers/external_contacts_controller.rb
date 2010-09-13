class ExternalContactsController < UserApplicationController
  layout 'popup'
  skip_before_filter :verify_authenticity_token, :only => :create
  def index
    if params[:provider].present? && (!current_user.respond_to?("#{params[:provider]}_consumer") || current_user.send("#{params[:provider]}_consumer").nil?)
      provider = params[:provider].to_sym
      consumer = Contacts.new(provider)
      url = consumer.authentication_url(url_for :controller => 'external_contacts', :action => 'index')
      session[:consumer] = consumer.serialize
      session[:provider] = provider
      redirect_to url
    else
      provider = (params[:provider] || session[:provider]).to_sym
      if session[:consumer].present?
        consumer = Contacts.deserialize_consumer(provider, session[:consumer])
      elsif current_user.respond_to?("#{provider}_consumer") && current_user.send("#{provider}_consumer").present?
        consumer = Contacts.deserialize_consumer(provider, current_user.send("#{provider}_consumer"))
      end

      if consumer.authorize(params)
        Rails.logger.debug 'consumer authorized, listing external_contacts'
        session[:consumer] = consumer.serialize
        if current_user.respond_to?("#{provider}_consumer")
          current_user.send("#{provider}_consumer=", consumer.serialize)
          current_user.save!
        end
        @contacts = consumer.contacts
      else
        Rails.logger.debug 'consumer not authorized'
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