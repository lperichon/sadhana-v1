class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  private

  # Sets the locale for the current request.
  def set_locale
    # I18n.default_locale returns the current default locale. Defaults to 'en-US'
    begin
      # find the request's country and use that to set locale
      geolocalized_country_code = I18nData.country_code(request.location.country)
      case(geolocalized_country_code)
        when "AR", "ES"
          geolocale = :es
        when "BR", "PT"
          geolocale = :pt
        when "US", "UK"
          geolocale = :en
      end
      locale = params[:locale] || (session[:locale] unless(session[:locale].blank? || user_signed_in?)) || (current_user.locale.to_sym if user_signed_in? && current_user.locale.present?) || geolocale || I18n.default_locale
    rescue
      locale = :en
    end

    locale = I18n.backend.available_locales.include?(locale.to_sym) ? locale : I18n.default_locale
    session[:locale] = I18n.locale = locale
  end
end
