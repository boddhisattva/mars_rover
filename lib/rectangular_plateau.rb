# frozen_string_literal: true

# This is the terrain within which actual permissible movement is checked

class RectangularPlateau
  def initialize(lower_x_coordinate, lower_y_coordinate, upper_x_coordinate, upper_y_coordinate)
    @lower_x_coordinate = lower_x_coordinate
    @lower_y_coordinate = lower_y_coordinate
    @upper_x_coordinate = upper_x_coordinate
    @upper_y_coordinate = upper_y_coordinate
  end

  def upward_vertical_movement_permissible?(y_position)
    y_position >= lower_y_coordinate &&
      y_position < upper_y_coordinate
  end

  def downward_vertical_movement_permissible?(y_position)
    y_position > lower_y_coordinate &&
      y_position <= upper_y_coordinate
  end

  def forward_horizontal_movement_permissible?(x_position)
    x_position >= lower_x_coordinate &&
      x_position < upper_x_coordinate
  end

  def backward_horizontal_movement_permissible?(x_position)
    x_position > lower_x_coordinate &&
      x_position <= upper_x_coordinate
  end

  private

  attr_reader :lower_x_coordinate, :lower_y_coordinate, :upper_x_coordinate, :upper_y_coordinate
end
