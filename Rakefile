# frozen_string_literal: true

require 'zeitwerk'

require 'minitest/test_task'

require 'active_support/core_ext/string'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib")
loader.setup

Minitest::TestTask.create
25.times.each do |day_id|
  klass = "day#{day_id}"
  task klass do
    solution = Object.const_get(klass.camelize).new
    puts "Day #{day_id}"
    puts "part 1: #{solution.part1}"
    puts "part 2: #{solution.part2}"
  end
end
