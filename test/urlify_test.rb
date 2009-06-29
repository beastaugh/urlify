# encoding: UTF-8

class String
  include URLify
end

class URLifyTest < Test::Unit::TestCase
  
  def setup
    @philosopher = "Søren Kierkegaard"
    @biography   = "Boyd: The Fighter Pilot Who Changed the Art of War"
  end
  
  def test_subtitle_stripping
    assert_equal("Boyd", URLify.strip_subtitle(@biography))
  end
  
  def test_mixin_subtitle_stripping
    assert_equal("Boyd", @biography.strip_subtitle)
  end
  
  def test_deaccentuation
    assert_equal("Soeren Kierkegaard", URLify.deaccentuate(@philosopher))
  end
  
  def test_mixin_deaccentuation
    assert_equal("Soeren Kierkegaard", @philosopher.deaccentuate)
  end
  
  def test_urlification
    assert_equal("soeren_kierkegaard", URLify.urlify(@philosopher))
    assert_equal("boyd", URLify.urlify(@biography))
  end
  
  def test_mixin_urlification
    assert_equal("soeren_kierkegaard", @philosopher.urlify)
    assert_equal("boyd", @biography.urlify)
  end
end
