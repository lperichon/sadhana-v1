class AddParentIdToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :parent_id, :integer
  end

  def self.down
    remove_column :techniques, :parent_id
  end
end
