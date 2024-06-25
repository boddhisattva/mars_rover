# frozen_string_literal: true

# Details of different kinds of movement with regard to the North direction

class North
  def short_form
    'N'
  end

  def left
    West.new
  end

  def right
    East.new
  end

  def move(current_position)
    current_position.move_vertically_upward
  end
end
