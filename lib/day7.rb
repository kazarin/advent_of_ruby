# frozen_string_literal: true

class Day7 < Base
  def part1
    rows.sum do |row|
      to_check = row[0]
      values = row[1..]
      ops = ['*', '+']
      combinations = ops.repeated_permutation(values.size - 1).to_a

      possible_combinations = combinations.map do |operators|
        values.zip(operators).flatten.compact
      end
      check_combinations(possible_combinations, to_check)
    end
  end

  def check_combinations(possible_combinations, to_check)
    possible_combinations.each do |comb|
      result = comb[0]
      comb[1..].each_slice(2) do |op, val|
        result = op == '||' ? (result.to_s + val.to_s).to_i : result.send(op, val)
      end
      return to_check if to_check == result
    end
    0
  end

  def rows
    @rows ||=
      input.split("\n").map do |row|
        row.scan(/\d+/).map(&:to_i)
      end
  end

  def part2
    rows.sum do |row|
      to_check = row[0]
      values = row[1..]
      ops = ['*', '+', '||']
      combinations = ops.repeated_permutation(values.size - 1).to_a

      possible_combinations = combinations.map do |operators|
        values.zip(operators).flatten.compact
      end
      check_combinations(possible_combinations, to_check)
    end
  end
end
