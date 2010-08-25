class MigrateTechniqueTranslations < ActiveRecord::Migration
  def self.up
    execute %(
      INSERT INTO technique_translations (technique_id, name, description, locale) SELECT id, name, description, 'en' FROM techniques;
      INSERT INTO technique_translations (technique_id, name, description, locale) SELECT id, name, description, 'es' FROM techniques;
    )
  end

  def self.down
  end
end
