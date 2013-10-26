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
            subscription.manual_charge_balance
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

  def stripe_webhook
    data_json = JSON.parse request.body.read

    event = Stripe::Event.retrieve(data_json['id'])

    subscription = Subscription.find_by_stripe_customer_token(event.data.object.customer)

    if event.type == "invoice.payment_succeeded"
      subscription.active
    end

    if event.type == "invoice.payment_failed"
      subscription.past_due
    end

    render :nothing
  end
end