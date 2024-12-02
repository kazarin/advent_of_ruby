# frozen_string_literal: true

class Day2
  def part1
    rows = input.split("\n").map { |row| row.split.map(&:to_i) }
    rows.reduce(0) do |acc, row|
      safe?(row) ? acc + 1 : acc
    end
  end

  def part2
    rows = input.split("\n").map { |row| row.split.map(&:to_i) }
    rows.reduce(0) do |acc, row|
      acc += if safe?(row)
               1
             else
               possibly_safe?(row) ? 1 : 0
             end
      acc
    end
  end

  private

  def input
    File.read('input/day2.txt')
  end

  def safe?(row) # rubocop:disable Metrics/CyclomaticComplexity
    direction = row[0] > row[1] ? :dec : :inc

    row.each_cons(2) do |el, next_el|
      diff = el - next_el
      return false if diff.positive? && direction == :inc
      return false if diff.negative? && direction == :dec

      return false unless (1..3).include? diff.abs
    end
    true
  end

  def possibly_safe?(row)
    row.length.times.map do |i|
      n = row[0...i] + row[i + 1..]
      return true if safe?(n)
    end
    false
  end
end
