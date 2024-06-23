# frozen_string_literal: true

class East
  def short_form
    'E'
  end

  def left
    North.new
  end

  def right
    South.new
  end

  def move(current_position)
    current_position.move_horizontally_forward
  end
end
