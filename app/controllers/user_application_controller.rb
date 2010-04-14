class UserApplicationController < ApplicationController
  before_filter :authenticate_user!
end