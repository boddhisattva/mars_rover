# frozen_string_literal: true

describe Rover do
  describe '#traverse' do
    context 'when given a rover that wants to travel through a valid path in a given terrain' do
      it 'explores the terrain based on the specified navigation path' do
        terrain = RectangularPlateau.new(5, 5)
        path1 = Path.new('LMLMLMLMM')
        path2 = Path.new('MMRMMRMRRML')

        rover_1 = Rover.new(RoverPosition.new(1, 2, 'N'), terrain)
        rover_1.traverse(path1)

        rover_2 = Rover.new(RoverPosition.new(1, 2, 'E'), terrain)
        rover_2.traverse(path2)

        expect(rover_1.current_position.location).to eq('1 3 N')
        expect(rover_2.current_position.location).to eq('3 0 N')
      end
    end

    context 'when given a rover that wants to travel through an invalid path in a given terrain' do
      it 'explores the terrain based on the specified navigation path' do
        terrain = RectangularPlateau.new(5, 5)
        path1 = Path.new('LMLMLSMLMM')

        rover_1 = Rover.new(RoverPosition.new(1, 2, 'N'), terrain)
        expect { rover_1.traverse(path1) }.to raise_error('Invalid step in path')
      end
    end
  end
end
