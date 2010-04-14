class CreateTechniques < ActiveRecord::Migration
  def self.up
    create_table :techniques do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :techniques
  end
end
