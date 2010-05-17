class UserApplicationController < ApplicationController
  before_filter :authenticate_user!

  before_filter :set_locale
end