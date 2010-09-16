class ChangeConsumerColumnsToText < ActiveRecord::Migration
  def self.up
    change_column :users, :google_consumer, :text
    change_column :users, :yahoo_consumer, :text
  end

  def self.down
  end
end
