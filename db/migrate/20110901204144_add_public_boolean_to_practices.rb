class AddPublicBooleanToPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :public, :boolean
  end

  def self.down
    remove_column :practices, :public
  end
end
