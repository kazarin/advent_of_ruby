# frozen_string_literal: true

class Day8 < Base
  def part1
    output = Set.new
    antennas.each_value do |coords|
      coords.permutation(2).each do |(x1, y1), (x2, y2)|
        p1x, p1y = apply_distance(x1, y1, x2, y2, 1)
        output += [[p1x, p1y]] if grid.key? [p1x, p1y]
      end
    end
    output.size
  end

  def part2
    output = Set.new
    antennas.each_value do |coords|
      coords.permutation(2).each do |(x1, y1), (x2, y2)|
        (0..100).each do |m|
          p1x, p1y = apply_distance(x1, y1, x2, y2, m)
          output += [[p1x, p1y]] if grid.key? [p1x, p1y]
        end
      end
    end
    output.size
  end

  private

  def apply_distance(x1, y1, x2, y2, m)
    [x1 + (m * (x1 - x2)), y1 + (m * (y1 - y2))]
  end

  def grid
    @grid ||= prepare[0]
  end

  def antennas
    @antennas ||= prepare[1]
  end

  def prepare
    @prepare ||=
      begin
        hash = {}
        antennas = {}
        input.split("\n").each_with_index do |row, row_index|
          row.chars.each_with_index do |col, col_index|
            hash[[row_index, col_index]] = col
            if col != '.'
              antennas[col] ||= []
              antennas[col] << [row_index, col_index]
            end
          end
        end
        [hash, antennas]
      end
  end
end
