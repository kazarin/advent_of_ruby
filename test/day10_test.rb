# frozen_string_literal: true

class TestDay10 < Minitest::Test
  def setup
    @solution = Day10.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 36, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 81, @solution.part2
    end
  end

  private

  def input
    '89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732'
  end
end
