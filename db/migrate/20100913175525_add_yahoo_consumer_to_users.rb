class AddYahooConsumerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :yahoo_consumer, :string
  end

  def self.down
    remove_column :users, :yahoo_consumer
  end
end
