class CreateTechniqueTypes < ActiveRecord::Migration
  def self.up
    create_table :technique_types do |t|
      t.string :name
      
      t.timestamps
    end

    add_column :techniques, :technique_type_id, :integer 
  end

  def self.down
    remove_column :techniques, :technique_type_id
    drop_table :technique_types
  end
end
