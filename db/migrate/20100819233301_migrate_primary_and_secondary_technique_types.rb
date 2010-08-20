class MigratePrimaryAndSecondaryTechniqueTypes < ActiveRecord::Migration
  def self.up
    Part.all.each do |p|
      p.technique_type = TechniqueType.find_by_symbol(p.primary_technique_type.gsub(/\./,''))
      p.secondary_technique_types.gsub(/\./, '').split(',').each do |symbol|
        p.technique_types << TechniqueType.find_by_symbol(symbol.strip)
      end
      p.save
    end
  end

  def self.down
  end
end
