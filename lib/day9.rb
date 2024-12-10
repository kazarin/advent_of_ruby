# frozen_string_literal: true

class Day9 < Base
  def part1
    start = 0
    output = []
    input.chars.map(&:to_i).each_slice(2) do |files, free_space|
      output += [start] * files
      output += [nil] * free_space if free_space
      start += 1
    end
    left = 0
    right = output.length - 1

    while left < right
      if !output[left].nil?
        left += 1
      elsif output[right].nil?
        right -= 1
      else
        output[left] = output[right]
        output[right] = nil
      end
    end
    result = 0
    output.each_with_index do |n, index|
      result += n.to_i * index if n
    end
    result
  end

  def part2
    start = 0
    output = []
    sizes = {}

    files_indexes = {}
    current = 0

    input.chars.map(&:to_i).each_slice(2) do |files, free_space|
      sizes[start] = files
      files_indexes[start] = current

      output += [start] * files
      output += [nil] * free_space if free_space
      current += files + (free_space || 0)
      start += 1
    end

    right = output.length
    sizes.to_a.reverse.to_h.each do |n, need|
      left = 0
      while left < output.length
        if output[left...left + need].all?(&:nil?) && left + need < output.length && left + need < right
          need.times do |i|
            output[left + i] = n
            output[files_indexes[n] + i] = nil
          end
          right = files_indexes[n]
          break
        else
          left += 1
        end
      end
    end
    result = 0
    output.each_with_index do |n, index|
      result += n.to_i * index if n
    end
    result
  end
end
