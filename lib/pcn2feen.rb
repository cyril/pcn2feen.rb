require 'pcn2feen/version'

class Object
  def deep_map(&block)
    block.call(self)
  end
end

class Array
  def deep_map(&block)
    map {|e| e.deep_map(&block) }
  end
end

module Pcn2feen
  def self.load(pcn)
    position = pcn['starting_position']
    captured_pieces = []
    western_piece_are_on_the_board = false
    position.deep_map do |square|
      next unless square
      western_piece_are_on_the_board = true if square.match(/^w:\+?\^k$/i)
    end
    if western_piece_are_on_the_board
      en_passant = nil
      western_rooks_had_not_previously_moved_squares = []
      i = 0
      position.deep_map do |square|
        western_rooks_had_not_previously_moved_squares << i if square.to_s.match(/^w:\+?r$/i)
        i += 1
      end
      western_rooks_had_not_previously_moved_squares
      if western_rooks_had_not_previously_moved_squares.any?
        western_top_king_was_moved = false
        western_bottom_king_was_moved = false
      end
    end

    pcn['previous_moves'].each do |previous_move|
      en_passant = nil

      previous_move.each do |action|
        if action[0] == 'shift'
          action[3] = {} unless action[3]

          piece = nil

          i = 0
          position = position.deep_map do |square|
            if action[1] == i
              piece = square
              square = nil

              if piece.match(/^w:\+?\^k$/)
                western_top_king_was_moved = true
              elsif piece.match(/^W:\+?\^K$/)
                western_bottom_king_was_moved = true
              elsif piece.match(/^w:\+?r$/i)
                western_rooks_had_not_previously_moved_squares.delete(i)
              end
            end

            i += 1
            square
          end

          i = 0
          position = position.deep_map do |square|
            if action[2] == i
              square = piece
              square = action[3]['promote_to'] if action[3]['promote_to']

              # en passant
              if previous_move[0][0] == 'shift' && previous_move[1] && previous_move[1][0] == 'shift' && piece.match(/^w:\+?p$/i)
                en_passant = previous_move[0][2]
              end
            end

            i += 1
            square
          end
        elsif action[0] == 'remove'
          action[4] = {} unless action[4]

          piece = nil

          i = 0
          position = position.deep_map do |square|
            if action[1] == i
              piece = square
              square = nil

              if piece.match(/^w:\+?\^k$/)
                western_top_king_was_moved = true
              elsif piece.match(/^W:\+?\^K$/)
                western_bottom_king_was_moved = true
              elsif piece.match(/^w:\+?r$/i)
                western_rooks_had_not_previously_moved_squares.delete(i)
              end
            end

            i += 1
            square
          end

          i = 0
          position = position.deep_map do |square|
            if action[2] == i
              captured_pieces << (square.upcase == square ? square.downcase : square.upcase) if action[3]
              square = piece
              square = action[4]['promote_to'] if action[4]['promote_to']
            end

            i += 1
            square
          end
        elsif action[0] == 'drop'
          action[3] = {} unless action[3]

          if captured_piece = captured_pieces.delete(action[1])
            i = 0
            position = position.deep_map do |square|
              if action[2] == i
                square = captured_piece
              end

              i += 1
              square
            end
          else
            raise "Can not drop!"
          end
        end
      end
    end

    arr = position
    lvl = dimensions(arr)

    squares = squares_separators(arr, lvl)

    while squares.match(/[0-9],[0-9]/)
      squares.gsub!(/([0-9]),([0-9])/) { $1.to_i + $2.to_i }
    end

    current_options = {captured_pieces: captured_pieces}
    current_options.merge!({castle: western_rooks_had_not_previously_moved_squares, en_passant: en_passant}) if western_piece_are_on_the_board
    "#{squares} #{active_side(pcn)} #{options(current_options)}"
  end

  private

  def self.active_side(pcn)
    pcn['next_turn'][0]
  end

  def self.options(options)
    arr = []

    if options[:captured_pieces] && options[:captured_pieces].any?
      arr << "captures:[#{options[:captured_pieces].sort.join(',')}]"
    end

    if options[:castle] && options[:castle].any?
      arr << "castle:[#{options[:castle].sort.join(',')}]"
    end

    if options[:en_passant]
      arr << "en_passant:#{options[:en_passant]}"
    end

    arr.sort.join(',')
  end

  def self.dimensions(arr, lvl_id = 1)
    arr[0].class == Array ? dimensions(arr[0], lvl_id + 1) : lvl_id
  end

  def self.squares_separators(arr, lvl)
    if lvl == 1
      arr.map {|square| square ? square : 1 }.join(',')
    else
      arr.map {|sub_arr| squares_separators(sub_arr, lvl - 1) }.join('/' * (lvl - 1))
    end
  end
end
