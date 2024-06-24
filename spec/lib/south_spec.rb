# frozen_string_literal: true

describe South do
  let(:south) { described_class.new }

  describe '#short_form' do
    it 'returns an abbreviated equivalent of the South compass direction' do
      expect(south.short_form).to eq('S')
    end
  end

  describe '#left' do
    it 'returns the direction that comes to the left of the South direction' do
      expect(south.left).to be_a East
    end
  end

  describe '#right' do
    it 'returns the direction that comes to the right of the South direction' do
      expect(south.right).to be_a West
    end
  end

  describe '#move' do
    context 'when an entity points in the South direction' do
      it 'moves a step downward vertically along that path(i.e., along the y-axis)' do
        current_position = Position.new(1, 3, 'S', RectangularPlateau.new(0, 0, 5, 5))

        south.move(current_position)

        expect(current_position.x_coordinate).to eq 1
        expect(current_position.y_coordinate).to eq 2
      end
    end
  end
end
