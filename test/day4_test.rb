# frozen_string_literal: true

class TestDay4 < Minitest::Test
  def setup
    @solution = Day4.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 18, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 9, @solution.part2
    end
  end

  private

  def input # rubocop:disable Metrics/MethodLength
    'MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
'
  end
end
