#!/usr/bin/env gem build
# encoding: utf-8

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'urlify/version'

Gem::Specification.new do |s|
  s.name        = "urlify"
  s.version     = URLify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "BSD"
  s.author      = "Benedict Eastaugh"
  s.email       = "benedict@eastaugh.net"
  s.homepage    = "http://github.com/ionfish/urlify"
  s.summary     = "Convert accented characters to their ASCII equivalents"
  s.description = "A small library for converting accented characters to
                   their ASCII equivalents.".sub(/\s+/, " ")
  
  s.required_rubygems_version = ">= 1.3"
  
  s.files     = Dir.glob("lib/**/*.rb") + %w(LICENSE README.md)
  s.test_file = "test/urlify_test.rb"
end
