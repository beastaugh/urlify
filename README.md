URLify
======

A tiny library to convert diacritical marks to unaccented equivalents, for
ASCII-safe URI creation. It also includes a utility method to remove subtitles.


Installation
------------

    sudo gem install urlify

URLify is available from [Gemcutter][gc] and in source form on [GitHub][gh].

[gc]: http://gemcutter.org/gems/urlify
[gh]: http://github.com/ionfish/urlify


API
---

    URLify.deaccentuate "Kurt Gödel"        # => "Kurt Godel"
    
    URLify.strip_subtitle "Begriffsschrift:
      eine der arithmetischen nachgebildete
      Formelsprache des reinen Denkens"     # => "Begriffsschrift"
    
    URLify.urlify "Über Sinn und Bedeutung" # => "uber_sinn_und_bedeutung"
    
    URLify.urlify "Moses Schönfinkel", "-"  # => "moses-schoenfinkel"

The `URLify` module may be mixed into the `String` class to add the above class
methods--`deaccentuate`, `strip_subtitle` and `urlify`--as instance methods on
the `String` class. It is not mixed in by default, for obvious reasons.

    class String
      include URLify
    end
    
    "Grundzüge der theoretischen Logik".urlify
      # => "grundzuge_der_theoretischen_logik"

Please note that non-`a-z` characters are removed by the `deaccentuate` and
`urlify` methods, and only characters in URLify's accent library will be
replaced by their ASCII counterparts. If the library doesn't include a
particular conversion, please consider forking the project and adding it.


Licence
-------

URLify is released under the BSD license. Please see the `LICENSE` file for
details.
