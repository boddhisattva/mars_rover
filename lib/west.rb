# frozen_string_literal: true

# Details of different kinds of movement with regard to the West direction

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
