class PracticeSharesController < UserApplicationController
  before_filter :require_paid_account, :except => :new

  # GET /practice_shares/new
  # GET /practice_shares/new.xml
  def new
    @practice = current_user.practices.find(params[:practice_id])

    respond_to do |format|
      format.js { require_paid_account(true) }
    end
  end

  # POST /practice_events
  # POST /practice_events.xml
  def create
    @practice = current_user.practices.find(params[:practice_id])
    @user = User.send_invitation(params[:user])

    if @user.errors.empty?
      current_user.add_to_contacts(@user, true)
    elsif @user.errors[:email].present? && @user.id.present?
      current_user.add_to_contacts(@user, true)
    end

    unless @user.new_record?
      @practice.share_with(@user)
    end

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @practice = current_user.practices.find(params[:practice_id])
    @user = User.find_by_email(params[:email])
    @practice.viewers.delete @user
  end

  protected

  def require_paid_account(no_return = false)
    if current_user.share_subscription_check(current_user.subscription.plan)
      flash.now[:notice] = t('practice_shares.paid_account_notice', :upgrade_link => self.class.helpers.link_to_function(t('actions.upgrade_now'),"$('#edit_profile_dialog').dialog('open').tabs('select', 1);")).html_safe
      return redirect_to :back unless no_return
    end
  end
end
