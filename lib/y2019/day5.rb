# frozen_string_literal: true

module Y2019
  class Day5 < Base
    def part1
      intcode = Intcode.new(input)
      intcode.run([1])
    end

    def part2
      intcode = Intcode.new(input)
      intcode.run([5])
    end
  end
end
