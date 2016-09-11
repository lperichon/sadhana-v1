# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ryanb-acts-as-list"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Bates, Rails Core"]
  s.date = "2008-07-21"
  s.description = "Gem version of acts_as_list Rails plugin."
  s.email = "ryan (at) railscasts (dot) com"
  s.extra_rdoc_files = ["lib/acts_as_list.rb", "README", "tasks/deployment.rake"]
  s.files = ["lib/acts_as_list.rb", "README", "tasks/deployment.rake"]
  s.homepage = "http://github.com/ryanb/acts-as-list"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Acts-as-list", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "acts-as-list"
  s.rubygems_version = "1.8.10"
  s.summary = "Gem version of acts_as_list Rails plugin."

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
