require_relative '../lib/rover'
require_relative '../lib/rover_position'
require_relative '../lib/path'
require_relative '../lib/rectangular_plateau'

terrain = RectangularPlateau.new(5, 5)

path1 = Path.new('LMLMLMLMM')
path2 = Path.new('LMLMLMLMM')

rover_1 = Rover.new(RoverPosition.new(1, 2, 'N'), terrain)
rover_2 = Rover.new(RoverPosition.new(3, 3, 'E'), terrain)
