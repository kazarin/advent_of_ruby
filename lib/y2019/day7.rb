# frozen_string_literal: true

module Y2019
  class Day7 < Base
    def part1
      max = -Float::INFINITY
      (0..4).to_a.permutation.each do |phase|
        s = 0
        phase.each do |i|
          intcode = Intcode.new(input)
          output = intcode.run([i, s])
          next if output.empty?

          s = output.last
        end
        max = s if s > max
      end
      max
    end

    def part2; end
  end
end
