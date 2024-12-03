# frozen_string_literal: true

class Day1
  def part1
    cols = prepared_input.transpose.map(&:sort).transpose

    cols.sum { |row| (row[1] - row[0]).abs }
  end

  def part2
    cols = prepared_input.transpose
    occurences = cols[1].tally
    cols[0].sum { |num| num * (occurences[num] || 0) }
  end

  private

  def input
    File.read('input/day1.txt')
  end

  def prepared_input
    @prepared_input ||= input.strip.split("\n").map { |row| row.split('   ').map(&:to_i) }
  end
end
