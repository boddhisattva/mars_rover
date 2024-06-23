# frozen_string_literal: true

class West
  def short_form
    'W'
  end

  def left
    South.new
  end

  def right
    North.new
  end

  def move(current_position)
    current_position.move_horizontally_backward
  end
end
