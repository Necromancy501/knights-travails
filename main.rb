require_relative 'lib/knight'
require_relative 'lib/linked_list'
require_relative 'lib/hashset'

piece = Knight.new [0,0]
p piece.display_path([0,3],[6,4])