class Users::InvitationsController < Devise::InvitationsController
  after_filter :invite_another_msg, :only => :create

  def invite_another_msg
    flash.now[:notice] << ' ' + t('users.invitations.invite_another', :new_invitation_link => self.class.helpers.link_to_function(t('users.invitations.invite_another_link'),"$('#new_invitation_dialog').dialog('open')"))
  end
end
