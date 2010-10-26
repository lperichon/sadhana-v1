class Users::InvitationsController < Devise::InvitationsController
  # POST /resource/invitation
  def create
    self.resource = resource_class.send_invitation(params[resource_name])

    if resource.errors.empty?
      flash.now[:notice] = I18n.t(:"#{:user}.#{:send_instructions}", :resource_name => :user, :scope => [:devise, :invitations], :default => :send_instructions)
      add_to_contacts(resource,true)
    elsif resource.errors[:email].present? && resource.id.present?
      resource.errors.clear
      flash.now[:notice] = I18n.t(:"#{:user}.#{:user_exists}", :resource_name => :user, :scope => [:devise, :invitations], :default => :user_exists)
      add_to_contacts(resource)
    end
  end

  def add_to_contacts(user, corresponded = false)
    current_user.add_to_contacts(user, corresponded)
    flash.now[:notice] << ' ' + t('users.invitations.invite_another', :new_invitation_link => self.class.helpers.link_to_function(t('users.invitations.invite_another_link'),"$('#new_invitation_dialog').dialog('open')"))
  end
end
