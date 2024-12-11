# frozen_string_literal: true

class Day11 < Base
  CACHE = {}
  def part1
    initial_stones.sum do |stone|
      count_transforms(stone, 25)
    end
  end

  def part2
    initial_stones.sum do |stone|
      count_transforms(stone, 75)
    end
  end

  private

  def count_transforms(stone, i)
    return 1 if i.zero?

    CACHE[[stone, i]] ||=
      if stone.zero?
        count_transforms(1, i - 1)
      elsif even_digits?(stone)
        digits = Math.log10(stone).floor + 1
        half = digits / 2
        divisor = 10**half

        count_transforms(stone / divisor, i - 1) + count_transforms(stone % divisor, i - 1)
      else
        count_transforms(stone * 2024, i - 1)
      end
  end

  def initial_stones
    @initial_stones ||= input.split.map(&:to_i)
  end

  def even_digits?(stone)
    (Math.log10(stone).floor + 1).even?
  end
end
