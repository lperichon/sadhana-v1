class AddPositionToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :position, :integer
  end

  def self.down
    remove_column :practices, :position
  end
end
