class CreateTechniqueCategories < ActiveRecord::Migration
  def self.up
    create_table :technique_categories do |t|
      t.integer :code
    end
    create_table :technique_category_translations do |t|
      t.references :technique_category
      t.string :locale
      t.string :name
      t.timestamps
    end
    add_index :technique_category_translations, [:technique_category_id, :locale], :unique => true
    add_column :techniques, :technique_category_id, :integer
  end

  def self.down
    remove_column :techniques, :technique_category_id
    drop_table :technique_category_translations
    drop_table :technique_categories
  end
end
