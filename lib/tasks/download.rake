require 'open-uri'

namespace :techniques do
  #rake techniques:download
  desc "downloads techniques from uni-yoga.org"
  task :download => :environment do
    puts "Downloading..."
    download
  end

  #rake techniques:update
  desc "update techniques from uni-yoga.org"
  task :update => :environment do
    puts "Updating..."
    update
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