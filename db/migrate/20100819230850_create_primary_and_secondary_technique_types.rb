class CreatePrimaryAndSecondaryTechniqueTypes < ActiveRecord::Migration
  def self.up
    add_column :parts, :technique_type_id, :integer
    create_table :parts_technique_types, :id => false do |t|
      t.references :part
      t.references :technique_type
    end
  end

  def self.down
    remove_column :parts, :primary_technique_type_id
    drop_table :parts_technique_types
  end
end
