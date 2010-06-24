class CreateTechniqueTypeTranslations < ActiveRecord::Migration
  def self.up 
    create_table(:technique_type_translations) do |t|
      t.references :technique_type
      t.string :locale

      t.string :name

      t.timestamps
    end
    add_index :technique_type_translations, [:technique_type_id, :locale], :unique => true
  end

  def self.down
    drop_table :technique_type_translations
  end
end

