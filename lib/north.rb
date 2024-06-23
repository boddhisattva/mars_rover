# frozen_string_literal: true

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
