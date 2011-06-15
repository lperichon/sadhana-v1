class Users::ConfirmationsController < Devise::RegistrationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)

      analytical.event 'Confirmed'
    else
      render_with_scope :new
    end
  end
end