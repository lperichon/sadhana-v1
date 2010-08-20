class CreatePuja < ActiveRecord::Migration
  def self.up
    puts 'creating bandhas'
    bandhas = TechniqueType.create(:symbol => 'bandhas')
    bandhas.translations_attributes = [{:locale => 'en', :name => 'Bandhas'}, {:locale => 'es', :name => 'Bandhas'}]
    bandhas.save

    mula = Technique.create!(:name => 'múla bandha', :technique_type => bandhas)
    uddiyana = Technique.create!(:name => 'uddiyana bandha', :technique_type => bandhas)
    jalandhara = Technique.create!(:name => 'jalandhara bandha', :technique_type => bandhas)
    jihva = Technique.create!(:name => 'jíhva bandha', :technique_type => bandhas)

    puts 'updating asana'
    asana = Part.find_by_symbol('asana')
    asana.technique_types << bandhas
    asana.save

    puts 'creating puja'
    puja = TechniqueType.create(:symbol => 'puja')
    puja.translations_attributes = [{:locale => 'en', :name => 'Pújá'}, {:locale => 'es', :name => 'Pújá'}]
    puja.save

    bhavana = Technique.create!(:name => 'Bhavana pújá', :technique_type => puja)
    guru = Technique.create!(:name => 'Guru pújá', :technique_type => puja)
    satguru = Technique.create!(:name => 'Satguru pújá', :technique_type => puja)
    shiva = Technique.create!(:name => 'Shiva pújá', :technique_type => puja)

    puts 'updating puja'
    part = Part.find_by_symbol('puja')
    part.technique_type = puja
    asana = TechniqueType.find_by_symbol('asana')
    part.technique_types << asana
    part.save
  end

  def self.down
  end
end