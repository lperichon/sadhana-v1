class AddPrimaryAndSecondaryTechniqueTypesToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :primary_technique_type, :string
    add_column :parts, :secondary_technique_types, :string
  end

  def self.down
    remove_column :parts, :primary_technique_type
    remove_column :parts, :secondary_technique_types
  end
end
