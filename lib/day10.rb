# frozen_string_literal: true

class Day10 < Base
  DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  def part1
    start_points.sum do |current|
      visited = {}
      traverse(current, 0, visited)
      visited.count
    end
  end

  def part2
    start_points.sum do |current|
      visited = {}
      traverse(current, 0, visited)
      visited.values.sum
    end
  end

  private

  def traverse(current, height, visited)
    if height == 9
      visited[current] ||= 0
      visited[current] += 1
      return visited
    end

    DIRECTIONS.each do |a, b|
      next_a = a + current[0]
      next_b = b + current[1]
      traverse([next_a, next_b], height + 1, visited) if map[[next_a, next_b]] == height + 1
    end
  end

  def map
    @map ||= prepare[0]
  end

  def start_points
    @start_points ||= prepare[1]
  end

  def prepare
    @prepare ||=
      begin
        grid = {}
        heads = []
        input.split("\n").each_with_index do |row, row_index|
          row.chars.each_with_index do |col, col_index|
            value = col.to_i
            coords = [row_index, col_index]
            grid[[row_index, col_index]] = col.to_i
            heads << coords if value.zero?
          end
        end
        [grid, heads]
      end
  end
end
