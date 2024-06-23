# frozen_string_literal: true

class Path
  LEFT = 'L'
  RIGHT = 'R'
  MOVE = 'M'

  def initialize(steps)
    @steps = steps
  end

  attr_reader :steps
end
