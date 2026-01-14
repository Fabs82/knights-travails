# Knight class representing the knight piece of Chess
class Knight
  def initialize(name)
    @name = name
    @movements = [[+2, +1], [+2, -1], [-2, +1], [-2, -1], [+1, +2], [-1, +2], [+1, -2], [-1, -2]]
  end

  def knight_moves(start_coord, end_coord)
    # Method that show the shortest possible way to get from one position to another
    return start_coord if start_coord == end_coord

    queue = []
    visited = {}
    visited[start_coord] = nil
    queue << start_coord

    until queue.empty?
      # add the first couple of coord in the queue ro the variable
      current = queue.shift
      valid_moves = []
      @movements.each do |move|
        # check the available moves and add the valid ones to the array
        if is_valid?(move[0] + current[0], move[1] + current[1])
          valid_moves << [move[0] + current[0], move[1] + current[1]]
        end
      end

      valid_moves.each do |move|
        next if visited.key?(move)

        visited[move] = current
        if move == end_coord
          # rebuild the path from value to key until value is nil (the initial root coordinates)
          path = rebuild_path(move, visited)
          puts "You made in #{path.length - 1} moves! Here is your path:\n#{path}"

          return path
        end
        queue << move
      end
    end
  end

  def is_valid?(coord_x, coord_y)
    # check if arrival position is valid
    coord_x.between?(0, 7) && coord_y.between?(0, 7)
  end

  def rebuild_path(move, visited)
    path = []
    position = move

    until position.nil?
      path << position
      position = visited[position]
    end
    path.reverse
  end
end

glinka = Knight.new('Glinka')

glinka.knight_moves([3, 3], [3, 3])
