# frozen_string_literal: true

require 'minitest/autorun'
require 'day2'

class TestDay2 < Minitest::Test
  def setup
    @solution = Day2.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 2, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 4, @solution.part2
    end
  end

  private

  def input
    '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'
  end
end
