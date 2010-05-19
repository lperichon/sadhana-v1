class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # Sets the locale for the current request.
  def set_locale
    # I18n.default_locale returns the current default locale. Defaults to 'en-US'
    locale = (current_user.locale.to_sym if current_user.locale.present?) || session[:locale] || I18n.default_locale
    Rails.logger.debug 'Setting locale to ' + locale.to_s
    locale = I18n.backend.available_locales.include?(locale) ? locale : I18n.default_locale

    session[:locale] = I18n.locale = locale
  end
end
