URLify
======

A tiny library to convert diacritical marks to unaccented equivalents, for
ASCII-safe URI creation. It also includes a utility method to remove subtitles.


Installation
------------

    sudo gem install ionfish-urlify -s http://gems.github.com/


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

Copyright (c) 2009, Benedict Eastaugh. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

*   Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.
*   Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
*   The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
