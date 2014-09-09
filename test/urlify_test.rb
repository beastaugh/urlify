#!/usr/bin/env ruby
# encoding: UTF-8

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'test/unit'
require 'urlify'

class String
  include URLify
end

class URLifyTest < Test::Unit::TestCase

  def setup
    @philosopher = "Søren Kierkegaard"
    @biography   = "Boyd: The Fighter Pilot Who Changed the Art of War"
    @cours       = "Humanities/Socratic Task"
  end

  def test_subtitle_stripping
    assert_equal("Boyd", URLify.strip_subtitle(@biography))
  end

  def test_mixin_subtitle_stripping
    assert_equal("Boyd", @biography.strip_subtitle)
  end

  def test_ulmaut_deaccentuation
    assert_equal("Ae", URLify.deaccentuate("Ä"))
    assert_equal("Oe", URLify.deaccentuate("Ö"))
    assert_equal("Ue", URLify.deaccentuate("Ü"))
    assert_equal("ae", URLify.deaccentuate("ä"))
    assert_equal("oe", URLify.deaccentuate("ö"))
    assert_equal("ue", URLify.deaccentuate("ü"))
  end

  def test_deaccentuation
    assert_equal("Soeren Kierkegaard", URLify.deaccentuate(@philosopher))
    assert_equal("Karl Weierstrass", URLify.deaccentuate("Karl Weierstraß"))
    assert_equal("Tomek Bartoszynski", URLify.deaccentuate("Tomek Bartoszyński"))
    assert_equal("Jozef Maria Bochenski", URLify.deaccentuate("Józef Maria Bocheński"))
    assert_equal("Jerzy Los", URLify.deaccentuate("Jerzy Łoś"))
    assert_equal("Jan Lukasiewicz", URLify.deaccentuate("Jan Łukasiewicz"))
    assert_equal("Chaim Perelman", URLify.deaccentuate("Chaïm Perelman"))
  end

  def test_mixin_deaccentuation
    assert_equal("Soeren Kierkegaard", @philosopher.deaccentuate)
  end

  def test_urlification
    assert_equal("soeren_kierkegaard", URLify.urlify(@philosopher))
    assert_equal("boyd", URLify.urlify(@biography))
    assert_equal("humanities_socratic_task", URLify.urlify(@cours))
  end

  def test_mixin_urlification
    assert_equal("soeren_kierkegaard", @philosopher.urlify)
    assert_equal("boyd", @biography.urlify)
    assert_equal("humanities_socratic_task", URLify.urlify(@cours))
  end

  def test_urlification_separator
    assert_equal("soeren_kierkegaard", URLify.urlify(@philosopher))
    assert_equal("boyd", URLify.urlify(@biography, '-'))
  end

  def test_mixin_urlification_separator
    assert_equal("soeren_kierkegaard", @philosopher.urlify)
    assert_equal("boyd", @biography.urlify('-'))
  end
end
