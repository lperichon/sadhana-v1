class Users::InvitationsController < Devise::InvitationsController
  after_filter :add_to_contacts, :only => :create

  # POST /resource/invitation
  def create
    self.resource = resource_class.send_invitation(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions
      redirect_to :back
    else
      render_with_scope :new
    end
  end

  def add_to_contacts
    current_user.contacts << self.resource
    current_user.save
    flash.now[:notice] << ' ' + t('users.invitations.invite_another', :new_invitation_link => self.class.helpers.link_to_function(t('users.invitations.invite_another_link'),"$('#new_invitation_dialog').dialog('open')"))
  end
end
