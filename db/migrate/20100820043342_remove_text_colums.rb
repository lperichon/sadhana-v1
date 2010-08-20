class RemoveTextColums < ActiveRecord::Migration
  def self.up
    remove_column :parts, :secondary_technique_types
    remove_column :parts, :primary_technique_type
  end

  def self.down
  end
end
