class UserApplicationController < ApplicationController
  before_filter :authenticate_user!

  analytical :modules=>[:console, :google, :kiss_metrics], :use_session_store=>true
end