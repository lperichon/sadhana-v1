class AddContinousBooleanToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :continuous, :boolean
  end

  def self.down
    remove_column :practices, :continuous
  end
end
