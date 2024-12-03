# frozen_string_literal: true

class TestDay3 < Minitest::Test
  def setup
    @solution = Day3.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 161, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input2) do
      assert_equal 48, @solution.part2
    end
  end

  private

  def input
    'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'
  end

  def input2
    "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
  end
end
