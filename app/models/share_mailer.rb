class ShareMailer < ActionMailer::Base
  layout "mail"

  def share_notification(practice, user)
    @user = user
    @practice = practice
    mail(:from => practice.user.email,
         :to => user.email,
         :subject => t('share_mailer.share_notification.subject'))
  end
end