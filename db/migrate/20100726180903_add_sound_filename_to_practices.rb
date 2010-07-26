class AddSoundFilenameToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :sound_filename, :string
  end

  def self.down
    remove_column :practices, :sound_filename
  end
end
