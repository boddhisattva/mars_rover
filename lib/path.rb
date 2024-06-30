# frozen_string_literal: true

# The path & its related steps(like Left, Right etc.,) along which an entity can traverse

class Path
  LEFT = 'L'
  RIGHT = 'R'
  MOVE = 'M'

  def initialize(steps)
    @steps = steps
  end

  def navigate_steps(vehicle, current_direction)
    steps.each_char do |step|
      case step
      when LEFT
        current_direction = vehicle.turn_left(current_direction)
      when RIGHT
        current_direction = vehicle.turn_right(current_direction)
      when MOVE
        current_direction.move(vehicle.get_current_position)
      else
        raise InvalidStepError, 'Invalid step in path'
      end
    end
  end

  private

  attr_reader :steps
end
