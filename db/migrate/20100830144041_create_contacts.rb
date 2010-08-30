class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :user_contacts, :id => false do |t|
      t.integer :user_id
      t.integer :contact_id
    end
  end

  def self.down
    drop_table :user_contacts
  end
end
