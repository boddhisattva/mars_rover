# frozen_string_literal: true

describe Position do
  let(:terrain) { RectangularPlateau.new(0, 0, 5, 5) }

  describe '#move_vertically_upward' do
    context 'when movement attempted within terrain boundary limits' do
      it 'allows one to go further up the Y axis(imagine a 2D Grid system) by one unit' do
        current_position = described_class.new(1, 3, 'N', terrain)

        current_position.move_vertically_upward

        expect(current_position.x_coordinate).to eq 1
        expect(current_position.y_coordinate).to eq 4
      end
    end

    context 'when movement attempted outside terrain boundary limits' do
      it 'returns an outside boundary limits error with related message' do
        current_position = described_class.new(1, 5, 'N', terrain)

        expect do
          current_position.move_vertically_upward
        end.to raise_error(OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits')
      end
    end
  end

  describe '#move_vertically_downward' do
    context 'when movement attempted within terrain boundary limits' do
      it 'allows one to go further down the Y axis(imagine a 2D Grid system) by one unit' do
        current_position = described_class.new(1, 3, 'S', terrain)

        current_position.move_vertically_downward

        expect(current_position.x_coordinate).to eq 1
        expect(current_position.y_coordinate).to eq 2
      end
    end

    context 'when movement attempted outside terrain boundary limits' do
      it 'returns an outside boundary limits error with related message' do
        current_position = described_class.new(1, 0, 'S', terrain)

        expect do
          current_position.move_vertically_downward
        end.to raise_error(OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits')
      end
    end
  end

  describe '#move_horizontally_forward' do
    context 'when movement attempted within terrain boundary limits' do
      it 'allows one to go a step further horizontally on the  X axis(imagine a 2D Grid system) by one unit' do
        current_position = described_class.new(1, 3, 'E', terrain)

        current_position.move_horizontally_forward

        expect(current_position.x_coordinate).to eq 2
        expect(current_position.y_coordinate).to eq 3
      end
    end

    context 'when movement attempted outside terrain boundary limits' do
      it 'returns an outside boundary limits error with related message' do
        current_position = described_class.new(5, 3, 'E', terrain)

        expect do
          current_position.move_horizontally_forward
        end.to raise_error(OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits')
      end
    end
  end

  describe '#move_horizontally_backward' do
    context 'when movement attempted within terrain boundary limits' do
      it 'allows one to go a step backward horizontally on the X axis(imagine a 2D Grid system) by one unit' do
        current_position = described_class.new(1, 3, 'W', terrain)

        current_position.move_horizontally_backward

        expect(current_position.x_coordinate).to eq 0
        expect(current_position.y_coordinate).to eq 3
      end
    end

    context 'when movement attempted outside terrain boundary limits' do
      it 'returns an outside boundary limits error with related message' do
        current_position = described_class.new(0, 5, 'W', terrain)

        expect do
          current_position.move_horizontally_backward
        end.to raise_error(OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits')
      end
    end
  end

  describe '#get_orientation' do
    it 'returns the current compass based position of a given entity' do
      current_position = described_class.new(1, 3, 'W', terrain)

      expect(current_position.get_orientation).to eq('W')
    end
  end

  describe '#set_orientation' do
    it 'sets a compass based position for a given entity' do
      current_position = described_class.new(1, 3, 'W', terrain)

      current_position.set_orientation('N')

      expect(current_position.orientation).to eq('N')
    end
  end

  describe '#location' do
    it 'returns the current location of a given entity' do
      current_position = described_class.new(1, 3, 'W', terrain)

      expect(current_position.location).to eq('1 3 W')
    end
  end
end
