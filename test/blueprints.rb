require 'machinist/active_record'
require 'sham'

TechniqueType.blueprint do
  name  { Faker::Name.name }
end

Technique.blueprint do
  name  { Faker::Name.name }
  description  { Faker::Lorem.paragraphs(1).join("\n\n") }
  technique_type
end

Practice.blueprint do
  name  { Faker::Name.name }
  description  { Faker::Lorem.paragraphs(1).join("\n\n") }
end
