module MigrationHelpers
  def assign_as_parent(technique, code)
    Technique.where("code like '#{code}%'").each do |t|
      unless(t == technique || t.id >= 2360)
        t.parent = technique
        t.save
      end
    end
  end
end

class AssignTechniqueParents < ActiveRecord::Migration
  extend MigrationHelpers
  def self.up
    asana = TechniqueType.find_by_symbol('asana')



    kakasana = Technique.find_by_code('37-05')
    assign_as_parent(kakasana, '37-06')
    assign_as_parent(kakasana, '37-07')
    assign_as_parent(kakasana, '37-08')
    assign_as_parent(kakasana, '37-09')
    assign_as_parent(kakasana, '37-10')
    assign_as_parent(kakasana, '37-11')
    assign_as_parent(kakasana, '37-12')

    bhadrasana = Technique.find(196)
    assign_as_parent(bhadrasana, '06-3')
    assign_as_parent(bhadrasana, '06-4')

    bhegasana = Technique.find(2377)
    assign_as_parent(bhegasana, '33-1')
    assign_as_parent(bhegasana, '33-2')
    assign_as_parent(bhegasana, '33-3')
    assign_as_parent(bhegasana, '33-4')
    assign_as_parent(bhegasana, '33-5')

    bhadrasana = Technique.find(196)
    assign_as_parent(bhadrasana, '21-1')
    urdhwa_bhadrasana = Technique.find(207)
    urdhwa_bhadrasana.parent = bhadrasana
    urdhwa_bhadrasana.save
    urdhwa_bhadrasana = Technique.find(202)
    urdhwa_bhadrasana.parent = bhadrasana
    urdhwa_bhadrasana.save

    bhujangasana = Technique.find(2380)
    assign_as_parent(bhujangasana, '32-03')
    assign_as_parent(bhujangasana, '32-04')
    assign_as_parent(bhujangasana, '32-05')
    assign_as_parent(bhujangasana, '32-06')

    chakrasana = Technique.find(2381)
    assign_as_parent(chakrasana, '15-2')
    assign_as_parent(chakrasana, '15-4')
    assign_as_parent(chakrasana, '15-5')
    assign_as_parent(chakrasana, '15-6')
    assign_as_parent(chakrasana, '15-7')
    assign_as_parent(chakrasana, '15-8')

    chalanasana = Technique.find(2382)
    (349..354).each do |id|
      t = Technique.find(id)
      t.parent = chalanasana
      t.save
    end

    dhanurasana = Technique.find(2385)
    assign_as_parent(dhanurasana, '32-10')
    assign_as_parent(dhanurasana, '32-11')
    assign_as_parent(dhanurasana, '32-12')
    assign_as_parent(dhanurasana, '32-13')
    assign_as_parent(dhanurasana, '32-14')

    dharanasana = Technique.find(2386)
    assign_as_parent(dharanasana, '46-1')
    assign_as_parent(dharanasana, '46-2')

    janushirshasana = Technique.create!(:name => 'jánusírshásana', :technique_type => asana, :code => '23-1')
    assign_as_parent(janushirshasana, '23-1')
    assign_as_parent(janushirshasana, '23-2')
    assign_as_parent(janushirshasana, '23-3')
    assign_as_parent(janushirshasana, '23-4')
    assign_as_parent(janushirshasana, '23-5')
    assign_as_parent(janushirshasana, '23-6')
    assign_as_parent(janushirshasana, '27-2')

    shirshasana = Technique.find(2388)
    shirshasana.photo = nil
    shirshasana.code = '45-01'
    shirshasana.save

    assign_as_parent(shirshasana, '45-01')
    assign_as_parent(shirshasana, '45-02')
    assign_as_parent(shirshasana, '45-03')
    assign_as_parent(shirshasana, '45-04')
    assign_as_parent(shirshasana, '45-05')
    assign_as_parent(shirshasana, '45-06')
    assign_as_parent(shirshasana, '45-07')
    assign_as_parent(shirshasana, '45-08')
    assign_as_parent(shirshasana, '45-09')
    assign_as_parent(shirshasana, '45-10')
    assign_as_parent(shirshasana, '45-11')
    assign_as_parent(shirshasana, '45-12')
    assign_as_parent(shirshasana, '45-13')

    dwapada_shirshasana = Technique.create!(:name => 'dwapáda shírshásana', :technique_type => asana, :code => '39-1')
    assign_as_parent(dwapada_shirshasana, '39-1')
    assign_as_parent(dwapada_shirshasana, '39-2')
    assign_as_parent(dwapada_shirshasana, '39-3')
    assign_as_parent(dwapada_shirshasana, '39-4')

    janurdhwa_shirshasana = Technique.create!(:name => 'jánúrdhwa shírshásana', :technique_type => asana, :code => '05-10')
    assign_as_parent(janurdhwa_shirshasana, '05-10')

    upavishta_konasana = Technique.create!(:name => 'upavishta kônásana', :technique_type => asana, :code => '21-3')
    assign_as_parent(upavishta_konasana, '21-3')

    urdhwa_konasana = Technique.create!(:name => 'úrdhwa kônásana', :technique_type => asana, :code => '21-4')
    assign_as_parent(urdhwa_konasana, '21-4')

    prishtakonasana = Technique.create!(:name => 'prishthakônásana', :technique_type => asana, :code => '08-2')
    assign_as_parent(prishtakonasana, '08-2')

    samakonasana = Technique.create!(:name => 'samakônásana', :technique_type => asana, :code => '28-3')
    t = Technique.find(668)
    t.parent = samakonasana
    t.save
    t = Technique.find(669)
    t.parent = samakonasana
    t.save
    t = Technique.find(670)
    t.parent = samakonasana
    t.save
    t = Technique.find(671)
    t.parent = samakonasana
    t.save
    t = Technique.find(679)
    t.parent = samakonasana
    t.save
    t = Technique.find(692)
    t.parent = samakonasana
    t.save
    t = Technique.find(693)
    t.parent = samakonasana
    t.save
    (713..717).each do |id|
      t = Technique.find(id)
      t.parent = samakonasana
      t.save
    end
    (818..824).each do |id|
      t = Technique.find(id)
      t.parent = samakonasana
      t.save
    end

    trikonasana = Technique.create!(:name => 'trikônásana', :technique_type => asana, :code => '07-10')
    assign_as_parent(trikonasana, '07-02')
    assign_as_parent(trikonasana, '07-08')
    assign_as_parent(trikonasana, '07-09')
    assign_as_parent(trikonasana, '07-10')
    (718..797).each do |id|
      t = Technique.find(id)
      t.parent = trikonasana
      t.save
    end
    (828..836).each do |id|
      t = Technique.find(id)
      t.parent = trikonasana
      t.save
    end


    upavishtasana = Technique.find(2390)
    assign_as_parent(upavishtasana, '10-1')
    assign_as_parent(upavishtasana, '10-2')
    assign_as_parent(upavishtasana, '10-3')

    vrishkasana = Technique.find(2392)
    assign_as_parent(vrishkasana, '47-1')

    dwahastasana = Technique.find(897)
    assign_as_parent(dwahastasana, '16-8')

    merudandasana = Technique.find(2394)
    assign_as_parent(merudandasana, '38-1')
    assign_as_parent(merudandasana, '38-2')
    assign_as_parent(merudandasana, '38-3')
    assign_as_parent(merudandasana, '38-4')
    assign_as_parent(merudandasana, '19-1')
    assign_as_parent(merudandasana, '19-2')
    assign_as_parent(merudandasana, '19-3')
    assign_as_parent(merudandasana, '19-4')

    arohasana = Technique.find(21)
    arohasana.parent = nil
    arohasana.save

    natapadasana = Technique.find(1968)
    natapadasana.parent = nil
    natapadasana.save

    yogasana = Technique.find(2446)
    assign_as_parent(yogasana, '31-3')
    assign_as_parent(yogasana, '31-4')
    assign_as_parent(yogasana, '31-5')

    padmasana = Technique.find(2447)
    assign_as_parent(padmasana, '03-09')
    assign_as_parent(padmasana, '03-10')
    assign_as_parent(padmasana, '03-11')
    (2050..2061).each do |id|
      t = Technique.find(id)
      t.parent = padmasana
      t.save
    end

    parvatasana = Technique.find(2449)
    assign_as_parent(parvatasana, '30-1')
    assign_as_parent(parvatasana, '30-2')
    assign_as_parent(parvatasana, '30-3')
    assign_as_parent(parvatasana, '30-4')
    assign_as_parent(parvatasana, '30-5')
    assign_as_parent(parvatasana, '30-6')
    t = Technique.find(2076)
    t.parent = parvatasana
    t.save

    pingalasana = Technique.find(2450)
    assign_as_parent(pingalasana, '03-30')

    puranasana = Technique.find(2453)
    assign_as_parent(puranasana, '03-01')
    assign_as_parent(puranasana, '03-02')
    assign_as_parent(puranasana, '03-03')

    samanasana = Technique.find(2455)
    assign_as_parent(samanasana, '03-06')
    assign_as_parent(samanasana, '03-06')

    shavasana = Technique.find(2458)
    assign_as_parent(shavasana, '02-01')
    assign_as_parent(shavasana, '02-02')
    assign_as_parent(shavasana, '02-03')
    assign_as_parent(shavasana, '02-04')
    assign_as_parent(shavasana, '02-05')
    assign_as_parent(shavasana, '02-06')
    assign_as_parent(shavasana, '02-07')
    assign_as_parent(shavasana, '02-08')
    assign_as_parent(shavasana, '02-09')
    assign_as_parent(shavasana, '02-10')
    assign_as_parent(shavasana, '02-11')
    assign_as_parent(shavasana, '02-12')
    assign_as_parent(shavasana, '02-13')
    assign_as_parent(shavasana, '02-14')
    assign_as_parent(shavasana, '02-15')
    assign_as_parent(shavasana, '02-16')
    assign_as_parent(shavasana, '02-17')
    assign_as_parent(shavasana, '02-18')

    shirapadasana = Technique.find(2460)
    shirapadasana.code = '27-1'
    shirapadasana.save
    assign_as_parent(shirapadasana, '27-1')

    urdhwa_shirapadasana = Technique.find(2145)
    urdhwa_shirapadasana.parent = nil
    urdhwa_shirapadasana.save
    assign_as_parent(urdhwa_shirapadasana, '05-16')

    siddhasana = Technique.find(2461)
    assign_as_parent(siddhasana, '03-08')

    simhasana = Technique.find(2462)
    assign_as_parent(simhasana, '36-2')

    sukhasana = Technique.find(2463)
    assign_as_parent(sukhasana, '03-05')

    urdhwa_sukhasana = Technique.find(2165)
    urdhwa_sukhasana.parent = sukhasana
    urdhwa_sukhasana.save
    urdhwa_sukhasana = Technique.find(2170)
    urdhwa_sukhasana.parent = sukhasana
    urdhwa_sukhasana.save

    (2166..2169).each do |id|
      t = Technique.find(id)
      t.parent = sukhasana
      t.save
    end

    talasana = Technique.find(2467)
    assign_as_parent(talasana, '14-1')
    assign_as_parent(talasana, '14-2')
    assign_as_parent(talasana, '14-3')
    assign_as_parent(talasana, '14-4')
    assign_as_parent(talasana, '14-5')

    yogadandasana = Technique.find(2470)
    assign_as_parent(yogadandasana, '23-7')

    vajrasana = Technique.find(2421)
    assign_as_parent(vajrasana, '40-2')
    assign_as_parent(vajrasana, '40-3')
    (1514..1543).each do |id|
      t = Technique.find(id)
      t.parent = vajrasana
      t.save
    end

    rajas_samakona_vajrasana = Technique.create!(:name => 'rajas samakôna vajrásana', :code => '28-3', :technique_type => asana)
    (1537..1539).each do |id|
      t = Technique.find(id)
      t.parent = rajas_samakona_vajrasana
      t.save
    end

    kapodasana = Technique.find(2425)
    assign_as_parent(kapodasana, '25-1')
    assign_as_parent(kapodasana, '25-2')
    assign_as_parent(kapodasana, '25-3')

    karanyasana = Technique.find(2426)
    assign_as_parent(karanyasana, '42-1')

    lolasana = Technique.find(2429)
    assign_as_parent(lolasana, '18-1')
    assign_as_parent(lolasana, '18-2')

    matsyendrasana = Technique.find(2430)
    assign_as_parent(matsyendrasana, '26-2')
    assign_as_parent(matsyendrasana, '26-3')
    assign_as_parent(matsyendrasana, '26-4')
    assign_as_parent(matsyendrasana, '26-5')
    assign_as_parent(matsyendrasana, '26-6')

    paschimottanasana = Technique.find(2432)
    assign_as_parent(paschimottanasana, '20-2')
    assign_as_parent(paschimottanasana, '20-3')
    assign_as_parent(paschimottanasana, '20-4')
    assign_as_parent(paschimottanasana, '20-5')

    padaprasaranasana = Technique.find(2433)
    assign_as_parent(padaprasaranasana, '09-3')
    assign_as_parent(padaprasaranasana, '09-4')
    assign_as_parent(padaprasaranasana, '09-5')
    assign_as_parent(padaprasaranasana, '09-6')
    assign_as_parent(padaprasaranasana, '09-7')
    assign_as_parent(padaprasaranasana, '09-8')
    assign_as_parent(padaprasaranasana, '21-6')

    vajra_urdhwasana = Technique.find(2212)
    assign_as_parent(vajra_urdhwasana, '04-2')

    januhasta_urdhwasana = Technique.create!(:name =>'jánuhasta úrdhwásana', :code => '04-3', :technique_type => asana)
    assign_as_parent(januhasta_urdhwasana, '04-3')

    bhadra_urdhwasana = Technique.create!(:name =>'bhadra úrdhwásana', :code => '04-4', :technique_type => asana)
    assign_as_parent(bhadra_urdhwasana, '04-4')

    padotthita_urdhwasana = Technique.create!(:name =>'pádôtthita úrdhwásana', :code => '04-5', :technique_type => asana)
    assign_as_parent(padotthita_urdhwasana, '04-5')

    padahasta_urdhwasana = Technique.create!(:name =>'pádahasta úrdhwásana', :code => '04-6', :technique_type => asana)
    assign_as_parent(padahasta_urdhwasana, '04-6')

    padahasta_janushirsha_urdhwasana = Technique.create!(:name =>'pádahasta jánushírsha úrdhwásana', :code => '04-7', :technique_type => asana)
    assign_as_parent(padahasta_janushirsha_urdhwasana, '04-7')

    ekapada_urdhwasana = Technique.create!(:name => 'êkapáda úrdhwásana', :code => '05-05', :technique_type => asana)
    assign_as_parent(ekapada_urdhwasana, '05-05')

    vatyanasana = Technique.find(2473)
    assign_as_parent(vatyanasana, '39-0')

    virasana = Technique.find(2434)
    assign_as_parent(virasana, '03-12')
    assign_as_parent(virasana, '03-13')
    assign_as_parent(virasana, '24-1')

    matsyasana = Technique.find(2438)
    assign_as_parent(matsyasana, '43-2')
    assign_as_parent(matsyasana, '43-3')
    assign_as_parent(matsyasana, '43-4')
    assign_as_parent(matsyasana, '43-5')
    assign_as_parent(matsyasana, '43-6')
    assign_as_parent(matsyasana, '43-7')

    mayurasana = Technique.find(2398)
    assign_as_parent(mayurasana, '37-01')
    assign_as_parent(mayurasana, '37-02')
    assign_as_parent(mayurasana, '37-03')

    kapalasana = Technique.find(2399)
    assign_as_parent(kapalasana, '45-16')
    assign_as_parent(kapalasana, '45-17')
    assign_as_parent(kapalasana, '45-19')
    assign_as_parent(kapalasana, '45-20')
    assign_as_parent(kapalasana, '45-21')
    assign_as_parent(kapalasana, '45-22')
    assign_as_parent(kapalasana, '45-23')
    assign_as_parent(kapalasana, '45-24')
    assign_as_parent(kapalasana, '45-25')
    assign_as_parent(kapalasana, '45-26')
    assign_as_parent(kapalasana, '45-27')
    assign_as_parent(kapalasana, '45-27')
    assign_as_parent(kapalasana, '45-28')
    assign_as_parent(kapalasana, '45-29')
    assign_as_parent(kapalasana, '45-30')
    assign_as_parent(kapalasana, '45-31')
    assign_as_parent(kapalasana, '45-33')

    tripadasana = Technique.find(2405)
    (1242..1280).each do |id|
      t = Technique.find(id)
      t.parent = tripadasana
      t.save
    end

    ekahastasana = Technique.find(1281)
    assign_as_parent(ekahastasana, '16-9')

    grivasana = Technique.find(2407)
    (1290..1300).each do |id|
      t = Technique.find(id)
      t.parent = grivasana
      t.save
    end

    halasana = Technique.find(2408)
    assign_as_parent(halasana, '42-5')

    vajrolyasana = Technique.find(2409)
    assign_as_parent(vajrolyasana, '22-2')
    assign_as_parent(vajrolyasana, '22-3')

    padahastasana = Technique.find(2413)
    assign_as_parent(padahastasana, '16-1')
    assign_as_parent(padahastasana, '16-2')
    assign_as_parent(padahastasana, '16-3')
    assign_as_parent(padahastasana, '16-4')
    assign_as_parent(padahastasana, '16-5')

    gomukhasana = Technique.find(2414)
    assign_as_parent(gomukhasana, '29-1')
    assign_as_parent(gomukhasana, '29-2')
    assign_as_parent(gomukhasana, '29-3')

    hastinasana = Technique.find(2417)
    assign_as_parent(hastinasana, '13-2')
    assign_as_parent(hastinasana, '13-3')

    idasana = Technique.find(2418)
    assign_as_parent(idasana, '03-29')

    swastikasana = Technique.find(2180)
    assign_as_parent(swastikasana, '03-07')


    t = Technique.find(2370)
    t.destroy
    t = Technique.find(2372)
    t.destroy
    t = Technique.find(2378)
    t.destroy
    t = Technique.find(2379)
    t.destroy
    t = Technique.find(2389)
    t.destroy
    t = Technique.find(2393)
    t.destroy
    t = Technique.find(2406)
    t.destroy
    t = Technique.find(2439)
    t.destroy
    t = Technique.find(2472)
    t.destroy
    
  end

  def self.down
  end
end
