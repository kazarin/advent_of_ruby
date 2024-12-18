# frozen_string_literal: true

module Y2019
  class Day4 < Base
    def part1
      start, stop = input.split('-').map(&:to_i)
      (start..stop).sum do |password|
        valid?(password, -> (count) { count >= 2 }) ? 1 : 0
      end
    end

    def part2
      start, stop = input.split('-').map(&:to_i)
      (start..stop).sum do |password|
        valid?(password, -> (count) { count == 2 }) ? 1 : 0
      end
    end

    def valid?(password, cond)
      numbers = password.to_s.chars.map(&:to_i)
      return false if numbers != numbers.sort

      values = numbers.chunk_while { |a, b| a == b }.map { |chunk| [chunk.first, chunk.size] }
      values.any? { |_num, count| cond.call(count) }
    end
  end
end
