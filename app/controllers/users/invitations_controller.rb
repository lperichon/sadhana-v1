class Users::InvitationsController < Devise::InvitationsController
  # POST /resource/invitation
  def create
    self.resource = resource_class.send_invitation(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions
      add_to_contacts
      redirect_to :back
    elsif resource.errors[:email].present? && resource.id.present?
      set_flash_message :notice, :user_exists
      add_to_contacts
      redirect_to :back
    else
      render_with_scope :new
    end
  end

  def add_to_contacts
    unless current_user.contacts.include?(self.resource)
      current_user.contacts << self.resource
      current_user.save
    end
    flash.now[:notice] << ' ' + t('users.invitations.invite_another', :new_invitation_link => self.class.helpers.link_to_function(t('users.invitations.invite_another_link'),"$('#new_invitation_dialog').dialog('open')"))
  end
end
