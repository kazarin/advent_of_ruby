# frozen_string_literal: true

class Base
  def input
    day_id = self.class.name.to_s.downcase.split('::').join('/')
    @input ||= File.read("input/#{day_id}.txt")
  end
end
