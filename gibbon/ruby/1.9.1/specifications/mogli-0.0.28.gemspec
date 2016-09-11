# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mogli"
  s.version = "0.0.28"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Mangino"]
  s.date = "2011-04-14"
  s.description = "Simple library for accessing the facebook Open Graph API"
  s.email = "mmangino@elevatedrails.com"
  s.homepage = "http://developers.facebook.com/docs/api"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Open Graph Library for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.3"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.3"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.3"])
  end
end
