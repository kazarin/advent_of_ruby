# frozen_string_literal: true

module Y2019
  class Day6 < Base
    def tree
      @tree ||=
        input.split("\n").each_with_object({}) do |row, hash|
          from, to = row.split(')')
          hash[to] = from
        end
    end

    def part1
      output = []
      tree.each_key do |k|
        traverse(tree, k, output)
      end
      output.size
    end

    def part2
      you = []
      traverse(tree, 'YOU', you)
      you.reverse!
      santa = []
      traverse(tree, 'SAN', santa)
      santa.reverse!

      left = 0
      loop do
        break unless santa[left] == you[left]

        left += 1
      end
      (santa.length - left) + (you.length - left)
    end

    private

    def traverse(hash, key, output)
      return if hash[key].nil?

      output << hash[key]
      traverse(hash, hash[key], output)
    end
  end
end
