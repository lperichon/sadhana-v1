class FixDescriptionColumn < ActiveRecord::Migration
  def self.up
    change_column :technique_translations, :description, :text
  end

  def self.down
  end
end
