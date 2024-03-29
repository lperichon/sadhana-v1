#!/bin/env ruby
# encoding: utf-8

class SubscriptionMailer < ActionMailer::Base
  layout "mail"
    
  def trial_expiring(subscription)
    setup_email(subscription)
    @subject += "Your trial is ending soon"

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end

  def subscription_expiring(subscription)
    setup_email(subscription)
    @subject += t('saas.subscription_expiring.subject')

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end
  
  def charge_success(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Service invoice"

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end
  
  def charge_failure(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Billing error"

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end      
  
  def second_charge_failure(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Second notice: Your subscription is set to expire"

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end
  
  def credit_success(subscription, transaction)
    setup_email(subscription, transaction)
    @subject += "Credit"

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
  end
  
  def subscription_expired(subscription)
    setup_email(subscription)
    @subject += t('saas.subscription_expired.subject')

    mail(:from => @from,
         :to => @recipients,
         :subject => @subject)
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
