# frozen_string_literal: true

describe RoverPosition do
  describe '#move_vertically_upward' do
    it 'allows one to go further up the Y axis(for e.g., in imagine a 2 Dimensional Grid system) by one unit' do
      current_position = RoverPosition.new(1, 3, 'N')

      current_position.move_vertically_upward

      expect(current_position.x_coordinate).to eq 1
      expect(current_position.y_coordinate).to eq 4
    end
  end

  describe '#move_vertically_downward' do
    it 'allows one to go further down the Y axis(for e.g., in imagine a 2 Dimensional Grid system) by one unit' do
      current_position = RoverPosition.new(1, 3, 'S')

      current_position.move_vertically_downward

      expect(current_position.x_coordinate).to eq 1
      expect(current_position.y_coordinate).to eq 2
    end
  end

  describe '#move_horizontally_forward' do
    it 'allows one to go a step further horizontally on the  X axis(for e.g., in imagine a 2 Dimensional Grid system) by one unit' do
      current_position = RoverPosition.new(1, 3, 'E')

      current_position.move_horizontally_forward

      expect(current_position.x_coordinate).to eq 2
      expect(current_position.y_coordinate).to eq 3
    end
  end

  describe '#move_horizontally_backward' do
    it 'allows one to go a step backward horizontally on the X axis(for e.g., in imagine a 2 Dimensional Grid system) by one unit' do
      current_position = RoverPosition.new(1, 3, 'W')

      current_position.move_horizontally_backward

      expect(current_position.x_coordinate).to eq 0
      expect(current_position.y_coordinate).to eq 3
    end
  end

  describe '#get_orientation' do
    it 'returns the current compass based position of a given entity' do
      current_position = RoverPosition.new(1, 3, 'W')

      expect(current_position.get_orientation).to eq('W')
    end
  end

  describe '#set_orientation' do
    it 'sets a compass based position for a given entity' do
      current_position = RoverPosition.new(1, 3, 'W')

      current_position.set_orientation('N')

      expect(current_position.orientation).to eq('N')
    end
  end

  describe '#location' do
    it 'returns the current location of a given entity' do
      current_position = RoverPosition.new(1, 3, 'W')

      expect(current_position.location).to eq('1 3 W')
    end
  end
end
