# frozen_string_literal: true

require_relative 'north'
require_relative 'south'
require_relative 'east'
require_relative 'west'

class Rover
  def initialize(current_position)
    @current_position = current_position
  end

  attr_reader :current_position

  COMPASS_DIRECTION = {
    'N' => 'North',
    'S' => 'South',
    'W' => 'West',
    'E' => 'East'
  }.freeze

  def traverse(path)
    current_direction = original_direction

    path.steps.each_char do |step|
      case step
      when Path::LEFT
        current_direction = turn_left(current_direction)
      when Path::RIGHT
        current_direction = turn_right(current_direction)
      when Path::MOVE
        current_direction.move(current_position)
      else
        raise 'Invalid step in path'
      end
    end
  end

  private

  def original_direction
    Object.const_get(COMPASS_DIRECTION[current_position.get_orientation]).new
  end

  def turn_left(current_direction)
    current_direction = current_direction.left
    current_position.set_orientation(current_direction.short_form)
    current_direction
  end

  def turn_right(current_direction)
    current_direction = current_direction.right
    current_position.set_orientation(current_direction.short_form)
    current_direction
  end
end
