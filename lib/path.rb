# frozen_string_literal: true

# The path & its related steps(like Left, Right etc.,) along which an entity can traverse

class Path
  LEFT = 'L'
  RIGHT = 'R'
  MOVE = 'M'

  def initialize(steps)
    @steps = steps
  end

  attr_reader :steps
end
