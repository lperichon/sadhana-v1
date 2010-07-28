class CreatePartsForExistingPractices < ActiveRecord::Migration
  def self.up
    asana = Part.find_by_symbol('asana')
    Practice.all.each do |p|
      unless p.practice_techniques.empty?
        pp = p.practice_parts.create(:part => asana)
        p.practice_techniques.each do |pt|
          pt.practice_part = pp
          pt.save
        end
      end
    end
  end

  def self.down
  end
end
