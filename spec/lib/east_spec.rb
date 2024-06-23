# frozen_string_literal: true

describe East do
  let(:east) { East.new }

  describe '#short_form' do
    it 'returns an abbreviated equivalent of the East compass direction' do
      expect(east.short_form).to eq('E')
    end
  end

  describe '#left' do
    it 'returns the direction that comes to the left of the East direction' do
      expect(east.left).to be_a North
    end
  end

  describe '#right' do
    it 'returns the direction that comes to the right of the East direction' do
      expect(east.right).to be_a South
    end
  end

  describe '#move' do
    context 'given an entity points in the East direction' do
      it 'moves a step forward horizontally along that path(i.e., along the x-axis)' do
        current_position = RoverPosition.new(1, 3, 'E')

        east.move(current_position)

        expect(current_position.x_coordinate).to eq 2
        expect(current_position.y_coordinate).to eq 3
      end
    end
  end
end
