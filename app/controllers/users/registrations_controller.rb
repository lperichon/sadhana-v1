class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :set_locale

  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
    else
      clean_up_passwords(resource)
    end
  end

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end