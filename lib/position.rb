# frozen_string_literal: true

# Ensures that an entity makes the movement by one unit in either
# of the four compass directions - North, South, East, West

class OutsideBoundaryLimitsError < StandardError; end

class Position
  def initialize(x_coordinate, y_coordinate, orientation, terrain)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @orientation = orientation
    @terrain = terrain
  end

  attr_reader :y_coordinate, :x_coordinate, :orientation, :terrain

  def move_vertically_upward
    unless terrain.upward_vertical_movement_permissible?(y_coordinate)
      raise OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits'
    end

    self.y_coordinate += 1
  end

  def move_vertically_downward
    unless terrain.downward_vertical_movement_permissible?(y_coordinate)
      raise OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits'
    end

    self.y_coordinate -= 1
  end

  def move_horizontally_forward
    unless terrain.forward_horizontal_movement_permissible?(x_coordinate)
      raise OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits'
    end

    self.x_coordinate += 1
  end

  def move_horizontally_backward
    unless terrain.backward_horizontal_movement_permissible?(x_coordinate)
      raise OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits'
    end

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
