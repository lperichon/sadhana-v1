class CreateTechniqueTranslations < ActiveRecord::Migration
  def self.up
    create_table(:technique_translations) do |t|
      t.references :technique
      t.string :locale

      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :technique_translations, [:technique_id, :locale], :unique => true
  end

  def self.down
    drop_table :technique_translations
  end
end

