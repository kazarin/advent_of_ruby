# frozen_string_literal: true

class TestDay8 < Minitest::Test
  def setup
    @solution = Day8.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 14, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 34, @solution.part2
    end
  end

  private

  def input # rubocop:disable Metrics/MethodLength
    '............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............'
  end
end
