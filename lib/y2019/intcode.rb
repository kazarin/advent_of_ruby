# frozen_string_literal: true

module Y2019
  class Intcode
    class Opcode
      attr_reader :instructions

      def initialize(instructions, pointer, output, input_queue, output_queue)
        @instructions = instructions
        @pointer = pointer
        @output = output
        @input_queue = input_queue
        @output_queue = output_queue
      end

      def debug
        p "opcode: #{command[-2..]}, args: #{available_args}, args_with_modes: #{values}"
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
        @pointer + 4
      end
    end

    class Opcode2 < Opcode
      def proceed
        @instructions[@instructions[@pointer + 3]] = arg1 * arg2
        @pointer + 4
      end
    end

    class Opcode3 < Opcode
      def proceed
        loop do
          sleep 1 / 10_000_000
          next if @input_queue.empty?

          value = @input_queue.pop
          @instructions[@instructions[@pointer + 1]] = value
          return @pointer + 2
        end
      end
    end

    class Opcode5 < Opcode
      def proceed
        return arg2 unless arg1.zero?

        @pointer + 3
      end
    end

    class Opcode6 < Opcode
      def proceed
        return arg2 if arg1.zero?

        @pointer + 3
      end
    end

    class Opcode7 < Opcode
      def proceed
        @instructions[@instructions[@pointer + 3]] = arg1 < arg2 ? 1 : 0
        @pointer + 4
      end
    end

    class Opcode8 < Opcode
      def proceed
        @instructions[@instructions[@pointer + 3]] = arg1 == arg2 ? 1 : 0
        @pointer + 4
      end
    end

    class Opcode4 < Opcode
      def proceed
        return @pointer + 2 if arg1.zero?

        @output_queue << arg1
        @pointer + 2
      end
    end

    class Opcode99 < Opcode
      def proceed
        @pointer + 4
      end
    end

    def initialize(input, input_queue = Queue.new, output_queue = Queue.new)
      @input = input
      @output = []
      @input_queue = input_queue
      @output_queue = output_queue
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

    def run(_op3 = 0)
      left = 0
      offset = offset_for(instructions.first)
      loop do
        command = instructions[left].to_s.rjust(4, '0')
        opcode = command[-2..].to_i

        return @output_queue if opcode == 99

        if [1, 2, 3, 4, 5, 6, 7, 8, 99].include?(opcode)
          klass = Intcode.const_get("Opcode#{opcode}")
          obj = klass.new(instructions, left, @output, @input_queue, @output_queue)
          offset = obj.proceed
        else
          offset = left + 4
        end
        left = offset
      end
    end
  end
end
