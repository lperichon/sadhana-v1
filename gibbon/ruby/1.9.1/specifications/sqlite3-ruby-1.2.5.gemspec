# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sqlite3-ruby"
  s.version = "1.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamis Buck"]
  s.date = "2009-07-25"
  s.description = "This module allows Ruby programs to interface with the SQLite3\ndatabase engine (http://www.sqlite.org).  You must have the\nSQLite engine installed in order to build this module.\n\nNote that this module is NOT compatible with SQLite 2.x."
  s.email = ["jamis@37signals.com"]
  s.extensions = ["ext/sqlite3_api/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "ext/sqlite3_api/extconf.rb"]
  s.homepage = "http://sqlite3-ruby.rubyforge.org"
  s.rdoc_options = ["--main", "README.txt", "--main=README.txt"]
  s.require_paths = ["lib", "ext"]
  s.required_ruby_version = Gem::Requirement.new("> 1.8.5")
  s.rubyforge_project = "sqlite-ruby"
  s.rubygems_version = "1.8.10"
  s.summary = "This module allows Ruby programs to interface with the SQLite3 database engine (http://www.sqlite.org)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.5.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.2"])
    else
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.5.0"])
      s.add_dependency(%q<hoe>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.5.0"])
    s.add_dependency(%q<hoe>, [">= 2.3.2"])
  end
end
