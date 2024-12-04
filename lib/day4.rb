# frozen_string_literal: true

module ArrayNegativeIndexPatch
  refine Array do
    alias_method :original_brackets, :[]

    def [](index)
      return nil if index.is_a?(Integer) && index < 0
      original_brackets(index)
    end
  end
end

class Day4
  using ArrayNegativeIndexPatch
  def part1
    tokens = input.split("\n").map(&:chars)

    result = 0

    tokens.each.with_index do |row, row_index|
      fw = bw = up = down = ne = se = nw = sw = 0

      row.each.with_index do |col, col_index|
        fw = row[col_index..col_index + 3] == ['X', 'M', 'A', 'S'] ? fw += 1 : fw
        bw = row[col_index-3..col_index] == ['S', 'A', 'M', 'X'] ? bw += 1 : bw
        up = [tokens[row_index]&.[](col_index),  tokens[row_index-1]&.[](col_index), tokens[row_index-2]&.[](col_index), tokens[row_index-3]&.[](col_index)] == ['X', 'M', 'A', 'S'] ? up += 1 : up
        down = [tokens[row_index]&.[](col_index),  tokens[row_index+1]&.[](col_index), tokens[row_index+2]&.[](col_index), tokens[row_index+3]&.[](col_index)] == ['X', 'M', 'A', 'S'] ? down += 1 : down
        ne = [tokens[row_index]&.[](col_index),  tokens[row_index-1]&.[](col_index-1), tokens[row_index-2]&.[](col_index-2), tokens[row_index-3]&.[](col_index-3)] == ['X', 'M', 'A', 'S'] ? ne += 1 : ne
        se = [tokens[row_index]&.[](col_index),  tokens[row_index+1]&.[](col_index-1), tokens[row_index+2]&.[](col_index-2), tokens[row_index+3]&.[](col_index-3)] == ['X', 'M', 'A', 'S'] ? se += 1 : se
        nw = [tokens[row_index]&.[](col_index),  tokens[row_index-1]&.[](col_index+1), tokens[row_index-2]&.[](col_index+2), tokens[row_index-3]&.[](col_index+3)] == ['X', 'M', 'A', 'S'] ? nw += 1 : nw
        sw = [tokens[row_index]&.[](col_index),  tokens[row_index+1]&.[](col_index+1), tokens[row_index+2]&.[](col_index+2), tokens[row_index+3]&.[](col_index+3)] == ['X', 'M', 'A', 'S'] ? sw += 1 : sw

      end
      result += fw + bw + up + down + + se + ne + nw + sw
    end
    result
  end


  def part2
    result = 0
    tokens = input.split("\n").map(&:chars)
    tokens.each.with_index do |row, row_index|
      row.each.with_index do |col, col_index|
        next unless col == 'A'
        mas1 = [['S', 'A', 'M'], ['M', 'A', 'S']].include?([tokens[row_index-1]&.[](col_index-1),  tokens[row_index]&.[](col_index), tokens[row_index+1]&.[](col_index+1)]) ? true : false
        mas2 = [['S', 'A', 'M'], ['M', 'A', 'S']].include?([tokens[row_index-1]&.[](col_index+1),  tokens[row_index]&.[](col_index), tokens[row_index+1]&.[](col_index-1)]) ? true : false

        if mas1 && mas2
          result += 1
        end
      end
    end
    result
  end

  private

  def input
    File.read('input/day4.txt')
  end
end

