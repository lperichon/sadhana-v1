class AddGoogleConsumerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :google_consumer, :string
  end

  def self.down
    remove_column :users, :google_consumer
  end
end
