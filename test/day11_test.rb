# frozen_string_literal: true

class TestDay11 < Minitest::Test
  def setup
    @solution = Day11.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 55_312, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      # assert_equal 65_601_038_650_482, @solution.part2
    end
  end

  private

  def input
    # '0 1 10 99 999'
    '125 17'
  end
end
