class Users::RegistrationsController < Devise::RegistrationsController

  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
    else
      clean_up_passwords(resource)
    end
  end
end