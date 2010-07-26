class CreateParts < ActiveRecord::Migration
  def self.up
     create_table :parts do |t|
     end

    create_table(:part_translations) do |t|
      t.references :part
      t.string :locale

      t.string :name

      t.timestamps
    end
    add_index :part_translations, [:part_id, :locale], :unique => true

  end

  def self.down
    drop_table :part_translations
    drop_table :parts
  end
end
