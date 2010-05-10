class AddObservationsToPracticeTechniques < ActiveRecord::Migration
  def self.up
    add_column :practice_techniques, :observations, :text
  end

  def self.down
    remove_column :practice_techniques, :observations
  end
end
