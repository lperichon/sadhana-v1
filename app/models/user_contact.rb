class UserContact < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact, :class_name => 'User'
end