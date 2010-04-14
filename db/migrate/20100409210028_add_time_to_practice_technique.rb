class AddTimeToPracticeTechnique < ActiveRecord::Migration
  def self.up
    add_column :practice_techniques, :minutes, :integer
    add_column :practice_techniques, :seconds, :integer
    add_column :practice_techniques, :compensate, :boolean
  end

  def self.down
    remove_column :practice_techniques, :compensate
    remove_column :practice_techniques, :seconds
    remove_column :practice_techniques, :minutes
  end
end
