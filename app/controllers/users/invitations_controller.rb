class Users::InvitationsController < Devise::InvitationsController
  after_filter :add_to_contacts, :only => :create

  def add_to_contacts
    current_user.contacts << self.resource
    current_user.save
    flash.now[:notice] << ' ' + t('users.invitations.invite_another', :new_invitation_link => self.class.helpers.link_to_function(t('users.invitations.invite_another_link'),"$('#new_invitation_dialog').dialog('open')"))
  end
end
