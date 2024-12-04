# frozen_string_literal: true

module ArrayWithoutNegativeIndex
  refine Array do
    alias_method :original_brackets, :[]

    def [](index)
      return nil if index.negative?

      original_brackets(index)
    end
  end
end

DIRECTIONS = ([-1, 0, 1].product([-1, 0, 1]) - [[0, 0]])
PATTERNS = [%w[S A M], %w[M A S]].freeze

class Day4
  using ArrayWithoutNegativeIndex
  def part1
    result = 0
    grid.each_with_index do |row, row_index|
      row.each.with_index do |_col, col_index|
        DIRECTIONS.each do |row_step, col_step|
          result += 1 if sequence?(row_index, col_index, row_step, col_step)
        end
      end
    end
    result
  end

  def sequence?(row_index, col_index, row_step, col_step)
    %w[X M A S].each_with_index.all? do |token, index|
      grid[row_index + (index * row_step)]&.[](col_index + (index * col_step)) == token
    end
  end

  def part2
    result = 0
    grid.each.with_index do |row, row_index|
      row.each.with_index do |_col, col_index|
        result += 1 if left_diagonal?(row_index, col_index) && right_diagonal?(row_index, col_index)
      end
    end
    result
  end

  private

  def left_diagonal?(row_index, col_index)
    PATTERNS.include?([
      grid[row_index - 1]&.[](col_index - 1), grid[row_index]&.[](col_index),
      grid[row_index + 1]&.[](col_index + 1)
    ])
  end

  def right_diagonal?(row_index, col_index)
    PATTERNS.include?([
      grid[row_index - 1]&.[](col_index + 1), grid[row_index]&.[](col_index),
      grid[row_index + 1]&.[](col_index - 1)
    ])
  end

  def grid
    @grid ||= input.split("\n").map(&:chars)
  end

  def input
    File.read('input/day4.txt')
  end
end
