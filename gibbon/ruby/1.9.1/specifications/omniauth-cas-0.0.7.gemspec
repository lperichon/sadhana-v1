# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omniauth-cas"
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Derek Lindahl"]
  s.date = "2012-05-04"
  s.email = ["dlindahl@customink.com"]
  s.homepage = "https://github.com/dlindahl/omniauth-cas"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "CAS Strategy for OmniAuth"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.2"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<webmock>, ["~> 1.8.6"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.6.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.6"])
      s.add_development_dependency(%q<bourne>, ["~> 1.1.2"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
    else
      s.add_dependency(%q<omniauth>, ["~> 1.1.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<addressable>, ["~> 2.2"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<webmock>, ["~> 1.8.6"])
      s.add_dependency(%q<simplecov>, ["~> 0.6.2"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<rack-test>, ["~> 0.6"])
      s.add_dependency(%q<bourne>, ["~> 1.1.2"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth>, ["~> 1.1.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<addressable>, ["~> 2.2"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<webmock>, ["~> 1.8.6"])
    s.add_dependency(%q<simplecov>, ["~> 0.6.2"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<rack-test>, ["~> 0.6"])
    s.add_dependency(%q<bourne>, ["~> 1.1.2"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
  end
end
