class AddPositionToPracticeTechniques < ActiveRecord::Migration
  def self.up
    add_column :practice_techniques, :position, :integer
  end

  def self.down
    remove_column :practice_techniques, :position
  end
end
