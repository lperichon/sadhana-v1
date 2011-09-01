class SharedPractice < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice
end