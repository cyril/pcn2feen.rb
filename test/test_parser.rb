require_relative '_test_helper'

module Pcn2feen
  describe '#load' do
    it "generates the feen of the current Shogi vs Xiangqi board position" do
      Pcn2feen.load(
        JSON.load('{
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
      ).must_equal "rheagaeh1/8r/1c2c4/s1s1s1s1s/9/2P4P1/PP1PPPP1P/1B5R1/LNSGKGSNL b - - -"
    end

    it "generates the feen of the current Shogi vs Western board position" do
      Pcn2feen.load(
        JSON.load('{
          "sides": {
            "bottom": { "name": "Alice",  "rating#": 1630 },
            "top":    { "name": "Bob",    "rating#": 1500 }
          },
          "state": "in_progress",
          "started_at": "2013-09-01T13:15:30Z",
          "starting_position": [
            ["w:r", "w:n", "w:b", "w:q", "w:_k","w:m", "w:b", "w:n", "w:r" ],
            ["w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p" ],
            [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
            [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
            [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
            [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
            ["S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P" ],
            [ null, "S:B",  null,  null,  null,  null,  null, "S:R",  null ],
            ["S:L", "S:N", "S:S", "S:G", "S:_K","S:G", "S:S", "S:N", "S:L" ]
          ],
          "moves": [
            [["shift", 56, 47]],
            [["shift", 13, 31]],
            [["shift", 61, 52]],
            [["shift", 1, 20]],
            [["shift", 75, 66]]
          ],
          "rule": "20140101",
          "version": "1.0.0"
        }')
      ).must_equal "r1bqkmbnr/pppp1pppp/2n6/4p4/9/2P4P1/PP1PPPP1P/1B1G3R1/LNS1KGSNL t - 0,8 -"
    end
  end
end
