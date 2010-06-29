class AddInvitableToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :invitation_token, :limit => 20
      t.datetime :invitation_sent_at
      t.index :invitation_token
    end

    # Allow null encrypted_password and password_salt
    change_column :users, :encrypted_password, :string, :null => true
    change_column :users, :password_salt, :string, :null => true
  end

  def self.down
  end
end
