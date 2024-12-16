# frozen_string_literal: true

module Y2024
  class TestDay14 < Minitest::Test
    def setup
      @solution = Day14.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 21, @solution.part1
      end
    end

    private

    def input
      'p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3'
    end
  end
end
