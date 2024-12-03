# frozen_string_literal: true

class Day3
  def part1
    input.scan(/mul\(?(\d*),?(\d*)\)/).sum { |row| row[0].to_i * row[1].to_i }
  end

  def part2
    instructions = input.scan(/mul\(\d*,\d*\)|don't\(\)|do\(\)/)
    enabled = true
    instructions.sum do |row|
      enabled = false if row == "don't()"
      enabled = true if row == 'do()'
      enabled && row != 'do()' ? calculate(row) : 0
    end
  end

  private

  def calculate(row)
    a, b = row.scan(/(\d*),(\d*)/).flatten.map(&:to_i)
    a * b
  end

  def input
    File.read('input/day3.txt')
  end
end
