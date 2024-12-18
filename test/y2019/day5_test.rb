# frozen_string_literal: true

module Y2019
  class TestDay5 < Minitest::Test
    def setup
      @solution = Day5.new
    end

    def test_part1
      @solution.stub(:input, input) do
        out = capture_io do
          @solution.part1
        end
        assert_equal "125\n", out.join
      end
    end

    def test_part2
      @solution.stub(:input, input) do
        # assert_equal 27, @solution.part2
      end
    end

    private

    def input
      '3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99'
    end
  end
end
