class CreateBandhas < ActiveRecord::Migration
  def self.up
    bandhas = TechniqueType.create(:symbol => 'bandhas')
    bandhas.translations_attributes = [{:locale => 'en', :name => 'Bandhas'}, {:locale => 'es', :name => 'Bandhas'}]
    bandhas.save

    mula = Technique.create!(:name => 'múla bandha', :technique_type => bandhas)
    uddiyana = Technique.create!(:name => 'uddiyana bandha', :technique_type => bandhas)
    jalandhara = Technique.create!(:name => 'jalandhara bandha', :technique_type => bandhas)
    jihva = Technique.create!(:name => 'jíhva bandha', :technique_type => bandhas)

    asana = Part.find_by_symbol('asana')
    asana.secondary_technique_types += ", .bandhas"
    asana.save
  end

  def self.down
  end
end
