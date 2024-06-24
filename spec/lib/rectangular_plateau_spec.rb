# frozen_string_literal: true

describe RectangularPlateau do
  let(:terrain) { RectangularPlateau.new(0, 0, 5, 5) }

  describe '#upward_vertical_movement_permissible?' do
    context 'when an entity wants to move vertically upward along the Y-axis' do
      context 'movement is within terrain boundary limits' do
        it 'returns true' do
          current_position = Position.new(1, 3, 'N', terrain)

          expect(terrain.upward_vertical_movement_permissible?(current_position.y_coordinate)).to be true
        end
      end

      context 'movement is outside terrain boundary limits' do
        it 'returns false' do
          current_position = Position.new(1, 5, 'N', terrain)

          expect(terrain.upward_vertical_movement_permissible?(current_position.y_coordinate)).to be false
        end
      end
    end
  end

  describe '#downward_vertical_movement_permissible?' do
    context 'when an entity wants to move vertically downward along the Y-axis' do
      context 'movement is within terrain boundary limits' do
        it 'returns true' do
          current_position = Position.new(1, 3, 'S', terrain)

          expect(terrain.downward_vertical_movement_permissible?(current_position.y_coordinate)).to be true
        end
      end

      context 'movement is outside terrain boundary limits' do
        it 'returns false' do
          current_position = Position.new(1, 0, 'S', terrain)

          expect(terrain.downward_vertical_movement_permissible?(current_position.y_coordinate)).to be false
        end
      end
    end
  end

  describe '#forward_horizontal_movement_permissible?' do
    context 'when an entity wants to move horizontally forward along the X-axis' do
      context 'movement is within terrain boundary limits' do
        it 'returns true' do
          current_position = Position.new(1, 3, 'E', terrain)

          expect(terrain.forward_horizontal_movement_permissible?(current_position.x_coordinate)).to be true
        end
      end

      context 'movement is outside terrain boundary limits' do
        it 'returns false' do
          current_position = Position.new(5, 3, 'E', terrain)

          expect(terrain.forward_horizontal_movement_permissible?(current_position.x_coordinate)).to be false
        end
      end
    end
  end

  describe '#backward_horizontal_movement_permissible?' do
    context 'when an entity wants to move horizontally backward along the X-axis' do
      context 'movement is within terrain boundary limits' do
        it 'returns true' do
          current_position = Position.new(1, 3, 'W', terrain)

          expect(terrain.backward_horizontal_movement_permissible?(current_position.x_coordinate)).to be true
        end
      end

      context 'movement is outside terrain boundary limits' do
        it 'returns false' do
          current_position = Position.new(0, 5, 'W', terrain)

          expect(terrain.backward_horizontal_movement_permissible?(current_position.x_coordinate)).to be false
        end
      end
    end
  end
end
