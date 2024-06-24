# frozen_string_literal: true

describe Rover do
  let(:terrain) { RectangularPlateau.new(0, 0, 5, 5) }

  it 'has a COMPASS_DIRECTION constant' do
    expect(Rover::COMPASS_DIRECTION).to eq({
                                             'N' => 'North',
                                             'S' => 'South',
                                             'W' => 'West',
                                             'E' => 'East'
                                           })
  end

  describe '#traverse' do
    context 'when given a rover that wants to travel through a valid path in a given terrain' do
      it 'explores the terrain based on the specified navigation path' do
        path1 = Path.new('LMLMLMLMM')
        path2 = Path.new('MMRMMRMRRML')

        rover1 = described_class.new(Position.new(1, 2, 'N', terrain))
        rover1.traverse(path1)

        rover2 = described_class.new(Position.new(1, 2, 'E', terrain))
        rover2.traverse(path2)

        expect(rover1.current_location).to eq('1 3 N')
        expect(rover2.current_location).to eq('3 0 N')
      end
    end

    context 'when given a rover that wants to travel through an invalid path in a given terrain' do
      it 'returns an Invalid Step Error error with an appropriate error message related to an invalid step' do
        path1 = Path.new('LMLMLSMLMM')

        rover1 = described_class.new(Position.new(1, 2, 'N', terrain))
        expect { rover1.traverse(path1) }.to raise_error(InvalidStepError, 'Invalid step in path')
      end
    end

    context 'when rover movement is attempted outside terrain boundary limits' do
      it 'returns an outside boundary limits error with related message' do
        path1 = Path.new('LMLM')
        rover1 = described_class.new(Position.new(5, 0, 'S', terrain))

        expect do
          rover1.traverse(path1)
        end.to raise_error(OutsideBoundaryLimitsError, 'Movement not permissible outside terrain boundary limits')
      end
    end
  end

  describe '#current_location' do
    context 'when given a rover that is present at a specified position' do
      it 'returns the current location of that rover' do
        rover1 = described_class.new(Position.new(1, 2, 'N', terrain))

        expect(rover1.current_location).to eq('1 2 N')
      end
    end
  end
end
