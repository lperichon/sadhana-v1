class AddSymbolToTechniqueTypes < ActiveRecord::Migration
  def self.up
    add_column :technique_types, :symbol, :string
  end

  def self.down
    remove_column :technique_types, :symbol
  end
end
