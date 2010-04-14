class CreatePracticeTechniqueAssociatedTechniques < ActiveRecord::Migration
  def self.up
    create_table :practice_techniques_techniques, :id => false do |t|
      t.integer :practice_technique_id
      t.integer :technique_id
    end
  end

  def self.down
    drop_table :practice_techniques_techniques
  end
end
