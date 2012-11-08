class AddInvitedByColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invited_by_id, :integer
  end
end
