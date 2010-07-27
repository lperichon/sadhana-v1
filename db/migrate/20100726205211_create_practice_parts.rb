class CreatePracticeParts < ActiveRecord::Migration
  def self.up
    create_table :practice_parts do |t|
      t.references :practice
      t.references :part

      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_parts
  end
end
