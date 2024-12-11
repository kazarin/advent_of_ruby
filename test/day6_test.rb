# frozen_string_literal: true

class TestDay6 < Minitest::Test
  def setup
    @solution = Day6.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 41, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 6, @solution.part2
    end
  end

  private

  def input
    '....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...'
  end
end
