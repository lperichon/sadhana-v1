# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "analytical"
  s.version = "2.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Krall", "Nathan Phelps", "Adam Anderson", "Kevin Menard", "Ablyamitov Ablyamit", "Kurt Werle", "Olivier Lauzon"]
  s.date = "2011-04-20"
  s.description = "Gem for managing multiple analytics services in your rails app."
  s.email = "josh@feefighters.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/jkrall/analytical"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Gem for managing multiple analytics services in your rails app."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 1.3"])
      s.add_development_dependency(%q<diff-lcs>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 2.3"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
    else
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 1.3"])
      s.add_dependency(%q<diff-lcs>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 2.3"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
    end
  else
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 1.3"])
    s.add_dependency(%q<diff-lcs>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 2.3"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
  end
end
