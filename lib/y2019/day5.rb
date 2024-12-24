# frozen_string_literal: true

module Y2019
  class Day5 < Base
    def part1
      output_queue = []
      Thread.new do
        intcode = Intcode.new(input, [1], output_queue)
        intcode.run([1])
      end.join
      output_queue.last
    end

    def part2
      output_queue = []
      Thread.new do
        intcode = Intcode.new(input, [5], output_queue)
        intcode.run([5])
      end.join
      output_queue.last
    end
  end
end
