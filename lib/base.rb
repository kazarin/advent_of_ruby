# frozen_string_literal: true

class Base
  def input
    day_id = self.class.name.to_s.downcase
    @input ||= File.read("input/#{day_id}.txt")
  end
end
