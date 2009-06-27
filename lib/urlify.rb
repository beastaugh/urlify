# encoding: UTF-8

module URLify
  
  URLIFY_PATH = File.expand_path(File.dirname(__FILE__)) + '/urlify/'
  require URLIFY_PATH + 'accents'
  
  # Converts an input string into a URL-safe string.
  # 
  # * Leading and trailing whitespace is removed.
  # * Diacritics are removed from all characters.
  # * All letters are converted to lower case.
  # * Remaining whitespace is replaced with separators.
  # * Any remaining character which is not a letter, a digit or a valid
  #   separator is removed.
  # 
  # Only underscores, dashes, plus signs and the empty string are allowed as
  # separators, although combinations are permitted, so "_", "--", "+_-" and ""
  # are all valid separators.
  def self.urlify(string, separator = "_")
    unless separator =~ /^[\-\_\+]*$/
      separator = "_"
    end
    
    deaccentuate(strip_subtitle(string.strip)).
      downcase.
      gsub(/\s/, separator).
      gsub(/[^a-z\d\_\-\+]/, "")
  end
  
  # Removes everything from a string after the first colon.
  #
  # Ensures that titles with really long subtitles don't convert to equally
  # long permalinks.
  def self.strip_subtitle(string)
    string.split(/\s*\:\s*/).first
  end
  
  # Removes diacritics from an input string's characters.
  # 
  # So a lowercase 'u' with an umlaut, ü, becomes u, while an uppercase 'A'
  # with an acute accent, Á, becomes A. This method is UTF-8 safe.
  def self.deaccentuate(string)
    (RUBY_VERSION >= "1.9.0" ? string.chars : string.split(//u)).map {|c|
      ACCENTMAP.has_key?(c) ? ACCENTMAP[c] : c
    }.join("")
  end
end
