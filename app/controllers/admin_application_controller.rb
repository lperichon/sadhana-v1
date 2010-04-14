class AdminApplicationController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!
end