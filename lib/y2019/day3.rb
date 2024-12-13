# frozen_string_literal: true

module Y2019
  class Day3 < Base
    def part1
      wire1, wire2 = input.split("\n")
      w1_visited = start(wire1)
      w2_visited = start(wire2)
      intersections = w1_visited & w2_visited
      intersections.map { |a| a[0].abs + a[1].abs }.min
    end

    def part2
      wire1, wire2 = input.split("\n")
      w1_visited = start(wire1)
      w2_visited = start(wire2)
      intersections = w1_visited & w2_visited
      intersections.map do |n|
        w1_visited.index(n) + w2_visited.index(n)
      end.min + 2
    end

    private

    def start(wire)
      x = 0
      y = 0
      visited = []
      wire.split(',').each do |step|
        x, y = move(x, y, step, visited)
      end
      visited
    end

    def move(x, y, instruction, visited)
      dir = instruction[0]
      value = instruction[1..].to_i
      value.times do
        case dir
        when 'R'
          x += 1
        when 'L'
          x -= 1
        when 'U'
          y += 1
        when 'D'
          y -= 1
        end
        visited << [x, y]
      end
      [x, y]
    end
  end
end
