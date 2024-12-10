# frozen_string_literal: true

class TestDay9 < Minitest::Test
  def setup
    @solution = Day9.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 1928, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 2858, @solution.part2
    end
  end

  private

  def input
    '2333133121414131402'
  end
end
