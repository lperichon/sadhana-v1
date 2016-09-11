# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "machinist"
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pete Yandell"]
  s.date = "2009-11-28"
  s.email = "pete@notahat.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://github.com/notahat/machinist"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Fixtures aren't fun. Machinist is."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.8"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.8"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.8"])
  end
end
