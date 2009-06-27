# encoding: UTF-8

class URLifyTest < Test::Unit::TestCase
  
  def setup
    @philosopher = "Søren Kierkegaard"
    @biography   = "Boyd: The Fighter Pilot Who Changed the Art of War"
  end
  
  def test_stripping_subtitles
    assert_equal("Boyd", URLify.strip_subtitle(@biography))
  end
  
  def test_deaccentuation
    assert_equal("Soeren Kierkegaard", URLify.deaccentuate(@philosopher))
  end
  
  def test_urlification
    assert_equal("soeren_kierkegaard", URLify.urlify(@philosopher))
    assert_equal("boyd", URLify.urlify(@biography))
  end
end
