class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :set_locale, :only => :edit
end