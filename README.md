# Pcn2feen

[![Build Status](https://secure.travis-ci.org/cyril/pcn2feen.rb.png)](http://travis-ci.org/cyril/pcn2feen.rb)
[![Dependencies](https://gemnasium.com/cyril/pcn2feen.rb.png?travis)](https://gemnasium.com/cyril/pcn2feen.rb)
[![Gem Version](https://badge.fury.io/rb/pcn2feen.png)](http://badge.fury.io/rb/pcn2feen)

Pcn2feen is a converter from [Portable Chess Notation (PCN)](http://sashite.wiki/Portable-Chess-Notation) to [Forsyth–Edwards Expanded Notation (FEEN)](http://sashite.wiki/Forsyth-Edwards-Expanded-Notation), for programmer happiness.

## Installation

Add this line to your application's Gemfile:

    gem 'pcn2feen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pcn2feen

## Usage

``` ruby
require 'pcn2feen'
require 'json'

pcn_document = JSON.load('{
  "sides": {
    "bottom": { "name": "Alice",  "rating#": 1630 },
    "top":    { "name": "Bob",    "rating#": 1500 }
  },
  "state": "in_progress",
  "started_at": "2013-09-01T13:15:30Z",
  "starting_position": [
    ["x:r", "x:h", "x:e", "x:a", "x:_g","x:a", "x:e", "x:h", "x:r" ],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    [ null, "x:c",  null,  null,  null,  null,  null, "x:c",  null ],
    ["x:s",  null, "x:s",  null, "x:s",  null, "x:s",  null, "x:s" ],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    ["S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P" ],
    [ null, "S:B",  null,  null,  null,  null,  null, "S:R",  null ],
    ["S:L", "S:N", "S:S", "S:G", "S:_K","S:G", "S:S", "S:N", "S:L" ]
  ],
  "moves": [
    [["shift", 56, 47]],
    [["shift", 8, 17]],
    [["shift", 61, 52]],
    [["shift", 25, 24], ["shift", 24, 23], ["shift", 23, 22]]
  ],
  "rule": "20140101",
  "version": "1.0.0"
}')

Pcn2feen.load(pcn_document) # => "rheagaeh1/8r/1c2c4/s1s1s1s1s/9/2P4P1/PP1PPPP1P/1B5R1/LNSGKGSNL b - - -"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Links

* [PCN format](http://sashite.wiki/Portable-Chess-Notation)
* [FEEN format](http://sashite.wiki/Forsyth-Edwards-Expanded-Notation)

## License

Copyright (c) 2013 Cyril Wack. Released under the [MIT License](http://www.opensource.org/licenses/MIT).
