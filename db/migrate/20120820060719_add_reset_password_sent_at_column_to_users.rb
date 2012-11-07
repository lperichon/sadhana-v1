class AddResetPasswordSentAtColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :reset_password_sent_at, :datetime
  end
end
