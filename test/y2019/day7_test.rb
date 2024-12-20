# frozen_string_literal: true

module Y2019
  class TestDay7 < Minitest::Test
    def setup
      @solution = Day7.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 43_210, @solution.part1
      end
    end

    def test_part2
      @solution.stub(:input, input) do
        assert_equal 43_210, @solution.part2
      end
    end

    private

    def input
      '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0'
    end
  end
end
