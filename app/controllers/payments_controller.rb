class PaymentsController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  skip_before_filter :verify_authenticity_token

  def paypal_ipn
    notify = Paypal::Notification.new(request.raw_post)

    subscription = Subscription.find(params['custom'])

    if notify.acknowledge
      begin

        if notify.complete?
          if subscription.balance == notify.amount
            subscription.charge_manual_balance
          else
            subscription.balance -= notify.amount
            subscription.save
          end

        else
          logger.error("Failed to verify Paypal's notification, please investigate")
        end

      rescue => e
        raise
      end
    end

    render :nothing
  end
end