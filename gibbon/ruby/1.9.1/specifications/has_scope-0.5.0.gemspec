# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "has_scope"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jos\u{c3}\u{a9} Valim"]
  s.date = "2010-03-22"
  s.description = "Maps controller filters to your resource scopes"
  s.email = "contact@plataformatec.com.br"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/plataformatec/has_scope"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Maps controller filters to your resource scopes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
