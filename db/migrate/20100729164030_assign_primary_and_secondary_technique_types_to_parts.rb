class AssignPrimaryAndSecondaryTechniqueTypesToParts < ActiveRecord::Migration
  def self.up
    mudra = Part.find_by_symbol('mudra')
    mudra.primary_technique_type = '.mudra'
    mudra.secondary_technique_types = '.asana'
    mudra.save

    puja = Part.find_by_symbol('puja')
    puja.primary_technique_type = '.asana'
    puja.secondary_technique_types = '.mudra'
    puja.save

    mantra = Part.find_by_symbol('mantra')
    mantra.primary_technique_type = '.asana'
    mantra.secondary_technique_types = '.mudra'
    mantra.save

    pranayama = Part.find_by_symbol('pranayama')
    pranayama.primary_technique_type = '.asana'
    pranayama.secondary_technique_types = '.mudra'
    pranayama.save

    kriya = Part.find_by_symbol('kriya')
    kriya.primary_technique_type = '.asana'
    kriya.secondary_technique_types = ''
    kriya.save

    asana = Part.find_by_symbol('asana')
    asana.primary_technique_type = '.asana'
    asana.secondary_technique_types = '.mudra, .manos'
    asana.save

    yoganidra = Part.find_by_symbol('yoganidra')
    yoganidra.primary_technique_type = '.asana'
    yoganidra.secondary_technique_types = ''
    yoganidra.save

    samyama = Part.find_by_symbol('samyama')
    samyama.primary_technique_type = '.asana'
    samyama.secondary_technique_types = '.mudra'
    samyama.save
  end

  def self.down
  end
end
