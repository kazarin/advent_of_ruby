# frozen_string_literal: true

module Y2019
  class Day2 < Base
    def run(instructions, x1, y1)
      instructions[1] = x1
      instructions[2] = y1
      left = 0
      while left < instructions.length - 4
        opcode = instructions[left]
        pos1 = instructions[instructions[left + 1]]
        pos2 = instructions[instructions[left + 2]]
        case opcode
        when 1
          instructions[instructions[left + 3]] = pos1 + pos2
        when 2
          instructions[instructions[left + 3]] = pos1 * pos2
        end
        left += 4
      end
      instructions[0]
    end

    def part1
      instructions = input.split(',').map(&:to_i)
      run(instructions, 12, 2)
    end

    def part2
      instructions = input.split(',').map(&:to_i)
      (0..99).to_a.repeated_permutation(2).each do |(a, b)|
        output = run(instructions.dup, a, b)
        return (100 * a) + b if output == 19_690_720
      end
    end
  end
end
