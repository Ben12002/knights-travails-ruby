
def valid_move?(visited, pos)
  pos[0].between?(0,7) && pos[1].between?(0,7) && !visited.include?(pos)
end

# returns an array of VALID next moves
def get_next_moves(visited, start_pos)
  next_moves = []
  curr_x = start_pos[0]
  curr_y = start_pos[1]
  next_moves.push([curr_x - 2, curr_y - 1]) if valid_move?(visited, [curr_x - 2, curr_y - 1])
  next_moves.push([curr_x - 1, curr_y - 2]) if valid_move?(visited, [curr_x - 1, curr_y - 2])
  next_moves.push([curr_x - 2, curr_y + 1]) if valid_move?(visited, [curr_x - 2, curr_y + 1])
  next_moves.push([curr_x - 1, curr_y + 2]) if valid_move?(visited, [curr_x - 1, curr_y + 2])
  next_moves.push([curr_x + 1, curr_y - 2]) if valid_move?(visited, [curr_x + 1, curr_y - 2])
  next_moves.push([curr_x + 2, curr_y - 1]) if valid_move?(visited, [curr_x + 2, curr_y - 1])
  next_moves.push([curr_x + 1, curr_y + 2]) if valid_move?(visited, [curr_x + 1, curr_y + 2])
  next_moves.push([curr_x + 2, curr_y + 1]) if valid_move?(visited, [curr_x + 2, curr_y + 1])
  next_moves
end


def knight_moves(curr_pos, end_pos)
  list_of_paths = [[curr_pos]]
  list_of_pos = [curr_pos]
  visited = []

  
  while (list_of_pos.length > 0)
    curr_pos = list_of_pos.shift
    visited.push(curr_pos)
    curr_path = find_path(list_of_paths, curr_pos)

    return curr_path if (curr_pos == end_pos)
    
    get_next_moves(visited, curr_pos).each do |pos|
      # update list of positions
      list_of_pos.push(pos) 
  
      # update list of paths
      copy_path = curr_path[0 .. curr_path.length]
      new_path = copy_path.push(pos) 
      list_of_paths.push(new_path)
    end
  end
end

# returns the first path in list_of_paths that ends with curr_pos
def find_path(list_of_paths, curr_pos)
  list_of_paths.filter{|path| (path[-1] == curr_pos)}[0]
end


p knight_moves([7,7],[7,7])
p knight_moves([0,0],[1,2])
p knight_moves([3,4],[5,2])
p knight_moves([0,0],[0,1])
p knight_moves([0,0],[3,3])
p knight_moves([3,3],[0,0])
p knight_moves([3,3],[0,0])
p knight_moves([0,0],[7,7])
p knight_moves([0,0],[7,0])
