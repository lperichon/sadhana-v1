# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "money"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tobias Luetke", "Hongli Lai", "Jeremy McNevin", "Shane Emmons"]
  s.date = "2010-05-07"
  s.description = "Money and currency exchange support library."
  s.email = "hongli@phusion.nl"
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "LICENSE", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "LICENSE", "README.rdoc"]
  s.homepage = "http://money.rubyforge.org/"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "money"
  s.rubygems_version = "1.8.10"
  s.summary = "Money and currency exchange support library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<hanna>, [">= 0.1.12"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<hanna>, [">= 0.1.12"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<hanna>, [">= 0.1.12"])
  end
end
