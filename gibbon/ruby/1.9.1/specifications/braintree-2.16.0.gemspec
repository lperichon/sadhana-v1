# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "braintree"
  s.version = "2.16.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Braintree"]
  s.date = "2012-04-19"
  s.description = "Ruby library for integrating with the Braintree Gateway"
  s.email = "code@getbraintree.com"
  s.homepage = "http://www.braintreepayments.com/"
  s.require_paths = ["lib"]
  s.rubyforge_project = "braintree"
  s.rubygems_version = "1.8.10"
  s.summary = "Braintree Gateway Ruby Client Library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.0.0"])
    else
      s.add_dependency(%q<builder>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.0.0"])
  end
end
