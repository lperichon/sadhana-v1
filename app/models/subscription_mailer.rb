class SubscriptionMailer < ActionMailer::Base
  layout "mail"
    
  def trial_expiring(subscription)
    setup_email(subscription)
    @subject += "Your trial is ending soon"
  end
  
  def charge_success(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Service invoice"
  end
  
  def charge_failure(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Billing error" 
  end      
  
  def second_charge_failure(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Second notice: Your subscription is set to expire"
  end
  
  def credit_success(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Credit"
  end
  
  def subscription_expired(subscription)
    setup_email(subscription)
    @subject += t('saas.subscription_expired.subject')
  end
  
  # def admin_report(admin, activity_log)
  #   @subject    = "Example app: Subscription admin report"
  #   @recipients = admin
  #   @from       = "billing@example.com"
  #   @sent_on    = Time.now
  #   @body[:log] = activity_log
  # end
  
  protected
  
  def setup_email(subscription, transaction=nil)
    @recipients          = subscription.subscriber.email
    @from                = Devise.mailer_sender
    @subject             = "Sádhana: "
    @sent_on             = Time.now
    @body[:transaction]  = transaction
    @body[:subscription] = subscription
    @body[:user]         = subscription.subscriber
    @bcc                 = SubscriptionConfig.admin_report_recipients if SubscriptionConfig.admin_report_recipients
  end
end
