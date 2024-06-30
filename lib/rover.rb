# frozen_string_literal: true

# Ensures the overall rover movement can happen along a specific path
# and within a given terrain

class InvalidStepError < StandardError; end

require_relative 'north'
require_relative 'south'
require_relative 'east'
require_relative 'west'

class Rover
  COMPASS_DIRECTION = {
    'N' => 'North',
    'S' => 'South',
    'W' => 'West',
    'E' => 'East'
  }.freeze

  def initialize(current_position)
    @current_position = current_position
  end

  def get_current_position
    current_position
  end

  def traverse(path)
    path.navigate_steps(self, original_direction)
  end

  def current_location
    current_position.location
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

  private

  attr_reader :current_position

  def original_direction
    Object.const_get(COMPASS_DIRECTION[current_position.get_orientation]).new
  end
end
