class PracticePublicationsController < UserApplicationController
  before_filter :require_paid_account

  # POST /practice_events
  # POST /practice_events.xml
  def create
    @practice = current_user.practices.find(params[:practice_id])
    @practice.public = true
    @practice.save

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @practice = current_user.practices.find(params[:practice_id])
    @practice.public = false
    @practice.save

    respond_to do |format|
      format.js {}
    end
  end

  protected

  def require_paid_account(no_return = false)
    if current_user.share_subscription_check(current_user.subscription.plan)
      flash.now[:notice] = t('practice_publications.paid_account_notice', :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
      return redirect_to :back unless no_return
    end
  end
end
