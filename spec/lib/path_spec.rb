# frozen_string_literal: true

describe Path do
  it 'has a LEFT constant' do
    expect(Path::LEFT).to eq('L')
  end

  it 'has a RIGHT constant' do
    expect(Path::RIGHT).to eq('R')
  end

  it 'has a MOVE constant' do
    expect(Path::MOVE).to eq('M')
  end

  describe '#navigate_steps' do
    let(:terrain) { RectangularPlateau.new(0, 0, 5, 5) }

    context 'when a vehicle pointing in a specific direction has a path to navigate' do
      it 'navigates each step within that path' do
        path1 = described_class.new('LMLMLMLMM')
        rover1 = Rover.new(Position.new(1, 2, 'N', terrain))
        path1.navigate_steps(rover1, North.new)

        expect(rover1.current_location).to eq('1 3 N')
      end
    end

    context 'when a vehicle travels through an invalid path in a given terrain' do
      it 'returns an Invalid Step Error error with an appropriate error message related to an invalid step' do
        path1 = described_class.new('LMLMLSMLMM')
        rover1 = Rover.new(Position.new(1, 2, 'N', terrain))

        expect { path1.navigate_steps(rover1, North.new) }.to raise_error(InvalidStepError, 'Invalid step in path')
      end
    end
  end
end
