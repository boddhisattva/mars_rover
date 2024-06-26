# frozen_string_literal: true

require_relative '../lib/rover'
require_relative '../lib/position'
require_relative '../lib/path'
require_relative '../lib/rectangular_plateau'
require 'pry' # Handy for debugging purposes

terrain = RectangularPlateau.new(0, 0, 5, 5)

path1 = Path.new('LMLMLMLMM')
path2 = Path.new('MMRMMRMRRM')

rover1 = Rover.new(Position.new(1, 2, 'N', terrain))
rover2 = Rover.new(Position.new(3, 3, 'E', terrain))

rover1.traverse(path1)
puts rover1.current_location

rover2.traverse(path2)
puts rover2.current_location
