class Dhyana < ActiveRecord::Migration
  def self.up
    dhyana_tt = TechniqueType.create(:symbol => 'dhyana')
    dhyana_tt.translations_attributes = [{:locale => 'en', :name => 'Dhyána'}, {:locale => 'es', :name => 'Dhyána'}]
    dhyana_tt.save

    yantra = Technique.create!(:name => 'Yantra dhyána', :technique_type => dhyana_tt)
    yantra_om = Technique.create!(:name => 'Yantra dhyána (ÔM)', :technique_type => dhyana_tt, :parent => yantra)
    yantra_ashtanga = Technique.create!(:name => 'Yantra dhyána (Ashtánga)', :technique_type => dhyana_tt, :parent => yantra)
    mantra = Technique.create!(:name => 'Mantra dhyána', :technique_type => dhyana_tt)
    yantra_mantra = Technique.create!(:name => 'Yantra-mantra dhyána', :technique_type => dhyana_tt)
    tantra = Technique.create!(:name => 'Tantra Dhyána', :technique_type => dhyana_tt)

    part = Part.find_by_symbol('samyama')
    part.technique_type = dhyana_tt
    asana = TechniqueType.find_by_symbol('asana')
    drishti = TechniqueType.find_by_symbol('drishti')
    part.technique_types << drishti
    part.technique_types << asana
    part.save
  end

  def self.down
  end
end
