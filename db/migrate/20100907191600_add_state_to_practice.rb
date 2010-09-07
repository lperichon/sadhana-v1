class AddStateToPractice < ActiveRecord::Migration
  def self.up
    add_column :practices, :state, :string, :default => 'created'
  end

  def self.down
    remove_column :practices, :state
  end
end
