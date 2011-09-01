class CreateSharedPractices < ActiveRecord::Migration
  def self.up
    rename_table :practices_users, :shared_practices
  end

  def self.down
    rename_table :shared_practices, :practices_users
  end
end
