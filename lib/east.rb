# frozen_string_literal: true

# Details of different kinds of movement with regard to the East direction

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
