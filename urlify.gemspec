# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{urlify}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benedict Eastaugh"]
  s.date = %q{2009-06-27}
  s.description = %q{A small library for converting accented characters to their ASCII equivalents.}
  s.email = %q{benedict@eastaugh.net}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.homepage = %q{http://ionfish.github.com/urlify/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Diacritic conversion}
  s.test_files = [
    "test/urlify_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
