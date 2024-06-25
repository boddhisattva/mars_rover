# frozen_string_literal: true

# Details of different kinds of movement with regard to the South direction

class South
  def short_form
    'S'
  end

  def left
    East.new
  end

  def right
    West.new
  end

  def move(current_position)
    current_position.move_vertically_downward
  end
end
