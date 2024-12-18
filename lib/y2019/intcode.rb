# frozen_string_literal: true

module Y2019
  class Intcode
    def initialize(input)
      @input = input
    end

    def instructions
      @instructions ||= @input.split(',').map(&:to_i)
    end

    def opcode3(value, position)
      instructions[position] = value
    end

    def opcode4(position)
      instructions[position]
    end

    def offset_for(opcode)
      case opcode
      when 3, 4
        2
      else
        4
      end
    end

    def opcode1(vals, left)
      a = get_arg(*vals[0])
      b = get_arg(*vals[1])
      instructions[instructions[left + 3]] = a + b
    end

    def opcode2(vals, left)
      a = get_arg(*vals[0])
      b = get_arg(*vals[1])
      instructions[instructions[left + 3]] = a * b
    end

    def run(op3 = 0)
      left = 0
      offset = offset_for(instructions.first)
      while left < instructions.length - offset
        command = instructions[left].to_s.rjust(4, '0')
        opcode = command[-2..].to_i
        modes = command[0...-2].reverse.chars.map(&:to_i)
        vals = modes.zip([instructions[left + 1], instructions[left + 2]])

        case opcode
        when 1
          opcode1(vals, left)
        when 2
          opcode2(vals, left)
        when 3
          opcode3(op3, instructions[left + 1])
        when 4
          puts get_arg(*vals[0])
        when 99
          return
        end
        left += offset_for(opcode)
      end
    end

    def get_arg(mode, value)
      # positional
      if mode.zero?
        instructions[value]
      # immediate
      else
        value
      end
    end
  end
end
