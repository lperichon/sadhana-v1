class AddUserToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :user_id, :integer
  end

  def self.down
    remove_column :practices, :user_id
  end
end
