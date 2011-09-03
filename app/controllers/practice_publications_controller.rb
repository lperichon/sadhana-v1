class PracticePublicationsController < UserApplicationController

  # POST /practice_events
  # POST /practice_events.xml
  def create
    unless require_paid_account
      @practice = current_user.practices.find(params[:practice_id])
      @practice.public = true
      @practice.save
    end

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    begin
      @practice = current_user.practices.find(params[:practice_id])
    rescue ActiveRecord::RecordNotFound
      flash.now[:notice] = t('practice_publications.not_owner_notice')
    else
      @practice.public = false
      @practice.save
    end

    respond_to do |format|
      format.js {}
    end
  end

  protected

  def require_paid_account
    if current_user.share_subscription_check(current_user.subscription.plan)
      flash.now[:notice] = t('practice_publications.paid_account_notice', :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
    end
  end
end
