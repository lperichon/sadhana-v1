class AddTechniqueCategories < ActiveRecord::Migration
  def self.up
    category = TechniqueCategory.create(:code => '22')
    category.translations_attributes = [{:locale => 'en', :name => 'abdominals'}, {:locale => 'es', :name => 'Abdominales'}, {:locale => 'pt', :name => 'Abdominais'}]
    category.save
    category = TechniqueCategory.create(:code => '38')
    category.translations_attributes = [{:locale => 'en', :name => 'Supine abdominals'}, {:locale => 'es', :name => 'Abdominales en decúbito dorsal'}, {:locale => 'pt', :name => 'Abdominais em decúbito dorsal'}]
    category.save
    category = TechniqueCategory.create(:code => '9')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing pelvic openings'}, {:locale => 'es', :name => 'Aperturas pélvicas de pie'}, {:locale => 'pt', :name => 'Aberturas pélvicas em pé'}]
    category.save
    category = TechniqueCategory.create(:code => '11')
    category.translations_attributes = [{:locale => 'en', :name => 'Lying pelvic openings'}, {:locale => 'es', :name => 'Aperturas pélvicas en el suelo'}, {:locale => 'pt', :name => 'Aberturas pélvicas no solo'}]
    category.save
    category = TechniqueCategory.create(:code => '21')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting pelvic openings'}, {:locale => 'es', :name => 'Aperturas pélvicas sentadas'}, {:locale => 'pt', :name => 'Aberturas pélvicas sentadas'}]
    category.save
    category = TechniqueCategory.create(:code => '33')
    category.translations_attributes = [{:locale => 'en', :name => 'Anterior thighs stretchings'}, {:locale => 'es', :name => 'Elongación de los muslos anteriores'}, {:locale => 'pt', :name => 'Alongamento anterior das coxas'}]
    category.save
    category = TechniqueCategory.create(:code => '35')
    category.translations_attributes = [{:locale => 'en', :name => 'Feet stretchings'}, {:locale => 'es', :name => 'Elongación de los pies'}, {:locale => 'pt', :name => 'Alongamento dos pés'}]
    category.save
    category = TechniqueCategory.create(:code => '29')
    category.translations_attributes = [{:locale => 'en', :name => 'Arms and shoulder stretchings'}, {:locale => 'es', :name => 'Elongación de los brazos y hombros'}, {:locale => 'pt', :name => 'Alongamento para braços e ombros'}]
    category.save
    category = TechniqueCategory.create(:code => '16')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing forward bends'}, {:locale => 'es', :name => 'Anteflexiones de pie'}, {:locale => 'pt', :name => 'Anteflexões em pé'}]
    category.save
    category = TechniqueCategory.create(:code => '20')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting forward bends (Group 1)'}, {:locale => 'es', :name => 'Anteflexiones sentadas (1º grupo)'}, {:locale => 'pt', :name => 'Anteflexões sentadas (1º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '23')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting forward bends (Group 2)'}, {:locale => 'es', :name => 'Anteflexiones sentadas (2º grupo)'}, {:locale => 'pt', :name => 'Anteflexões sentadas (2º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '31')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting forward bends (Group 3)'}, {:locale => 'es', :name => 'Anteflexiones sentadas (3º grupo)'}, {:locale => 'pt', :name => 'Anteflexões sentadas (3º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '18')
    category.translations_attributes = [{:locale => 'en', :name => 'Balance on the back'}, {:locale => 'es', :name => 'Balanceo sobre la espalda'}, {:locale => 'pt', :name => 'Balanços sobre as costas'}]
    category.save
    category = TechniqueCategory.create(:code => '43')
    category.translations_attributes = [{:locale => 'en', :name => 'Compensations for inverted positions on the shoulders'}, {:locale => 'es', :name => 'Compensaciones de las invertidas sobre los hombros'}, {:locale => 'pt', :name => 'Compensações das invertidas'}]
    category.save
    category = TechniqueCategory.create(:code => '41')
    category.translations_attributes = [{:locale => 'en', :name => 'Lying back, legs flexed'}, {:locale => 'es', :name => 'Decúbito dorsal, piernas flexionadas'}, {:locale => 'pt', :name => 'Deitadas para trás, pernas flexionadas'}]
    category.save
    category = TechniqueCategory.create(:code => '46')
    category.translations_attributes = [{:locale => 'en', :name => 'Resting positions for the headstand'}, {:locale => 'es', :name => 'Descanso de las invertidas sobre la cabeza'}, {:locale => 'pt', :name => 'Descanso das invertidas sobre a cabeça'}]
    category.save
    category = TechniqueCategory.create(:code => '30')
    category.translations_attributes = [{:locale => 'en', :name => 'Balance on the knees'}, {:locale => 'es', :name => 'Equilibrio sobre las rodillas'}, {:locale => 'pt', :name => 'Equilíbrio sobre os joelhos'}]
    category.save
    category = TechniqueCategory.create(:code => '36')
    category.translations_attributes = [{:locale => 'en', :name => 'Facial and laryngeal'}, {:locale => 'es', :name => 'Faciales y laríngeos'}, {:locale => 'pt', :name => 'Faciais e laríngeos'}]
    category.save
    category = TechniqueCategory.create(:code => '27')
    category.translations_attributes = [{:locale => 'en', :name => 'Flexion with a leg in the neck'}, {:locale => 'es', :name => 'Flexión con una pierna en la nuca'}, {:locale => 'pt', :name => 'Flexionamento com uma perna na nuca'}]
    category.save
    category = TechniqueCategory.create(:code => '24')
    category.translations_attributes = [{:locale => 'en', :name => 'Flexion of the knees'}, {:locale => 'es', :name => 'Flexión de las rodillas'}, {:locale => 'pt', :name => 'Flexionamento dos joelhos'}]
    category.save
    category = TechniqueCategory.create(:code => '39')
    category.translations_attributes = [{:locale => 'en', :name => 'Coccyx-femoral flexions'}, {:locale => 'es', :name => 'Flexiones coxo-femorales'}, {:locale => 'pt', :name => 'Flexionamentos coxo-femurais'}]
    category.save
    category = TechniqueCategory.create(:code => '7')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing lateral flexions'}, {:locale => 'es', :name => 'Flexiones laterales de pie'}, {:locale => 'pt', :name => 'Flexões laterais em pé'}]
    category.save
    category = TechniqueCategory.create(:code => '45')
    category.translations_attributes = [{:locale => 'en', :name => 'Headstand'}, {:locale => 'es', :name => 'Invertidas sobre la cabeza'}, {:locale => 'pt', :name => 'Invertidas sobre a cabeça'}]
    category.save
    category = TechniqueCategory.create(:code => '47')
    category.translations_attributes = [{:locale => 'en', :name => 'Handstands and Armstands'}, {:locale => 'es', :name => 'Invertidas sobre los brazos y/o manos'}, {:locale => 'pt', :name => 'Invertidas sobre os braços e/ou mãos'}]
    category.save
    category = TechniqueCategory.create(:code => '42')
    category.translations_attributes = [{:locale => 'en', :name => 'Inverted positions on the shoulders'}, {:locale => 'es', :name => 'Invertidas sobre los hombros'}, {:locale => 'pt', :name => 'Invertidas sobre os ombros'}]
    category.save
    category = TechniqueCategory.create(:code => '19')
    category.translations_attributes = [{:locale => 'en', :name => 'Movements to lie/sit with traction'}, {:locale => 'es', :name => 'Movimientos para acostarse/sentarse con tracción'}, {:locale => 'pt', :name => 'Movimentos de deitar e sentar com tração'}]
    category.save
    category = TechniqueCategory.create(:code => '4')
    category.translations_attributes = [{:locale => 'en', :name => 'Movements to stand up'}, {:locale => 'es', :name => 'Movimientos para levantarse'}, {:locale => 'pt', :name => 'Movimentos para levantar-se'}]
    category.save
    category = TechniqueCategory.create(:code => '10')
    category.translations_attributes = [{:locale => 'en', :name => 'Movements to sit down'}, {:locale => 'es', :name => 'Movimientos para sentarse'}, {:locale => 'pt', :name => 'Movimentos para sentar-se'}]
    category.save
    category = TechniqueCategory.create(:code => '28')
    category.translations_attributes = [{:locale => 'en', :name => 'Elevation on arms muscle positions'}, {:locale => 'es', :name => 'Musculares de elevación en los brazos'}, {:locale => 'pt', :name => 'Musculares de elevação nos braços'}]
    category.save
    category = TechniqueCategory.create(:code => '37')
    category.translations_attributes = [{:locale => 'en', :name => 'Various muscle positions'}, {:locale => 'es', :name => 'Musculares diversos'}, {:locale => 'pt', :name => 'Musculares diversos'}]
    category.save
    category = TechniqueCategory.create(:code => '34')
    category.translations_attributes = [{:locale => 'en', :name => 'Arm and pectoral muscle positions'}, {:locale => 'es', :name => 'Musculares para brazos y pectorales'}, {:locale => 'pt', :name => 'Musculares para braços e peitorais'}]
    category.save
    category = TechniqueCategory.create(:code => '17')
    category.translations_attributes = [{:locale => 'en', :name => 'Squatting positions'}, {:locale => 'es', :name => 'Posiciones en cuclillas'}, {:locale => 'pt', :name => 'Posições agachadas'}]
    category.save
    category = TechniqueCategory.create(:code => '5')
    category.translations_attributes = [{:locale => 'en', :name => 'Balance on feet positions'}, {:locale => 'es', :name => 'Posiciones de equilibrio sobre los pies'}, {:locale => 'pt', :name => 'Posições de equilíbrio sobre os pés'}]
    category.save
    category = TechniqueCategory.create(:code => '3')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting positions for mantra and dhyána'}, {:locale => 'es', :name => 'Posiciones sentadas para mantra y dhyána'}, {:locale => 'pt', :name => 'Posições sentadas para mantra e dhyána'}]
    category.save
    category = TechniqueCategory.create(:code => '44')
    category.translations_attributes = [{:locale => 'en', :name => 'Preparation for headstands'}, {:locale => 'es', :name => 'Preparación para invertidas sobre la cabeza'}, {:locale => 'pt', :name => 'Preparação para invertidas sobre a cabeça'}]
    category.save
    category = TechniqueCategory.create(:code => '2')
    category.translations_attributes = [{:locale => 'en', :name => 'Lying relaxations'}, {:locale => 'es', :name => 'Relajación acostada'}, {:locale => 'pt', :name => 'Relaxamentos deitados'}]
    category.save
    category = TechniqueCategory.create(:code => '32')
    category.translations_attributes = [{:locale => 'en', :name => 'Lying backbends'}, {:locale => 'es', :name => 'Retroflexiones acostadas'}, {:locale => 'pt', :name => 'Retroflexões deitadas'}]
    category.save
    category = TechniqueCategory.create(:code => '8')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing backbends (group 1)'}, {:locale => 'es', :name => 'Retroflexiones de pie (1º grupo)'}, {:locale => 'pt', :name => 'Retroflexões em pé (1º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '15')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing backbends (group 2)'}, {:locale => 'es', :name => 'Retroflexiones de pie (2º grupo)'}, {:locale => 'pt', :name => 'Retroflexões em pé (2º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '25')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting backbends'}, {:locale => 'es', :name => 'Retroflexiones sentadas'}, {:locale => 'pt', :name => 'Retroflexões sentadas'}]
    category.save
    category = TechniqueCategory.create(:code => '40')
    category.translations_attributes = [{:locale => 'en', :name => 'Kneeling backbends'}, {:locale => 'es', :name => 'Retroflexiones de rodillas'}, {:locale => 'pt', :name => 'Retroflexões ajoelhadas'}]
    category.save
    category = TechniqueCategory.create(:code => '6')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing semi-relax (group 1)'}, {:locale => 'es', :name => 'Semi-relajación de pie (1º grupo)'}, {:locale => 'pt', :name => 'Semi-relaxamentos em pé (1º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '13')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing semi-relax (group 2)'}, {:locale => 'es', :name => 'Semi-relajación de pie (2º grupo)'}, {:locale => 'pt', :name => 'Semi-relaxamentos em pé (2º grupo)'}]
    category.save
    category = TechniqueCategory.create(:code => '12')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing torsions'}, {:locale => 'es', :name => 'Torsiones de pie)'}, {:locale => 'pt', :name => 'Torções em pé'}]
    category.save
    category = TechniqueCategory.create(:code => '26')
    category.translations_attributes = [{:locale => 'en', :name => 'Sitting torsions'}, {:locale => 'es', :name => 'Torsiones sentadas'}, {:locale => 'pt', :name => 'Torções sentadas'}]
    category.save
    category = TechniqueCategory.create(:code => '14')
    category.translations_attributes = [{:locale => 'en', :name => 'Standing tractions'}, {:locale => 'es', :name => 'Tracciones de pie'}, {:locale => 'pt', :name => 'Trações em pé'}]
    category.save
    category = TechniqueCategory.create(:code => '1')
    category.translations_attributes = [{:locale => 'en', :name => 'Vestiges of primitive coreographies'}, {:locale => 'es', :name => 'Vestígios de coreografias primitivas'}, {:locale => 'pt', :name => 'Vestígios de coreografias primitivas'}]
    category.save
  end

  def self.down
  end
end
