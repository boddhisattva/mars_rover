# frozen_string_literal: true

describe North do
  let(:north) { described_class.new }

  describe '#short_form' do
    it 'returns an abbreviated equivalent of the North direction' do
      expect(north.short_form).to eq('N')
    end
  end

  describe '#left' do
    it 'returns the direction that comes to the left of the North direction' do
      expect(north.left).to be_a West
    end
  end

  describe '#right' do
    it 'returns the direction that comes to the right of the North direction' do
      expect(north.right).to be_a East
    end
  end

  describe '#move' do
    context 'when an entity points in the North direction' do
      it 'moves a step upward vertically along that path(i.e., along the y-axis)' do
        current_position = Position.new(1, 3, 'N', RectangularPlateau.new(0, 0, 5, 5))

        north.move(current_position)

        expect(current_position.x_coordinate).to eq 1
        expect(current_position.y_coordinate).to eq 4
      end
    end
  end
end
