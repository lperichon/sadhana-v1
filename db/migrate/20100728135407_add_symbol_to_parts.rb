class AddSymbolToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :symbol, :string
  end

  def self.down
    remove_column :parts, :symbol
  end
end
