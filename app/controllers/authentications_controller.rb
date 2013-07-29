class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      # when there is an authentication for that provider and uid
      flash[:notice] = t('authentications.create.signin_successful')
      # link contacts
      if(session["invited-by"])
        user = User.find(session["invited-by"])
        authentication.user.add_to_contacts(user, true, true)
      end

      # sign in automatically
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      # else if there is a signed in user create the authentication
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
      # and link contacts
      if(session["invited-by"])
        user = User.find(session["invited-by"])
        current_user.add_to_contacts(user, true, true)
      end
      flash[:notice] = t('authentications.create.authentication_successful')
      redirect_to practices_path
    else
      # else create a new user with the authentication and the contact
      user = User.new(:invited_by => session["invited-by"])
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = t('authentications.create.signin_successful')
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url(:invited_by => user.invited_by)
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = t('authentications.destroy.notice')
    redirect_to :back
  end
end