# frozen_string_literal: true

module Y2019
  class TestDay4 < Minitest::Test
    def setup
      @solution = Day4.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 34, @solution.part1
      end
    end

    def test_part2
      @solution.stub(:input, input) do
        assert_equal 27, @solution.part2
      end
    end

    private

    def input
      '123334-123455'
    end
  end
end
