class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :admins, :email,                :unique => true
    add_index :admins, :reset_password_token, :unique => true
    add_index :admins, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :admins
  end
end
