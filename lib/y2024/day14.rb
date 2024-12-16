# frozen_string_literal: true

module Y2024
  class Day14 < Base
    MAX_X = 101
    MAX_Y = 103
    Robot = Struct.new(:x, :y, :vx, :vy) do
      def coords
        [x, y]
      end

      def move!
        self.x = (x + vx) % MAX_X
        self.y = (y + vy) % MAX_Y
      end
    end

    def part1
      100.times { robots.each(&:move!) }

      hash = {}

      robots.each do |robot|
        hash[robot.coords] ||= 0
        hash[robot.coords] += 1
      end

      Array.new(4) { 0 }

      count_per_quadrant(hash).reduce(:*)
    end

    def part2; end

    private

    def robots
      @robots ||= input.split("\n").each_with_object([]) do |row, robots|
        values =  row.scan(/-?\d+/).map(&:to_i)
        robots << Robot.new(*values)
      end
    end

    def count_per_quadrant(coords) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      mid_x = MAX_X / 2
      mid_y = MAX_Y / 2
      coords.each_with_object([0, 0, 0, 0]) do |((x, y), count), quadrants|
        quadrants[0] += count if x < mid_x && y < mid_y
        quadrants[1] += count if x < mid_x && y > mid_y
        quadrants[2] += count if x > mid_x && y < mid_y
        quadrants[3] += count if x > mid_x && y > mid_y
      end
    end
  end
end
