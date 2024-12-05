# frozen_string_literal: true

class TestDay5 < Minitest::Test
  def setup
    @solution = Day5.new
  end

  def test_part1
    @solution.stub(:input, input) do
      assert_equal 143, @solution.part1
    end
  end

  def test_part2
    @solution.stub(:input, input) do
      assert_equal 123, @solution.part2
    end
  end

  private

  def input # rubocop:disable Metrics/MethodLength
    '47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47'
  end
end
