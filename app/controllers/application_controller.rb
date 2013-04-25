class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  before_filter :check_locale

  analytical :modules=>[:console, :google], :use_session_store=>true

  private

  # Sets the locale for the current request.
  def set_locale
    # I18n.default_locale returns the current default locale. Defaults to 'en-US'
    begin
      locale = params[:locale] || (session[:locale] unless(session[:locale].blank? || user_signed_in?)) || (current_user.locale.to_sym if user_signed_in? && current_user.locale.present?) || I18n.default_locale
    rescue
      locale = :en
    end

    locale = I18n.backend.available_locales.include?(locale.to_sym) ? locale : I18n.default_locale
    session[:locale] = I18n.locale = locale
  end

  def check_locale
    Rails.logger.debug "====================>" + I18nData.country_code(request.location.country)
  end
end
