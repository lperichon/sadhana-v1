class CreateKriyas < ActiveRecord::Migration
  def self.up
    kriya_tt = TechniqueType.create(:symbol => 'kriya')
    kriya_tt.translations_attributes = [{:locale => 'en', :name => 'Kriyá'}, {:locale => 'es', :name => 'Kriyá'}]
    kriya_tt.save

    kap = Technique.create!(:name => 'Kapálabhati', :technique_type => kriya_tt)
    trat = Technique.create!(:name => 'Trátaka', :technique_type => kriya_tt)
    nauli = Technique.create!(:name => 'Nauli', :technique_type => kriya_tt)
    agni = Technique.create!(:name => 'Agnisára dhauti', :technique_type => kriya_tt)

    drishti_tt = TechniqueType.create(:symbol => 'drishti')
    drishti_tt.translations_attributes = [{:locale => 'en', :name => 'Drishti'}, {:locale => 'es', :name => 'Drishti'}]
    drishti_tt.save
    nasagra = Technique.create!(:name => 'Naságra drishti', :technique_type => drishti_tt)
    bhrumadhya = Technique.create!(:name => 'Bhrúmadhya drishti', :technique_type => drishti_tt)
    shakti = Technique.create!(:name => 'Shakti / Shakta drishti', :technique_type => drishti_tt)
    guru = Technique.create!(:name => 'Guru drishti', :technique_type => drishti_tt)
    agni = Technique.create!(:name => 'Agni drishti', :technique_type => drishti_tt)
    taraka = Technique.create!(:name => 'Táraka drishti', :technique_type => drishti_tt)
    chandra = Technique.create!(:name => 'Chandra drishti', :technique_type => drishti_tt)
    surya = Technique.create!(:name => 'Súrya drishti', :technique_type => drishti_tt)

    part = Part.find_by_symbol('kriya')
    part.technique_type = kriya_tt
    asana = TechniqueType.find_by_symbol('asana')
    part.technique_types << drishti_tt
    part.technique_types << asana
    part.save
  end

  def self.down
  end
end
