# frozen_string_literal: true

describe West do
  let(:west) { West.new }

  describe '#short_form' do
    it 'returns an abbreviated equivalent of the West compass direction' do
      expect(west.short_form).to eq('W')
    end
  end

  describe '#left' do
    it 'returns the direction that comes to the left of the West direction' do
      expect(west.left).to be_a South
    end
  end

  describe '#right' do
    it 'returns the direction that comes to the right of the West direction' do
      expect(west.right).to be_a North
    end
  end

  describe '#move' do
    context 'given an entity points in the West direction' do
      it 'moves a step backward horizontally along that path(i.e., along the x-axis)' do
        current_position = Position.new(1, 3, 'W', RectangularPlateau.new(0, 0, 5, 5))

        west.move(current_position)

        expect(current_position.x_coordinate).to eq 0
        expect(current_position.y_coordinate).to eq 3
      end
    end
  end
end
