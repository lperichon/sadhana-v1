# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "state_machine"
  s.version = "0.9.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Pfeifer"]
  s.date = "2010-08-01"
  s.description = "Adds support for creating state machines for attributes on any Ruby class"
  s.email = "aaron@pluginaweek.org"
  s.homepage = "http://www.pluginaweek.org"
  s.require_paths = ["lib"]
  s.rubyforge_project = "pluginaweek"
  s.rubygems_version = "1.8.10"
  s.summary = "Adds support for creating state machines for attributes on any Ruby class"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
