# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fb_graph"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["nov matake"]
  s.date = "2011-02-04"
  s.description = "A full-stack Facebook Graph API wrapper in Ruby."
  s.email = "nov@matake.jp"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/nov/fb_graph"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A full-stack Facebook Graph API wrapper in Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.4.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3"])
      s.add_runtime_dependency(%q<rest-client>, [">= 1.4"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0.1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.3.0"])
    else
      s.add_dependency(%q<json>, [">= 1.4.3"])
      s.add_dependency(%q<activesupport>, [">= 2.3"])
      s.add_dependency(%q<rest-client>, [">= 1.4"])
      s.add_dependency(%q<oauth2>, [">= 0.1.0"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.4.3"])
    s.add_dependency(%q<activesupport>, [">= 2.3"])
    s.add_dependency(%q<rest-client>, [">= 1.4"])
    s.add_dependency(%q<oauth2>, [">= 0.1.0"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 1.3.0"])
  end
end
