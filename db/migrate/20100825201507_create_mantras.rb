class CreateMantras < ActiveRecord::Migration
  def self.up
    mantra_tt = TechniqueType.create(:symbol => 'mantra')
    mantra_tt.translations_attributes = [{:locale => 'en', :name => 'Mantra'}, {:locale => 'es', :name => 'Mantra'}]
    mantra_tt.save

    mantra = Technique.create!(:code => '1', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM jay guru', :description => "ÔM jay guru.
Srí guru.
ÔM jay."}]
    mantra.save

    mantra = Technique.create!(:code => '2', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Bhávajánandají', :description => "Bhávajánandají, Bhávajánandají, Bhávajánandají jaya,
Bhávajánandají, Bhávajánandají, Bhávajánandají ÔM namaha."}]
    mantra.save

    mantra = Technique.create!(:code => '3', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM Shiva, ÔM Shaktí', :description => "ÔM Shiva, ÔM Shaktí, namah Shiva, namah Shaktí."}]
    mantra.save

    mantra = Technique.create!(:code => '4', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Pátañjali ÔM namah Gurují', :description => "Pátañjali ÔM namah Gurují, Pátañjali ÔM namah Gurují."}]
    mantra.save

    mantra = Technique.create!(:code => '5', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Hara, Hara, Shankaráchárya', :description => "Hara, Hara, Shankaráchárya."}]
    mantra.save

    mantra = Technique.create!(:code => '6', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya Krishnaya', :description => "Jaya Krishnaya, jaya Rámakrishnaya,
Rámakrishnaya, jaya Krishnaya jaya."}]
    mantra.save

    mantra = Technique.create!(:code => '7', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya Gurují ÔM Dê', :description => "Jaya Gurují ÔM Dê."}]
    mantra.save

    mantra = Technique.create!(:code => '8', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM Kumara', :description => "ÔM Kumara."}]
    mantra.save

    mantra = Technique.create!(:code => '9', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM namah prêma dêví Gurují', :description => "ÔM namah prêma dêví Gurují (o bien ÔM namah prêma dêva
Gurují, cuando es vocalizado por mujeres.)"}]
    mantra.save

    mantra = Technique.create!(:code => '10', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM namah Kundaliní', :description => "ÔM namah Kundaliní."}]
    mantra.save

    mantra = Technique.create!(:code => '11', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM namah Shivaya', :description => "ÔM namah Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '12', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Namah Shivaya', :description => "Namah Shivaya, namah Shivaya, namah Shivaya.
Namah Shivaya, namah Shivaya, namah Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '13', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Shiva, Shiva, Shiva', :description => "Shiva, Shiva, Shiva, Shiva Shivaya namah ÔM,
Hara, Hara, Hara, Hara, namah Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '14', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM namah Shiva', :description => "ÔM namah Shiva, ÔM namah Shivalinga."}]
    mantra.save

    mantra = Technique.create!(:code => '15', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Shivaya namah ÔM', :description => "Shivaya namah ÔM, Shivaya namah ÔM,
Shivaya namah ÔM, namah Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '16', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Shivaya namah Shiva', :description => "Shivaya namah Shiva, Shivaya namah Shiva,
Shivaya namah Shiva, Shivaya namah Shiva,
Shivaya namah ÔM namaha Shivaya.
Shivaya namah ÔM namaha Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '17', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya Ganêsha', :description => "Jaya Ganêsha, Jaya Ganêsha, Jaya Ganêsha, pahiman.
Srí Ganêsha, Srí Ganêsha, Srí Ganêsha, rakshaman."}]
    mantra.save

    mantra = Technique.create!(:code => '18', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Ganêsha charanam', :description => "Ganêsha charanam, charanam Ganêsha."}]
    mantra.save

    mantra = Technique.create!(:code => '19', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM Shivánanda', :description => "ÔM Shivánanda Guru sat, chit, ánanda."}]
    mantra.save

    mantra = Technique.create!(:code => '20', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Shivánanda', :description => "Shivánanda, Shivánanda, Shivánanda pahiman.
Shivánanda, Shivánanda, Shivánanda rakshaman."}]
    mantra.save

    mantra = Technique.create!(:code => '21', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Hari ÔM', :description => "Hari ÔM, Hari ÔM, Hari, Hari, Hari ÔM."}]
    mantra.save

    mantra = Technique.create!(:code => '22', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Harê Ráma', :description => "Harê Ráma, Harê Ráma, Ráma, Ráma, Harê, Harê.
Harê Krishna, Harê Krishna, Krishna, Krishna, Harê, Harê."}]
    mantra.save

    mantra = Technique.create!(:code => '23', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Sita Rám', :description => "Sita Rám, Rám, Rám, rája Rám, Rám, Rám (2x).
Narayan, Narayan, Narayan (2x)."}]
    mantra.save

    mantra = Technique.create!(:code => '24', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Srí Rám, jaya Rám', :description => "Srí Rám, jaya Rám, jaya, jaya, jaya Rám."}]
    mantra.save

    mantra = Technique.create!(:code => '25', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Chidánand', :description => "Chidánand, Chidánand, Chidánanda ÔM (2x).
Hara Halamê Alamastasá Chidánanda ÔM (2x)."}]
    mantra.save

    mantra = Technique.create!(:code => '26', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya Guru Shiva', :description => "Jaya Guru Shiva, Guru Harê, Guru Rám,
Jagat Guru, param Guru, Sat Guru sham.
ÔM Ádi Guru, Adwaita Guru, Ánanda Guru ÔM
Chit Guru, Chitgana Guru, Chinmaya Guru ÔM."}]
    mantra.save

    mantra = Technique.create!(:code => '27', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Íshwara Harê.', :description => "Íshwara, Íshwara, Íshwara Harê."}]
    mantra.save

    mantra = Technique.create!(:code => '28', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya Shiva, Guru Shiva', :description => "Jaya Shiva, Guru Shiva, jaya Shiva, Guru jaya."}]
    mantra.save

    mantra = Technique.create!(:code => '29', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Samba Sada Shiva', :description => "Samba Sada Shiva (3x). Samba Shiva ÔM Hara.
ÔM Mátá, ÔM Mátá, ÔM Srí Mátá Jagadambá.
Uma Paramêshwarí, Srí Bhuvanêshwarí, Ádi Parashaktí Dêví
Mahêshwarí."}]
    mantra.save

    mantra = Technique.create!(:code => '30', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM namô', :description => "ÔM namô, namah Shivaya, namô, namah Shivaya."}]
    mantra.save

    mantra = Technique.create!(:code => '31', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Gáyatrí Mantra', :description => "ÔM Bhur Bhuvah Swahah, ÔM tat Savitura varênyam.
Bhargô Dêvasya Dhimahi, dhyôyô naha prachôdayatô."}]
    mantra.save

    mantra = Technique.create!(:code => '32', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM jay Gangá', :description => "ÔM jay Gangá.
Srí Gangá.
ÔM jay."}]
    mantra.save

    mantra = Technique.create!(:code => '33', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Ayôdhya vasi Rám', :description => "Ayôdhya vasi Rám, Rám, Rám,
Dasharata ánandanaram.
Pathita pavana janaki Jivana
Sita môhana Rám."}]
    mantra.save

    mantra = Technique.create!(:code => '34', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'Jaya guru Ômkára', :description => "Jaya guru Ômkára, jaya, jaya,
Satguru Ômkára, ÔM.
Brahma, Vishnu, Sadáshiva,
Hara, Hara, Hara, Hara, Mahádêva."}]
    mantra.save

    mantra = Technique.create!(:code => 'lam', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'LAM'}]
    mantra.save

    mantra = Technique.create!(:code => 'vam', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'VAM'}]
    mantra.save

    mantra = Technique.create!(:code => 'ram', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'RAM'}]
    mantra.save

    mantra = Technique.create!(:code => 'yam', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'YAM'}]
    mantra.save

    mantra = Technique.create!(:code => 'ham', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'HAM'}]
    mantra.save

    mantra = Technique.create!(:code => 'om', :technique_type => mantra_tt)
    mantra.translations_attributes = [{:locale => 'en', :name => 'ÔM'}]
    mantra.save
    
    part = Part.find_by_symbol('mantra')
    part.technique_type = mantra_tt
    asana = TechniqueType.find_by_symbol('asana')
    part.technique_types << asana
    part.save
  end

  def self.down
  end
end
