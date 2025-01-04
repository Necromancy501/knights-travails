class Knight

  def initialize start_coordinates
    @position = start_coordinates
  end

  def valid_move? coordinates
    case coordinates
    in [0..7, 0..7]
      return true
    else
      return false
    end    
  end

  def filter_moves array
    array.filter {|coordinates| self.valid_move? coordinates}
  end

  def possible_moves coordinates = @position
    vector = [2,1]
    results = []
  
    # Generate all permutations of vector with ±1 scalar multiplication
    permutations = [
      [vector[0], vector[1]],
      [vector[0], -vector[1]],
      [-vector[0], vector[1]],
      [-vector[0], -vector[1]],
      [vector[1], vector[0]],
      [vector[1], -vector[0]],
      [-vector[1], vector[0]],
      [-vector[1], -vector[0]]
    ]
  
    # Add each permutation to coordinates
    permutations.each do |perm|
      results << [coordinates[0] + perm[0], coordinates[1] + perm[1]]
    end
  
    self.filter_moves results

  end

  def knight_moves(start, target)
    return [start] if start == target

    queue = LinkedList.new
    visited = HashSet.new
    queue.append([start])
    visited.set([start])

    until queue.empty?
      path = queue.shift.value
      current_position = path.last

      possible_moves(current_position).each do |move|
        next if visited.has?(move)

        new_path = path + [move]
        return new_path if move == target

        queue.append new_path
        visited.set(move)
      end
    end
  end

  def display_path start, target
    path = knight_moves start, target
    move_str = path.size == 1 ? "move" : "moves"
    puts "You made it in #{path.size} #{move_str}! Here's your path:\n"
    path.each {|move| puts "#{move}\n"}
  end

end
