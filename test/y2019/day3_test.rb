# frozen_string_literal: true

module Y2019
  class TestDay3 < Minitest::Test
    def setup
      @solution = Day3.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 6, @solution.part1
      end
    end

    def test_part2
      @solution.stub(:input, input) do
        assert_equal 30, @solution.part2
      end
    end

    private

    def input
      'R8,U5,L5,D3
U7,R6,D4,L4'
    end

    def input2
      'R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83'
    end
  end
end
