# frozen_string_literal: true

require_relative '../lib/rover'
require_relative '../lib/rover_position'
require_relative '../lib/path'
require_relative '../lib/rectangular_plateau'
require 'pry' # Handy for debugging purposes

terrain = RectangularPlateau.new(5, 5)

path1 = Path.new('LMLMLMLMM')
path2 = Path.new('MMRMMRMRRM')

rover_1 = Rover.new(RoverPosition.new(1, 2, 'N'), terrain)
rover_2 = Rover.new(RoverPosition.new(3, 3, 'E'), terrain)

rover_1.traverse(path1)
puts rover_1.current_position.location

rover_2.traverse(path2)
puts rover_2.current_position.location
