# frozen_string_literal: true

module Y2019
  class Intcode
    class Opcode
      attr_reader :instructions

      def initialize(instructions, pointer)
        @instructions = instructions
        @pointer = pointer
      end

      def debug
        # p "opcode: #{command[-2..]}, args: #{available_args}, args_with_modes: #{values}"
      end

      def command
        @command ||= @instructions[@pointer].to_s.rjust(4, '0')
      end

      def available_args
        [@instructions[@pointer + 1], @instructions[@pointer + 2]]
      end

      def values
        modes.zip(available_args)
      end

      def modes
        command[0...-2].reverse.chars.map(&:to_i)
      end

      def arg((mode, value))
        if mode.zero?
          @instructions[value]
        else
          value
        end
      end

      def arg1
        arg(values[0])
      end

      def arg2
        arg(values[1])
      end
    end

    class Opcode1 < Opcode
      def proceed
        @instructions[@instructions[@pointer + 3]] = arg1 + arg2
      end
    end

    class Opcode2 < Opcode
      def proceed
        @instructions[@instructions[@pointer + 3]] = arg1 * arg2
      end
    end

    class Opcode3 < Opcode
      def proceed(op3)
        @instructions[@instructions[@pointer + 1]] = op3
      end
    end

    class Opcode4 < Opcode
      def proceed
        return if arg1.zero?

        p arg1
      end
    end

    class Opcode99 < Opcode
      def proceed; end
    end

    def initialize(input)
      @input = input
    end

    def opcode3(value, position)
      instructions[position] = value
    end

    def instructions
      @instructions ||= @input.split(',').map(&:to_i)
    end

    def offset_for(opcode)
      case opcode
      when 3, 4
        2
      else
        4
      end
    end

    def run(op3 = 0)
      left = 0
      offset = offset_for(instructions.first)
      while left < instructions.length - offset
        command = instructions[left].to_s.rjust(4, '0')
        opcode = command[-2..].to_i

        return if opcode == 99

        if [1, 2, 3, 4, 99].include?(opcode)
          klass = Intcode.const_get("Opcode#{opcode}")
          obj = klass.new(instructions, left)
          opcode == 3 ? obj.proceed(op3) : obj.proceed
        end

        left += offset_for(opcode)
      end
    end
  end
end
