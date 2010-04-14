class CreatePracticeTechniques < ActiveRecord::Migration
  def self.up
    create_table :practice_techniques do |t|
      t.integer :practice_id
      t.integer :technique_id

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_techniques
  end
end
