# frozen_string_literal: true

class TestDay7 < Minitest::Test
  def setup
    @solution = Day7.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 3749, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 11_387, @solution.part2
    end
  end

  private

  def input
    '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'
  end
end
