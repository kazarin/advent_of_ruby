# frozen_string_literal: true

module Y2019
  class Day7 < Base
    def part1
      max = -Float::INFINITY
      (0..4).to_a.permutation.each do |phase|
        s = 0
        phase.each do |i|
          output_queue = []
          input_queue = Queue.new
          input_queue << i
          input_queue << s
          intcode = Intcode.new(input, input_queue, output_queue)
          intcode.run
          next if output_queue.empty?

          s = output_queue.last
        end
        max = [s, max].max
      end
      max
    end

    def part2
      max = -Float::INFINITY
      (5..9).to_a.reverse.permutation.each do |phase|
        queues = build_queues(phase)
        threads =
          5.times.map do |i|
            Thread.new do
              intcode = Y2019::Intcode.new(input, queues[i], queues[(i + 1) % 5])
              intcode.run
            end
          end

        threads.each(&:join)
        output = threads.last.value.pop
        max = [output, max].max
      end
      max
    end

    private

    def build_queues(phase)
      5.times.each_with_object([]) do |i, queues|
        queue = Queue.new
        queue << phase[i]
        queue << 0 if i.zero?
        queues << queue
      end
    end
  end
end
