class AddDelayToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :delay, :integer
  end

  def self.down
    remove_column :practices, :delay
  end
end
