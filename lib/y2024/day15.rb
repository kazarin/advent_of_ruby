# frozen_string_literal: true

module Y2024
  class Day15 < Base
    DIRECTIONS = {
      '^' => [-1, 0],
      'v' => [1, 0],
      '>' => [0, 1],
      '<' => [0, -1]
    }.freeze

    def part1
      field_rows, movement_rows = input.split("\n\n")
      field = {}
      start = nil
      field_rows.split("\n").each_with_index do |row, row_index|
        row.chars.each_with_index do |c, col_index|
          field[[row_index, col_index]] = c == '.' ? nil : c
          start = [row_index, col_index] if c == '@'
        end
      end
      a = start
      movement_rows.split("\n").join.chars.each do |dir|
        b = find_next_pos(dir, a)
        a = move(field, dir, a, b)
      end

      field.sum { |(x, y), v| v == 'O' ? (100 * x) + y : 0 }
    end

    def part2
      field_rows, movement_rows = input.split("\n\n")
      field = {}
      start = nil
      res = []
      field_rows.split("\n").each do |row|
        row = row.chars.map! do |c|
          case c
          when '.'
            '..'
          when '#'
            '##'
          when 'O'
            '[]'
          when '@'
            '@.'
          end
        end
        res << row.join
      end
      res.each_with_index do |row, row_index|
        row.chars.each_with_index do |c, col_index|
          field[[row_index, col_index]] = c == '.' ? nil : c
          start = [row_index, col_index] if c == '@'
        end
      end
      a = start
      movement_rows.split("\n").join.chars.each do |dir|
        b = find_next_pos(dir, a)
        a = move(field, dir, a, b)
      end
      field.sum { |(x, y), v| v == '[' ? (100 * x) + y : 0 }
    end

    def move(field, dir, a, b)
      current = field[a]
      case field[b]
      when nil
        field[b] = current
        field[a] = nil
        b
      when '#'
        a
      when 'O'
        if b == move(field, dir, b, find_next_pos(dir, b))
          a
        else
          field[b] = current
          field[a] = nil
          b
        end
      else
        if ['<', '>'].include?(dir)
          if b == move(field, dir, b, find_next_pos(dir, b))
            a
          else
            field[b] = current
            field[a] = nil
            b
          end
        else
          other =
            if field[b] == '['
              find_next_pos('>', b)
            else
              find_next_pos('<', b)
            end
          if can_move?(field, dir, b, find_next_pos(dir, b)) && can_move?(field, dir, other, find_next_pos(dir, other))
            move(field, dir, b, find_next_pos(dir, b))
            move(field, dir, other, find_next_pos(dir, other))
            field[a] = nil
            field[b] = current
            field[other] = nil
            b
          else
            a
          end
        end
      end
    end

    private

    def can_move?(field, dir, _a, b)
      case field[b]
      when nil
        true
      when '#'
        false
      else
        other =
          if field[b] == '['
            find_next_pos('>', b)
          else
            find_next_pos('<', b)
          end
        can_move?(field, dir, b, find_next_pos(dir, b)) && can_move?(field, dir, other, find_next_pos(dir, other))
      end
    end

    def find_next_pos(dir, current)
      current.zip(DIRECTIONS[dir]).map(&:sum)
    end
  end
end
