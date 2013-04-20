require 'open-uri'

namespace :sadhana do
  desc "Permanently delete 1w old soft deleted practices."
  task :clear_deleted_practices => :environment do
    practices = Practice.unscoped.where(:state => 'archived').where('updated_at <= ?', 1.week.ago)
    practices.each do |p|
      p.destroy
    end
  end

  desc "Increment 1s. to practices that have the 1s per day training mode"
  task :one_sec_a_day => :environment do
    practices = Practice.unscoped.where(:one_sec_a_day => true)
    practices.each do |p|
      p.practice_parts.first.practice_techniques.each do |pt|
        new_minutes = pt.seconds == 59 ? pt.minutes+1 : pt.minutes  
        new_seconds = pt.seconds == 59 ? 0 : pt.seconds+1
        pt.update_attributes(:seconds => new_seconds, :minutes => new_minutes)
      end 
    end
  end
end

namespace :asana do
  #rake techniques:download
  desc "downloads ALL techniques from uni-yoga.org"
  task :download => :environment do
    puts "Downloading..."
    download
  end

  #rake techniques:download
  desc "downloads ALL families from uni-yoga.org"
  task :download_families => :environment do
    puts "Downloading..."
    download_families
  end

  #rake techniques:update
  desc "update existing techniques from uni-yoga.org"
  task :update => :environment do
    puts "Updating..."
    update
  end
end

namespace :mudra do
  desc "sets images on all techniques"
  task :images => :environment do
    puts "Setting images..."
    set_images
  end
end

def download
  filenames = {}

  (1..110).each do |i|
    page_html = Nokogiri::HTML(open("http://www.uni-yoga.org/yoga_asanas_consultor.php?tipo=1&nome_simplificado=" + i.to_s))
    baseuri = URI.parse('http://uni-yoga.org')
    page_html.css('#auto_completar ul li').each do |e|
      asana_name =  e.css('.asana_nome').inner_text
      puts i.to_s + ' - ' + asana_name
      iuri = baseuri + URI.parse(URI.encode(e.css('table tr td a').first['href']))
      photo_basename =  File.basename(iuri.path)
      asana_code = photo_basename.gsub(/\.\w*\.jpg/, '')

      begin
        technique = Technique.create!(:technique_type => TechniqueType.find_by_symbol('asana'), :code => asana_code, :name => asana_name )

        filename = File.join('tmp', photo_basename)
        file = File.open(filename, 'wb')
        file.write iuri.read

        filenames[technique.id] = filename
      rescue
        puts 'rescued ' + filename
      end
    end
  end

  filenames.each do |technique_id, filename|
    technique = Technique.find(technique_id)
    puts 'assigning photo to technique = ' + technique.name + '(' + technique_id.to_s + ')' 
    begin
      technique.photo = File.open(filename, 'rb')
      technique.save!
    rescue
      puts 'failed assigning ' + filename.to_s + ' to technique = ' + technique.name + '(' + technique_id.to_s + ')'
    end
  end
end


def download_families
  filenames = {}

  page_html = Nokogiri::HTML(open("http://www.uni-yoga.org/yoga_asanas_consultor.php"))
  baseuri = URI.parse('http://uni-yoga.org')
  page_html.css('#auto_completar ul li').each do |e|
    asana_name =  e.css('.asana_nome').inner_text
    photo_url = e.css('table tr td img').first['src'].gsub(/\/mini\//, '/normal/')
    iuri = baseuri + URI.parse(URI.encode(photo_url))
    photo_basename =  File.basename(iuri.path)
    asana_code = photo_basename.gsub(/\..*\.jpg/, '')

    puts asana_code + ' - ' + asana_name + ' - ' + photo_basename
    begin
      technique = Technique.create!(:technique_type => TechniqueType.find_by_symbol('asana'), :code => asana_code, :name => asana_name )

      filename = File.join('tmp', photo_basename)
      file = File.open(filename, 'wb')
      file.write iuri.read

      filenames[technique.id] = filename

      Technique.where("code like '#{asana_code}.%'").each do |t|
        puts "Setting as parent of " + t.name
        t.parent = technique
        t.save
      end
    rescue
      puts 'rescued ' + filename
    end
  end
  
  filenames.each do |technique_id, filename|
    technique = Technique.find(technique_id)
    puts 'assigning photo to technique ' + technique.name + '(' + technique_id.to_s + ')'
    begin
      technique.photo = File.open(filename, 'rb')
      technique.save!
    rescue
      puts 'failed assigning ' + filename.to_s + ' to technique = ' + technique.name + '(' + technique_id.to_s + ')'
    end
  end
end


def update
  filenames = {}
  (1..110).each do |i|
    page_html = Nokogiri::HTML(open("http://www.uni-yoga.org/yoga_asanas_consultor.php?tipo=1&nome_simplificado=#{i}"))
    baseuri = URI.parse('http://uni-yoga.org')
    page_html.css('#auto_completar ul li').each do |e|
      begin
      asana_name =  e.css('.asana_nome').inner_text
      puts i.to_s + ' - ' + asana_name
      iuri = baseuri + URI.parse(URI.encode(e.css('table tr td a').first['href']))
      photo_basename =  File.basename(iuri.path)
      asana_code = photo_basename.gsub(/\.\w*\.jpg/, '')
      rescue
        puts 'rescued'
      end

      begin
        technique = Technique.find_by_code(asana_code)
        if technique
          filename = File.join('tmp', photo_basename)
          file = File.open(filename, 'wb')
          file.write iuri.read

          filenames[technique.id] = filename
        end
      rescue
        puts 'rescued ' + filename
      end
    end
  end

  filenames.each do |technique_id, filename|
    technique = Technique.find(technique_id)
    puts 'assigning photo to technique = ' + technique.name + '(' + technique_id.to_s + ')'
    begin
      technique.photo = File.open(filename, 'rb')
      technique.save!
    rescue
      puts 'failed assigning ' + filename.to_s + ' to technique = ' + technique.name + '(' + technique_id.to_s + ')'
    end
  end
end

def set_images
  files = Dir.entries("tmp/mudras").sort {|a,b| a.scan(/\d+/)[0].to_i <=> b.scan(/\d+/)[0].to_i}

  mudra = TechniqueType.find_by_symbol('mudra')

  mudra.techniques.each_with_index do |t, idx|
    idx += 1
    puts "#{idx} - #{files[idx+1]}"
    t.photo = File.open("tmp/mudras/#{files[idx+1]}")
    t.save!
  end
end