class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :set_locale

  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
    else
      clean_up_passwords(resource)
    end
  end
end