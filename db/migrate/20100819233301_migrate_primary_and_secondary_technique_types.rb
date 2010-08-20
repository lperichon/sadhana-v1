class MigratePrimaryAndSecondaryTechniqueTypes < ActiveRecord::Migration
  def self.up
    
    mudra_part = Part.find_by_symbol('mudra')
    mudra_tt = TechniqueType.find_by_symbol('mudra')
    asana_tt = TechniqueType.find_by_symbol('asana')
    mudra_part.technique_type = mudra_tt
    mudra_part.technique_types << asana_tt
    mudra_part.save

    puja_part = Part.find_by_symbol('puja')
    puja_part.technique_type = asana_tt
    puja_part.technique_types << mudra_tt
    puja_part.save

    mantra_part = Part.find_by_symbol('mantra')
    mantra_part.technique_type = asana_tt
    mantra_part.technique_types << mudra_tt
    mantra_part.save

    pranayama_part = Part.find_by_symbol('pranayama')
    pranayama_part.technique_type = asana_tt
    pranayama_part.technique_types << mudra_tt
    pranayama_part.save

    kriya_part = Part.find_by_symbol('kriya')
    kriya_part.technique_type = asana_tt
    kriya_part.save

    asana_part = Part.find_by_symbol('asana')
    asana_part.technique_type = asana_tt
    asana_part.technique_types << mudra_tt
    manos_tt = TechniqueType.find_by_symbol('manos')
    asana_part.technique_types << manos_tt
    asana_part.save

    yoganidra_part = Part.find_by_symbol('yoganidra')
    yoganidra_part.technique_type = asana_tt
    yoganidra_part.save

    samyama_part = Part.find_by_symbol('samyama')
    samyama_part.technique_type = asana_tt
    samyama_part.technique_types << mudra_tt
    samyama_part.save
  end

  def self.down
  end
end
