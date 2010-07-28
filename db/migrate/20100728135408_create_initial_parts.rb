class CreateInitialParts < ActiveRecord::Migration
  def self.up
    mudra = Part.create(:symbol => 'mudra')
    mudra.translations_attributes = [{:locale => 'en', :name => 'Mudrá'}, {:locale => 'es', :name => 'Mudrá'}]
    mudra.save

    puja = Part.create(:symbol => 'puja')
    puja.translations_attributes = [{:locale => 'en', :name => 'Pújá'}, {:locale => 'es', :name => 'Pújá'}]
    puja.save

    mantra = Part.create(:symbol => 'mantra')
    mantra.translations_attributes = [{:locale => 'en', :name => 'Mantra'}, {:locale => 'es', :name => 'Mantra'}]
    mantra.save

    pranayama = Part.create(:symbol => 'pranayama')
    pranayama.translations_attributes = [{:locale => 'en', :name => 'Pránáyáma'}, {:locale => 'es', :name => 'Pránáyáma'}]
    pranayama.save

    kriya = Part.create(:symbol => 'kriya')
    kriya.translations_attributes = [{:locale => 'en', :name => 'Kriyá'}, {:locale => 'es', :name => 'Kriyá'}]
    kriya.save

    asana = Part.create(:symbol => 'asana')
    asana.translations_attributes = [{:locale => 'en', :name => 'Ásana'}, {:locale => 'es', :name => 'Ásana'}]
    asana.save

    yoganidra = Part.create(:symbol => 'yoganidra')
    yoganidra.translations_attributes = [{:locale => 'en', :name => 'Yôganidrá'}, {:locale => 'es', :name => 'Yôganidrá'}]
    yoganidra.save

    samyama = Part.create(:symbol => 'samyama')
    samyama.translations_attributes = [{:locale => 'en', :name => 'Samyama'}, {:locale => 'es', :name => 'Samyama'}]
    samyama.save
  end

  def self.down
    Part.destroy_all
  end
end
