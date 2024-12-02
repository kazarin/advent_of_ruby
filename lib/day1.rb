# frozen_string_literal: true

class Day1
  def part1
    cols = input.strip.split("\n").map { |row| row.split('   ').map(&:to_i) }.transpose.map(&:sort).transpose

    cols.reduce(0) do |acc, row|
      acc += (row[1] - row[0]).abs
      acc
    end
  end

  def part2
    cols = input.strip.split("\n").map { |row| row.split('   ').map(&:to_i) }.transpose
    occurences = cols[1].tally
    cols[0].reduce(0) do |acc, num|
      acc += num * (occurences[num] || 0)
      acc
    end
  end

  private

  def input
    File.read('input/day1.txt')
  end
end
