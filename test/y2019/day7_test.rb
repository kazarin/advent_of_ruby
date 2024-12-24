# frozen_string_literal: true

module Y2019
  class TestDay7 < Minitest::Test
    def setup
      @solution = Day7.new
    end

    def test_part1
      @solution.stub(:input, input) do
        assert_equal 43_210, @solution.part1
      end
    end

    def test_part2
      @solution.stub(:input, input2) do
        assert_equal 139_629_729, @solution.part2
      end
    end

    private

    def input
      '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0'
    end

    def input2
      '3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,
27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5'
    end
  end
end
