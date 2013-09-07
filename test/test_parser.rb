require_relative '_test_helper'
require 'json'

module Pcn2feen
  describe '#load' do
    describe 'Shogi vs Xiangqi' do
      it "generates the feen" do
        Pcn2feen.load(
          JSON.load('{
            "...possible_moves": null,
            "...result?": true,
            "bottom": {"nicename": "Alice", "rating#": 1630},
            "next_turn": "bottom",
            "over?": true,
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
        ).must_equal "x:r,x:h,x:e,x:a,x:^g,x:a,x:e,x:h,1/8,x:r/1,x:c,2,x:c,4/x:s,1,x:s,1,x:s,1,x:s,1,x:s/9/2,S:P,4,S:P,1/S:P,S:P,1,S:P,S:P,S:P,S:P,1,S:P/1,S:B,5,S:R,1/S:L,S:N,S:S,S:G,S:^K,S:G,S:S,S:N,S:L b "
      end
    end

    describe 'Shogi vs Western' do
      it "generates the feen" do
        Pcn2feen.load(
          JSON.load('{
            "...possible_moves": null,
            "...result?": true,
            "bottom": {"nicename": "Alice", "rating#": 1630},
            "next_turn": "top",
            "over?": true,
            "previous_moves": [
              [["shift", 56, 47]],
              [["shift", 13, 31]],
              [["shift", 61, 52]],
              [["shift", 1, 20]],
              [["shift", 75, 66]]
            ],
            "started_at": "2013-09-01T13:15:30Z",
            "starting_position": [
              ["w:r", "w:n", "w:b", "w:q", "w:^k", "w:m", "w:b", "w:n", "w:r"],
              ["w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p", "w:p" ],
              [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
              [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
              [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
              [ null,  null,  null,  null,  null,  null,  null,  null,  null ],
              ["S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P", "S:P" ],
              [ null, "S:B",  null,  null,  null,  null,  null, "S:R",  null ],
              ["S:L", "S:N", "S:S", "S:G", "S:^K", "S:G", "S:S", "S:N", "S:L"]
            ],
            "top": {"nicename": "Bob", "rating#": 1500}
          }')
        ).must_equal "w:r,1,w:b,w:q,w:^k,w:m,w:b,w:n,w:r/w:p,w:p,w:p,w:p,1,w:p,w:p,w:p,w:p/2,w:n,6/4,w:p,4/9/2,S:P,4,S:P,1/S:P,S:P,1,S:P,S:P,S:P,S:P,1,S:P/1,S:B,1,S:G,3,S:R,1/S:L,S:N,S:S,1,S:^K,S:G,S:S,S:N,S:L t castle:[0,8]"
      end
    end
  end
end
