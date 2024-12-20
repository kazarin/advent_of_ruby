# frozen_string_literal: true

module Y2019
  class TestDay6 < Minitest::Test
    def setup
      @solution = Day6.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 54, @solution.part1
      end
    end

    def test_part2
      @solution.stub(:input, input) do
        assert_equal 4, @solution.part2
      end
    end

    private

    def input
      'COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN'
    end
  end
end
