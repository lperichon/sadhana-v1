require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Signup creates a default subscription" do
    u = User.new(:email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
    u.save

    assert u.subscription.present?
  end
end
