# Pcn2feen

[![Build Status](https://secure.travis-ci.org/cyril/pcn2feen.rb.png)](http://travis-ci.org/cyril/pcn2feen.rb)
[![Dependencies](https://gemnasium.com/cyril/pcn2feen.rb.png?travis)](https://gemnasium.com/cyril/pcn2feen.rb)
[![Gem Version](https://badge.fury.io/rb/pcn2feen.png)](http://badge.fury.io/rb/pcn2feen)

Pcn2feen is a converter from [Portable Chess Notation (PCN)](https://developer.sashite.com/documents/pcn/1.0.0) to [Forsyth–Edwards Expanded Notation (FEEN)](https://developer.sashite.com/documents/feen/1.0.0), for programmer happiness.

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
  "...possible_moves": null,
  "...result?": null,
  "bottom": {"nicename": "Alice", "rating#": 1630},
  "next_turn": "bottom",
  "over?": false,
  "previous_moves": [
    [["shift", 56, 47]],
    [["shift", 8, 17]],
    [["shift", 61, 52]],
    [["shift", 25, 24], ["shift", 24, 23], ["shift", 23, 22]]
  ],
  "started_at": "2013-09-01T13:15:30Z",
  "starting_position": [
    ["x:r", "x:h", "x:e", "x:a", "x:^g", "x:a", "x:e", "x:h", "x:r"],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    [ null, "x:c",  null,  null,  null,  null,  null, "x:c",  null ],
    ["x:s",  null, "x:s",  null, "x:s",  null, "x:s",  null, "x:s" ],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
    ["S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P" ],
    [ null, "S:B",  null,  null,  null,  null,  null, "S:R",  null ],
    ["S:L", "S:N", "S:S", "S:G", "S:^K", "S:G", "S:S", "S:N", "S:L"]
  ],
  "top": {"nicename": "Bob", "rating#": 1500}
}')

Pcn2feen.load(pcn_document) # => "x:r,x:h,x:e,x:a,x:^g,x:a,x:e,x:h,1/8,x:r/1,x:c,2,x:c,4/x:s,1,x:s,1,x:s,1,x:s,1,x:s/9/2,S:P,4,S:P,1/S:P,S:P,1,S:P,S:P,S:P,S:P,1,S:P/1,S:B,5,S:R,1/S:L,S:N,S:S,S:G,S:^K,S:G,S:S,S:N,S:L b"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Links

* [PCN format](https://developer.sashite.com/documents/pcn/1.0.0)
* [FEEN format](https://developer.sashite.com/documents/feen/1.0.0)

## License

Copyright (c) 2013 Cyril Wack. Released under the [MIT License](http://www.opensource.org/licenses/MIT).
