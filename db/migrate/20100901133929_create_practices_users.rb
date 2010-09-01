class CreatePracticesUsers < ActiveRecord::Migration
  def self.up
    create_table :practices_users, :id => false do |t|
      t.references :user
      t.references :practice
    end
  end

  def self.down
    drop_table :practices_users
  end
end
