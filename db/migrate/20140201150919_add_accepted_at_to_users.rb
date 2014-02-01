class AddAcceptedAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :invitation_accepted_at, :datetime
  end

  def self.down
    remove_column :users, :invitation_accepted_at
  end
end
