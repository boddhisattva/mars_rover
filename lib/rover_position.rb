# frozen_string_literal: true

class RoverPosition
  def initialize(x_coordinate, y_coordinate, orientation)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @orientation = orientation
  end

  attr_reader :y_coordinate, :x_coordinate, :orientation

  def move_vertically_upward
    self.y_coordinate += 1
  end

  def move_vertically_downward
    self.y_coordinate -= 1
  end

  def move_horizontally_forward
    self.x_coordinate += 1
  end

  def move_horizontally_backward
    self.x_coordinate -= 1
  end

  def set_orientation(new_orientation)
    self.orientation = new_orientation
  end

  def get_orientation
    orientation
  end

  def location
    "#{x_coordinate} #{y_coordinate} #{orientation}"
  end

  private

  attr_writer :y_coordinate, :x_coordinate, :orientation
end
