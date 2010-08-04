class FixParents < ActiveRecord::Migration
  def self.up
    mudra = TechniqueType.find_by_symbol('mudra')
    mudra.techniques.each do |t|
      t.parent = nil
      t.save
    end

    manos = TechniqueType.find_by_symbol('manos')
    manos.techniques.each do |t|
      t.parent = nil
      t.save
    end
  end

  def self.down
  end
end
