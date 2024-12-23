# frozen_string_literal: true

class Day5 < Base
  def part1
    updates.sum { |row| sort(row) == row ? row[row.length / 2] : 0 }
  end

  def part2
    updates.sum do |row|
      sorted_row = sort(row)
      sorted_row == row ? 0 : sorted_row[row.length / 2]
    end
  end

  private

  def sort(row)
    row.sort do |a, b|
      if b == a
        0
      elsif (rules[a] || []).include?(b)
        -1
      else
        1
      end
    end
  end

  def rules
    @rules ||=
      input.split("\n\n").first.split("\n").map { |e| e.split('|').map(&:to_i) }.each_with_object({}) do |(a, b), acc|
        acc[a] ||= []
        acc[a] << b
      end
  end

  def updates
    @updates ||= input.split("\n\n")[1].split("\n").map { |e| e.split(',').map(&:to_i) }
  end
end
