# frozen_string_literal: true

class Day13 < Base
  def part1
    input.split("\n\n").sum do |machine|
      rows = machine.split("\n")
      calculate_buttons(rows, 0)
    end.to_i
  end

  def part2
    input.split("\n\n").sum do |machine|
      rows = machine.split("\n")
      calculate_buttons(rows, 10_000_000_000_000)
    end.to_i
  end

  private

  def fetch_digits(row)
    row.scan(/\d+/).map(&:to_f)
  end

  def calculate_buttons(rows, increase)
    r1, r2 = fetch_digits(rows[0])
    l1, l2 = fetch_digits(rows[1])
    r0, l0 = fetch_digits(rows[2])
    r0 += increase
    l0 += increase

    # it is just a system of linear equations
    x = ((r0 * l2) - (l1 * l0)) / ((r1 * l2) - (l1 * r2))
    y = ((r1 * l0) - (r0 * r2)) / ((r1 * l2) - (l1 * r2))
    return 0 if x % 1 != 0 || y % 1 != 0

    (x * 3) + (y * 1)
  end
end
