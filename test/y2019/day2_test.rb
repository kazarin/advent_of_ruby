# frozen_string_literal: true

module Y2019
  class TestDay2 < Minitest::Test
    def setup
      @solution = Day2.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 200, @solution.part1
      end
    end

    private

    def input
      '1,9,10,3,2,3,11,0,99,30,40,50,2,4,7,8'
    end
  end
end
