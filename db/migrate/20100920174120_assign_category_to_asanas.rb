class AssignCategoryToAsanas < ActiveRecord::Migration
  def self.up
    asana = TechniqueType.find_by_symbol('asana')
    asana.techniques.each do |t|
      code = t.code.gsub(/^\d*/).first.to_i.to_s
      technique_category = TechniqueCategory.find_by_code(code)
      t.technique_category = technique_category
      t.save
    end
  end

  def self.down
  end
end
