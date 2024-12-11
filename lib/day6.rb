# frozen_string_literal: true

DIRECTIONS = {
  '^' => [-1, 0],
  '>' => [0, 1],
  'v' => [1, 0],
  '<' => [0, -1]
}.freeze

ROTATIONS = {
  '^' => '>',
  '>' => 'v',
  'v' => '<',
  '<' => '^'
}.freeze

class Day6 < Base
  def prepare
    hash = {}
    start = nil
    input.split("\n").each_with_index do |row, row_index|
      row.chars.each_with_index do |col, col_index|
        hash[[row_index, col_index]] = col != '#'
        start = [row_index, col_index] if col == '^'
      end
    end
    [hash, start]
  end

  def grid
    @grid ||= prepare[0]
  end

  def guard_started_at
    @guard_started_at ||= prepare[1]
  end

  def part1
    run(guard_started_at, '^', Set.new([[guard_started_at]]))
  end

  def part2
    run2(guard_started_at, '^', Set.new([[guard_started_at, '^']]), true)
  end

  def run2(pos, dir, seen, looped)
    loops = 0
    loop do
      next_pos = DIRECTIONS[dir].zip(pos).map(&:sum)
      case grid[next_pos]
      when true
        if looped
          grid[next_pos] = false
          loops += 1 if seen.none? { |v_pos, _| v_pos == next_pos } && run2(pos, dir, seen.dup, false)
          grid[next_pos] = true
        end
        pos = next_pos
        return true unless seen.add? [pos, dir]
      when false
        dir = ROTATIONS[dir]
      when nil
        return looped && loops
      end
    end
  end

  def run(pos, dir, seen)
    loop do
      next_pos = DIRECTIONS[dir].zip(pos).map(&:sum)
      case grid[next_pos]
      when true
        pos = next_pos
        seen.add [pos]
      when false
        dir = ROTATIONS[dir]
      when nil
        return seen.count
      end
    end
  end
end
