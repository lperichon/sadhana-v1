class AddPracticePartToPracticeTechnique < ActiveRecord::Migration
  def self.up
    add_column :practice_techniques, :practice_part_id, :integer
  end

  def self.down
    remove_column :practice_techniques, :practice_part_id
  end
end
