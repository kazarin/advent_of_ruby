# frozen_string_literal: true

module Y2019
  class Day2 < Base
    def part1
      intcode = Intcode.new(input)
      intcode.opcode3(12, 1)
      intcode.opcode3(2, 2)
      intcode.run
      intcode.instructions[0]
    end

    def part2
      (0..99).to_a.repeated_permutation(2).each do |(a, b)|
        intcode = Intcode.new(input)
        intcode.opcode3(a, 1)
        intcode.opcode3(b, 2)
        intcode.run
        output = intcode.instructions[0]
        return (100 * a) + b if output == 19_690_720
      end
    end
  end
end
