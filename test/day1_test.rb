# frozen_string_literal: true

class TestDay1 < Minitest::Test
  def setup
    @solution = Day1.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 11, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 31, @solution.part2
    end
  end

  private

  def input
    '3   4
4   3
2   5
1   3
3   9
3   3
    '
  end
end
